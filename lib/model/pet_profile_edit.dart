import 'package:flutter/material.dart';


class EditPetProfile extends StatefulWidget {
  @override
  _EditDetailsDialogState createState() => _EditDetailsDialogState();
}

class _EditDetailsDialogState extends State<EditPetProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedGender;

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
              _buildTextField("Name", nameController),
              _buildTextField("Age", ageController),
              _buildTextField("Weight", weightController),
              _buildTextField("Height", heightController),
              _buildTextField("Color", colorController),
              _buildDropdownField("Gender"),
              _buildTextField("Description", descriptionController, maxLines: 3),
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
          onPressed: () {
            if (_formKey.currentState!.validate() && selectedGender != null) {
              // Perform update logic
              print("Name: ${nameController.text}");
              print("Age: ${ageController.text}");
              print("Weight: ${weightController.text}");
              print("Height: ${heightController.text}");
              print("Color: ${colorController.text}");
              print("Gender: $selectedGender");
              print("Description: ${descriptionController.text}");
              Navigator.of(context).pop(); // Close dialog
            } else if (selectedGender == null) {
              // Show error if gender is not selected
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
        value: selectedGender,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: ["Male", "Female"]
            .map((gender) => DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select a gender";
          }
          return null;
        },
      ),
    );
  }
}
