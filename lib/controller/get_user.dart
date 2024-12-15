import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetUser {
  final ImagePicker _picker = ImagePicker();

  // Method to get user's name
  Future<String> getUserName() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['UserName'] ?? 'User';
      }
    } catch (e, stackTrace) {
      print("Error fetching user name: $e\nStackTrace: $stackTrace");
    }
    return 'User';
  }

  // Method to get user's email
  Future<String> getUserEmail() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['Email'] ?? 'User';
      }
    } catch (e, stackTrace) {
      print("Error fetching user email: $e\nStackTrace: $stackTrace");
    }
    return 'User';
  }

  // Method to get user's phone number
  Future<int> getUserNumber() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['Phone Number'] ?? 'Phone Number';
      }
    } catch (e, stackTrace) {
      print("Error fetching user number: $e\nStackTrace: $stackTrace");
    }
    return 0;
  }

  // Method to get user's address
  Future<String> getUserAddress() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['Address'] ?? 'Address';
      }
    } catch (e, stackTrace) {
      print("Error fetching user address: $e\nStackTrace: $stackTrace");
    }
    return 'Address';
  }

  // Method to update user's details
  Future<void> updateUserDetails(
      String userName, int age, int number, String address, String? gender, BuildContext context) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        await userRef.update({
          'UserName': userName,
          'Age': age,
          'Phone Number': number,
          'Address': address,
          if (gender != null) 'Gender': gender,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("User details updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("No user is currently logged in."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error updating user data: $e"),
          backgroundColor: Colors.red,
        ),
      );
      print("Error updating user data: $e\nStackTrace: $stackTrace");
    }
  }

  // Method to encode an image to Base64
  Future<String?> _convertImageToBase64(String imagePath) async {
    try {
      final bytes = await File(imagePath).readAsBytes();
      return base64Encode(bytes);
    } catch (e, stackTrace) {
      print("Error converting image to Base64: $e\nStackTrace: $stackTrace");
      return null;
    }
  }

  // Method to pick and store an image
  Future<void> pickAndStoreImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        String? base64Image = await _convertImageToBase64(pickedFile.path);

        if (base64Image != null) {
          final User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
              'ProfilePic': base64Image,
            });
          }

          print('Image saved to Firestore as Base64.');
        }
      }
    } catch (e, stackTrace) {
      print("Error picking or storing image: $e\nStackTrace: $stackTrace");
    }
  }

  // Method to get stored image path from Firestore
  Future<String?> getStoredImagePathFromFirestore() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['ProfilePic'] ?? null;
      }
    } catch (e, stackTrace) {
      print("Error fetching image path from Firestore: $e\nStackTrace: $stackTrace");
    }
    return null;
  }

  // Method to retrieve and decode an image
  Future<Image?> retrieveAndDecodeImage() async {
    try {
      String? base64Image = await getStoredImagePathFromFirestore();

      if (base64Image != null && base64Image !='') {
        Uint8List imageBytes = base64Decode(base64Image.toString());
        return Image.memory(imageBytes);
      }

    } catch (e, stackTrace) {
      print("Error retrieving or decoding image: $e\nStackTrace: $stackTrace");
    }
    return null;
  }
}
