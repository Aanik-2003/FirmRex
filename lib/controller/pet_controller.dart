import 'dart:convert'; // For base64Decode
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import '../views/pet_profile.dart';

class PetController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  String? _base64Image;


  // Method to pick image
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        pickedImage = File(pickedFile.path); // Store the picked file
        _base64Image = await _convertImageToBase64(pickedFile.path);
        notifyListeners(); // Notify UI listeners of state change
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Method to encode an image to Base64
  Future<String?> _convertImageToBase64(String imagePath) async {
    try {
      final bytes = await File(imagePath).readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      print("Error converting image to Base64: $e");
      return null;
    }
  }
  // Fetches all pets from Firestore and decodes image if Base64 is provided
  Future<List<Map<String, dynamic>>> getAllPets() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");

      final QuerySnapshot snapshot = await _firestore
          .collection('pets')
          .where('ownerId', isEqualTo: user.uid)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        // Decode Base64 image if available
        if (data['image'] != null) {
          try {
            final base64String = data['image'];
            data['imageBytes'] = base64Decode(base64String);
          } catch (e) {
            print("Error decoding Base64 image: $e");
            data['imageBytes'] = null;
          }
        } else {
          data['imageBytes'] = null;
        }

        return {...data, 'id': doc.id}; // Include document ID
      }).toList();
    } catch (e) {
      throw Exception('Error retrieving pets: $e');
    }
  }

  // Add a new pet
  Future<void> addPet(String name,String breed,String gender,int age,String color,double height,double weight,String ownerId,
      ) async {
    if (_base64Image != null) {
      try {
        await addNewPet(name,breed,gender,age,color,height,weight,_base64Image!,ownerId,);
        // Clear the picked image after successful addition
        pickedImage = null; // Clear the image
        _base64Image = null; // Optionally clear the base64 string as well
        notifyListeners(); // Notify listeners to update the UI
        print("Pet added successfully!");
      } catch (e) {
        print("Error adding pet: $e");
      }
    } else {
      print("No image selected.");
    }
  }

  // Add a new pet to Firestore
  Future<void> addNewPet(String name,String breed,String gender,int age,String color,double height,double weight,String base64Image,String ownerId,
      ) async {
    try {
      final petData = {
        'name': name,
        'breed': breed,
        'gender': gender,
        'age': age,
        'color': color,
        'height': height,
        'weight': weight,
        'image': base64Image,
        'ownerId': ownerId,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('pets').add(petData);
    } catch (e) {
      throw Exception("Error adding pet: $e");
    }
  }

  // Get pet details by document ID
  Future<Map<String, dynamic>> getPetById(String docId) async {
    print('Pet ID: ${docId}');
    try {
      final DocumentSnapshot doc =
      await _firestore.collection('pets').doc(docId).get();

      if (!doc.exists) {
        throw Exception("Pet not found");
      }

      final data = doc.data() as Map<String, dynamic>;

      // Handling base64 image string, whether it's raw or data URI
      if (data['image'] != null) {
        try {
          if (data['image'].startsWith('data:image')) {
            // If the image is a base64-encoded string (data URI)
            final base64String = data['image'].split(',').last;
            data['imageBytes'] = base64Decode(base64String);
          } else if (data['image'].startsWith('/9j/')) {
            // If the image is a raw base64 string
            data['imageBytes'] = base64Decode(data['image']);
          } else {
            // If the image is a URL or invalid base64 string
            data['imageBytes'] = null;
          }
        } catch (e) {
          print("Error decoding image: $e");
          data['imageBytes'] = null;
        }
      }

      return {...data, 'id': doc.id};
    } catch (e) {
      throw Exception('Error retrieving pet by ID: $e');
    }
  }

  // Navigate to pet profile
  void navigateToPetProfile(BuildContext context, String docId) async {
    try {
      final petDetails = await getPetById(docId);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetProfile(
            selectedIndex: 4,
            pet: petDetails,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  // Method to update pet details by pet ID
  Future<void> updatePet(
      String petId,
      String name,
      String breed,
      String gender,
      int age,
      String color,
      double height,
      double weight,
      String? description, // New description field
      ) async {
    try {
      // Prepare the updated pet data
      final petData = {
        'name': name,
        'breed': breed,
        'gender': gender,
        'age': age,
        'color': color,
        'height': height,
        'weight': weight,
        'description': description, // Add description to the data
      };

      // Update the pet document in Firestore
      await _firestore.collection('pets').doc(petId).update(petData);

      print("Pet details updated successfully!");
    } catch (e) {
      throw Exception("Error updating pet details: $e");
    }
  }

  // Method to pick and store an image
  Future<void> pickAndStoreImage(String petId) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        String? base64Image = await _convertImageToBase64(pickedFile.path);

        if (base64Image != null) {
          await FirebaseFirestore.instance.collection('pets').doc(petId).update({
            'image': base64Image,
          });
        }
        print('Image saved to Firestore as Base64.');
      }
    } catch (e, stackTrace) {
      print("Error picking or storing image: $e\nStackTrace: $stackTrace");
    }
  }

  // Method to get stored image from Firestore
  Future<String?> getStoredImagePathFromFirestore(String petId) async {
    try {
      DocumentSnapshot petDoc = await FirebaseFirestore.instance
          .collection('pets')
          .doc(petId)
          .get();
      return petDoc['image'] ?? null;
    } catch (e, stackTrace) {
      print("Error fetching image path from Firestore: $e\nStackTrace: $stackTrace");
    }
    return null;
  }


  // Method to retrieve and decode an image
  Future<Image?> retrieveAndDecodeImage(String petId) async {
    try {
      String? base64Image = await getStoredImagePathFromFirestore(petId);

      if (base64Image != null) {
        Uint8List imageBytes = base64Decode(base64Image.toString());
        return Image.memory(imageBytes);
      }
    } catch (e, stackTrace) {
      print("Error retrieving or decoding image: $e\nStackTrace: $stackTrace");
    }
    return null;
  }

}
