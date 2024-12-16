import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../views/user_dashboard.dart';
import 'admin_provider.dart';

class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  late final String role;
  late final bool isAdmin;

  // Helper to show the loading indicator
  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // Helper to hide the loading indicator
  void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Email Sign-Up
  Future<User?> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      showLoading(context); // Show loading indicator
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      hideLoading(context);
      return cred.user;
    } catch (e) {
      _handleAuthException(e, context);
    } finally {
      hideLoading(context); // Hide loading indicator
    }
    return null;
  }

  bool isUserLoggedIn(User? user) {
    return user != null;
  }

  // Email Sign-In
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    // Validate email and password fields
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email and password cannot be empty."),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }

    try {
      showLoading(context);
      // Attempt login
      final UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = cred.user;
      if (user != null) {
        // Fetch the user's role from Firestore
        try {
          final DocumentSnapshot roleDoc = await FirebaseFirestore.instance
              .collection('users') // Replace with your Firestore collection
              .doc(user.uid) // Use the user's UID as the document ID
              .get();
          print(roleDoc);

          if (roleDoc.exists) {
            role = roleDoc['role']; // Fetch the role field
            isAdmin = role == 'admin'; // Check if the role is 'admin'

            print(role);
            print(isAdmin);
            // Update the AdminProvider with the isAdmin value
            Provider.of<AdminProvider>(context, listen: false).setAdminStatus(isAdmin);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login successful as ${isAdmin ? 'Admin' : 'User'}"),
                backgroundColor: Colors.green,
              ),
            );
            hideLoading(context);

            // Pass isAdmin to the DashboardPage or set it globally
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardPage(
                  selectedIndex: 0,
                ),
              ),
            );

            return user;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Role not found for this user."),
                backgroundColor: Colors.red,
              ),
            );
            await _auth.signOut(); // Sign out if role is missing
          }
        } catch (e) {
          debugPrint("Error fetching user role: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error fetching user role."),
              backgroundColor: Colors.red,
            ),
          );
        }
      }

      return cred.user;
    } catch (e) {
      _handleAuthException(e, context);
      debugPrint('Error during login: $e');
    }

    return null;
  }

  // Google Sign-Up
  Future<User?> googleSignUp(BuildContext context) async {
    try {
      showLoading(context); // Show loading indicator
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      await addGoogleUserDetails(userCredential.user, context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Google sign-in successful"),
          backgroundColor: Colors.green,
        ),
      );

      return userCredential.user;
    } catch (e) {
      debugPrint('Google sign-in error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Google sign-in failed. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      hideLoading(context); // Hide loading indicator
    }
    return null;
  }

  /// Adds Google user details to Firestore
  Future<void> addGoogleUserDetails(User? user, BuildContext context) async {
    if (user != null) {
      try {
        final String uid = user.uid;
        final String email = user.email ?? "";

        final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (!doc.exists) {
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'uid': uid,
            'UserName': '',
            'Email': email,
            'Age': '',
            'Phone Number': '',
            'Address': '',
            'Gender': '',
            'ProfilePic': '',
            'role': 'user',
          }).catchError((error) {
            debugPrint('Failed to add Google user details: $error');
            showSnackBar(
                context, 'Failed to save Google user details. Please try again.', Colors.red);
          });
        }
      } catch (e) {
        debugPrint('Error adding Google user details: $e');
        showSnackBar(
            context, 'An unexpected error occurred. Please try again.', Colors.red);
      }
    }
  }

  // Sign-Out
  Future<void> signOut(BuildContext context) async {
    try {
      showLoading(context); // Show loading indicator
      await _auth.signOut();
      await _googleSignIn.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign-out successful"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      debugPrint('Sign-out error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign out. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      hideLoading(context); // Hide loading indicator
    }
  }

  // Confirm Password
  bool confirmPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  // Handle Authentication Exceptions
  void _handleAuthException(dynamic e, BuildContext context) {
    String errorMessage = "An unknown error occurred. Please try again.";

    if (e is FirebaseAuthException) {
      switch (e.code) {
        case "invalid-email":
          errorMessage = "The email address is not valid.";
          break;
        case "user-disabled":
          errorMessage = "This user account has been disabled.";
          break;
        case "user-not-found":
        case "wrong-password":
        case "invalid-credential":
          errorMessage = "Invalid credentials. Please check your email and password.";
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
        default:
          errorMessage = "Error: ${e.message}";
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Display Snack Bar
  void showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
