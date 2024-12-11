import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/user_auth.dart';

class RegisterUser {
  final _auth = UserAuth();
  final _firestore = FirebaseFirestore.instance;

  /// Adds user details to Firestore
  Future<void> addUserDetails(String userName, String email) async {
    try {
      // Get the current user's UID
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final String uid = user.uid;

        // Use the UID as the document ID
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'UserName': userName,
          'Email': email,
          'Age': '',
          'Phone Number': '',
          'Address': '',
          'Gender': '',
        });
      } else {
        debugPrint('Error: No user is currently logged in.');
      }
    } catch (e) {
      debugPrint('Error adding user details: $e');
      rethrow;
    }
  }


  /// Handles the signup process
  Future<void> signUp(
      String userName,
      String email,
      String password,
      String confirmPassword,
      BuildContext context,
      ) async {
    if (!_auth.confirmPassword(password, confirmPassword)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password doesn't match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Create the user
    User? newUser = await _auth.createUserWithEmailAndPassword(email, password, context);

    if (_auth.isUser(newUser)) {
      // If user creation was successful, add to Firestore
      await addUserDetails(userName, email);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


}
