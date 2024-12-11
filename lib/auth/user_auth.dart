import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/controller/register_user.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

import '../views/loginpage.dart';

class UserAuth {
  final _auth = FirebaseAuth.instance;

  // Sign-Up
  Future<User?> createUserWithEmailAndPassword(
      email, password, context) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup successful"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      return cred.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        exceptionHandler(e.code, context);
      } else {
        exceptionHandler("unknown-error", context);
      }
    }
    return null;
  }

  bool isUser(User? user){
    return user != null;
  }

  // Sign-In
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful"),
          backgroundColor: Colors.green, // Customizing color for success
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage(selectedIndex: 0)),
      );
      return cred.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        exceptionHandler(e.code, context);
      }
      // else {
      //   exceptionHandler(e.code, context);
      // }
      // exceptionHandler("unknown-error", context);
    }
    return null;
  }

  // Sign-Out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("SignOut successful"),
          backgroundColor: Colors.green, // Customizing color for success
        ),
      );
    } catch (e) {
      exceptionHandler("signout-error", context);
    }
  }

  // Exception Handler
  void exceptionHandler(String error, BuildContext context) {
    String errorMessage = error;

    switch (error) {
      case "invalid-email":
        errorMessage = "The email address is not valid.";
        break;
      case "user-disabled":
        errorMessage = "This user account has been disabled.";
        break;
      case "user-not-found":
        errorMessage = "No user found for the provided email.";
        break;
      case "wrong-password":
        errorMessage = "Incorrect password. Please try again.";
        break;
      case "email-already-in-use":
        errorMessage = "This email is already in use.";
        break;
      case "weak-password":
        errorMessage = "Password should be at least 8 characters.";
        break;
      case "operation-not-allowed":
        errorMessage = "This operation is not allowed. Please contact support.";
        break;
      case "signout-error":
        errorMessage = "An error occurred while signing out.";
        break;
      case "invalid-credential":
        errorMessage = "Invalid credential";
        break;
      // default:
      //   errorMessage = "An unknown error occurred. Please try again.";
    }

    // Display error in a dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // confirm password
  bool confirmPassword(String password, String confirmPassword){
    if(password != confirmPassword){
      return false;
    }else{
      return true;
    }
  }
}
