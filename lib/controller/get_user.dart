
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetUser {

  final ImagePicker _picker = ImagePicker();

  // method to get user's name
  Future<String> getUserName() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final String userName = userDoc['UserName'] ?? 'User';
        return userName;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'User';
  }

  // method to get user's email
  Future<String> getUserEmail() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final String email = userDoc['Email'] ?? 'User';
        return email;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'User';
  }

  // method to get user's phone number
  Future<String> getUserNumber() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the user's number
        final int number = userDoc['Phone Number'] ?? 'Phone';
        final String userNum = number.toString();
        return userNum;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return '';
  }

  // method to get user's address
  Future<String> getUserAddress() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the user's address
        final String address = userDoc['Address'] ?? 'Address';
        return address;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'Address';
  }

  // Method to update user's details
  Future<void> updateUserDetails(String userName, int age, int number, String address, String? gender, BuildContext context) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Reference to the user's document in Firestore
        final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Update the user's details
        await userRef.update({
          'UserName': userName,
          'Age': age,
          'Phone Number': number,
          'Address': address,
          'Gender': gender,
        });

        // Show success message in Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("User details updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
        print("User details updated successfully");
      } else {
        // Show error message if no user is logged in
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("No user is currently logged in."),
            backgroundColor: Colors.red,
          ),
        );
        print("No user is currently logged in.");
      }
    } catch (e) {
      // Show error message in case of an exception
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error updating user data: $e"),
          backgroundColor: Colors.red,
        ),
      );
      print("Error updating user data: $e");
    }
  }

  // Method to pick an image and store the path locally
  Future<void> pickAndStoreImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Store the image path locally
        String imagePath = pickedFile.path;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('profile_image_path', imagePath);

        // Now store the image path in Firestore
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'profile_image_path': imagePath,
          });
        }
        print('Image path saved locally and to Firestore: $imagePath');

      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Method to get the stored image path from Firestore
  Future<String?> getStoredImagePathFromFirestore() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['profile_image_path'] ?? null; // Get the image path from Firestore

      }
    } catch (e) {
      print("Error fetching image path from Firestore: $e");
    }
    return null;
  }

}