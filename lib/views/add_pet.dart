import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/controller/pet_controller.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();
  final _petController = PetController();

  List<Map<String, dynamic>> _pets = [];
  late TextEditingController petName;
  late TextEditingController breedName;
  String? gender;
  late TextEditingController age;
  late TextEditingController color;
  late TextEditingController height;
  late TextEditingController weight;
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    petName = TextEditingController();
    breedName = TextEditingController();
    age = TextEditingController();
    color = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    _refreshPetList(); // Initial load of pet list
  }

  @override
  void dispose() {
    petName.dispose();
    breedName.dispose();
    age.dispose();
    color.dispose();
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => _pickedImage = File(image.path));
  }

  Future<void> _refreshPetList() async {
    try {
      final pets = await _petController.getAllPets();
      setState(() {
        _pets = pets;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error refreshing pet list: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Add Pets"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfile(selectedIndex: 4)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Added Pets", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildPetList(),
              const SizedBox(height: 20),
              const Text("Pet Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetList() {
    return RefreshIndicator(
      onRefresh: _refreshPetList,
      child: _pets.isEmpty
          ? const Center(child: Text("No pets added yet."))
          : ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final pet = _pets[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: pet['image']?.startsWith('http') ?? false
                    ? NetworkImage(pet['image'])
                    : FileImage(File(pet['image'])) as ImageProvider,
              ),
              title: Text(pet['name'] ?? 'Unknown'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(petName, "Pet Name", "Please enter pet name"),
          const SizedBox(height: 16),
          _buildTextField(breedName, "Breed Name", "Please enter breed name"),
          const SizedBox(height: 16),
          _buildDropdownField("Gender"),
          const SizedBox(height: 16),
          _buildTextField(age, "Age", "Please enter age"),
          const SizedBox(height: 16),
          _buildColorAndHeightFields(),
          const SizedBox(height: 16),
          _buildTextField(weight, "Weight in (kg)", "Please enter weight"),
          const SizedBox(height: 20),
          _buildImagePicker(),
          const SizedBox(height: 20),
          _buildAddPetButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      validator: (value) => value == null || value.isEmpty ? validationMessage : null,
    );
  }

  Widget _buildColorAndHeightFields() {
    return Row(
      children: [
        Expanded(child: _buildTextField(color, "Colour", "Please enter colour")),
        const SizedBox(width: 10),
        Expanded(child: _buildTextField(height, "Height in (foot)", "Please enter height")),
      ],
    );
  }

  Widget _buildDropdownField(String label) {
    return DropdownButtonFormField<String>(
      value: gender,
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      items: ["Male", "Female"]
          .map((gender) => DropdownMenuItem<String>(value: gender, child: Text(gender)))
          .toList(),
      onChanged: (value) => setState(() => gender = value),
      validator: (value) => value == null ? "Please select a gender" : null,
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        if (_pickedImage != null)
          Image.file(_pickedImage!, height: 100, width: 100, fit: BoxFit.cover)
        else
          const Text("No image selected"),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: _pickImage,
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload Image"),
        ),
      ],
    );
  }

  Widget _buildAddPetButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 50)),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            await _petController.addNewPet(
              petName.text.trim(),
              breedName.text.trim(),
              gender!,
              int.tryParse(age.text.trim()) ?? 0,
              color.text.trim(),
              double.tryParse(height.text.trim()) ?? 0.0,
              double.tryParse(weight.text.trim()) ?? 0.0,
              _pickedImage?.path ?? 'images/profile.png',
              FirebaseAuth.instance.currentUser?.uid ?? '',
            );
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Pet added successfully!")));

            setState(() {
              petName.clear();
              breedName.clear();
              gender = null;
              age.clear();
              color.clear();
              height.clear();
              weight.clear();
              _pickedImage = null;
            });

            await _refreshPetList();
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Error adding pet: $e")));
          }
        }
      },
      child: const Text("Add Pet"),
    );
  }
}
