import 'package:firm_rex/controller/get_user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditUserProfile extends StatefulWidget {
  final VoidCallback onSave;  // Callback function to refresh user profile

  EditUserProfile({required this.onSave}); // Accept the callback in the constructor

  @override
  _EditDetailsDialogState createState() => _EditDetailsDialogState();
}

class _EditDetailsDialogState extends State<EditUserProfile> {
  final _formKey = GlobalKey<FormState>();

  final _updateUser = GetUser();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? selectedGender;

  // Method to fetch user details from Firestore
  Future<void> fetchUserDetails() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          // Handle empty string or null values and set empty text
          nameController.text = userDoc['UserName'] == '' ? '' : userDoc['UserName'] ?? '';
          ageController.text = userDoc['Age'] == '' ? '' : userDoc['Age']?.toString() ?? '';
          numberController.text = userDoc['Phone Number'] == '' ? '' : userDoc['Phone Number']?.toString() ?? '';
          addressController.text = userDoc['Address'] == '' ? '' : userDoc['Address'] ?? '';
          selectedGender = userDoc['Gender'] == '' ? null : userDoc['Gender'];
        });
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserDetails(); // Fetch user details on widget load
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Details"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField("UserName", nameController),
              _buildTextField("Age", ageController),
              _buildTextField("Phone Number", numberController),
              _buildTextField("Address", addressController),
              _buildDropdownField("Gender"),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate() && selectedGender != null) {
              await _updateUser.updateUserDetails(
                nameController.text.trim(),
                int.parse(ageController.text.trim()),
                int.parse(numberController.text.trim()),
                addressController.text.trim(),
                selectedGender!,
                context,
              );

              widget.onSave();  // Call the callback to refresh the user profile

              Navigator.of(context).pop(); // Close dialog
            } else if (selectedGender == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select a gender")),
              );
            }
          },
          child: const Text("Save"),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "$label cannot be empty";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        value: selectedGender, // Allow null value for gender
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: ["Male", "Female", "Other"]
            .map((gender) => DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value; // Set gender to null if necessary
          });
        },
        validator: (value) {
          // The gender can be null, so we show a validation error only if gender is not selected
          if (value == null) {
            return "Please select a gender";
          }
          return null;
        },
      ),
    );
  }
}
