import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();

  // List to store pet details
  final List<Map<String, String>> _pets = [
    {
      'name': 'Bella',
      'image': 'https://i.pinimg.com/736x/2d/ea/58/2dea58806ba0515c6903f6ec24be677f.jpg',
    },
    {
      'name': 'Roudy',
      'image': 'https://i.pinimg.com/736x/53/dd/59/53dd59a76e6c775c042f9719d758e79f.jpg',
    },
    {
      'name': 'Furry',
      'image': 'https://i.pinimg.com/736x/f7/82/7b/f7827b2adad48c0b00a9374243a61d45.jpg',
    },
  ];

  // Form fields
  String petName = '';
  String breedName = '';
  String gender = '';
  String age = '';
  String color = '';
  String height = '';
  String weight = '';
  File? _pickedImage;

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Added Pets Section
              const Text(
                "Added Pets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  final pet = _pets[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: pet['image']!.startsWith('http')
                            ? NetworkImage(pet['image']!)
                            : FileImage(File(pet['image']!)) as ImageProvider,
                      ),
                      title: Text(pet['name']!),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Manually Add Pet Section
              const Text(
                "Manually Add Pet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Pet Name",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => petName = value,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Breed Name",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => breedName = value,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Gender",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => gender = value,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Age",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => age = value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Colour",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => color = value,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Height",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => height = value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Weight",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => weight = value,
                    ),
                    const SizedBox(height: 20),

                    // Image Picker Section
                    Column(
                      children: [
                        if (_pickedImage != null)
                          Image.file(
                            _pickedImage!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        else
                          const Text("No image selected"),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: _pickImage,
                          icon: const Icon(Icons.upload_file),
                          label: const Text("Upload Image"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _pets.add({
                              'name': petName,
                              'image': _pickedImage != null
                                  ? _pickedImage!.path
                                  : 'https://via.placeholder.com/150', // Default image
                            });
                            _pickedImage = null; // Reset after adding
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Pet added successfully!")),
                          );
                        }
                      },
                      child: const Text("Add Pet"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
