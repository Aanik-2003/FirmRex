import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PetController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Adds a new pet to the "pets" collection in Firestore
  Future<void> addNewPet(
      String name,
      String? breed,
      String? gender,
      int age,
      String colour,
      double height,
      double weight,
      String imagePath,
      String ownerId,
      ) async {
    try {
      await _firestore.collection('pets').add({
        'name': name,
        'breed': breed ?? '',
        'gender': gender,
        'age': age,
        'colour': colour,
        'height': height,
        'weight': weight,
        'image': imagePath,
        'ownerId': ownerId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error adding pet: $e');
    }
  }

  /// Retrieves all pets added by the current user
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
        return data..['id'] = doc.id;
      }).toList();
    } catch (e) {
      throw Exception('Error retrieving pets: $e');
    }
  }
}
