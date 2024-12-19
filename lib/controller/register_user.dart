import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/user_auth.dart';
import '../views/loginpage.dart';

class RegisterUser {
  final UserAuth _auth = UserAuth();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Utility function to show SnackBar
  void showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Adds user details to Firestore
  Future<void> addUserDetails(String userName, String email, BuildContext context) async {
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
          'ProfilePic': '',
          'role': 'user',
        }).catchError((error) {
          debugPrint('Failed to add user details: $error');
          showSnackBar(context, 'Failed to save user details. Please try again.', Colors.red);
        });
      } else {
        debugPrint('Error: No user is currently logged in.');
        showSnackBar(context, 'No user is currently logged in.', Colors.red);
      }
    } catch (e) {
      debugPrint('Error adding user details: $e');
      showSnackBar(context, 'An unexpected error occurred. Please try again.', Colors.red);
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
    if (!_auth.confirmPasswordMatch(password, confirmPassword)) {
      showSnackBar(context, "Passwords do not match.", Colors.red);
      return;
    }

    if (userName.isEmpty || email.isEmpty || password.isEmpty) {
      showSnackBar(context, "All fields are required.", Colors.red);
      return;
    }
    // Create the user
    User? newUser = await _auth.createUserWithEmailAndPassword(email, password, context);

    if (_auth.isNewUser(newUser)) {
      // If user creation was successful, add details to users colletion
      await addUserDetails(userName, email, context);
      if(context.mounted){
        showSnackBar(context, "Account created successfully.", Colors.green);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } else {
      showSnackBar(context, "Signup failed. Please try again.", Colors.red);
    }
  }
}
