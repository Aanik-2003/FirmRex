import 'dart:convert';  // For base64Decode
import 'dart:typed_data';  // For Uint8List
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PetController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      // After retrieving all pets, decode images (Base64 to Uint8List)
      List<Map<String, dynamic>> petsList = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        // If image field is not null, decode Base64 image
        if (data['image'] != null) {
          try {
            // Check if the image is a Base64 string and decode it if it is
            if (data['image'].startsWith('data:image')) {
              // Strip 'data:image/jpeg;base64,' or similar from the Base64 string
              final base64String = data['image'].split(',').last;
              data['imageBytes'] = base64Decode(base64String); // Store as decoded bytes
            } else {
              data['imageBytes'] = null; // No decoding needed if not Base64
            }
          } catch (e) {
            print("Error decoding Base64 image: $e");
            data['imageBytes'] = null; // Set to null if decoding fails
          }
        }

        return data..['id'] = doc.id;  // Return data with document ID
      }).toList();

      return petsList;
    } catch (e) {
      throw Exception('Error retrieving pets: $e');
    }
  }

  // Add a new pet to Firestore
  Future<void> addNewPet(
      String name,
      String breed,
      String gender,
      int age,
      String color,
      double height,
      double weight,
      String imagePath,
      String ownerId,
      ) async {
    try {
      // Prepare pet data
      final petData = {
        'name': name,
        'breed': breed,
        'gender': gender,
        'age': age,
        'color': color,
        'height': height,
        'weight': weight,
        'image': imagePath, // Store the image path (URL or file path)
        'ownerId': ownerId, // Store owner ID to associate pet with user
        'createdAt': FieldValue.serverTimestamp(), // Set creation time
      };

      // Add pet to Firestore collection
      await _firestore.collection('pets').add(petData);
    } catch (e) {
      throw Exception("Error adding pet: $e");
    }
  }
}
