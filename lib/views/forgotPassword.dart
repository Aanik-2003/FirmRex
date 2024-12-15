import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'enterCode.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _errorText = '';

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future<bool> checkEmailInFirestore(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Please enter an email address."),
          );
        },
      );
      return;
    }

    try {
      // Check if the email exists
      print(email);
      if (await checkEmailInFirestore(email)) {
        // Proceed to send the password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email."),
            );
          },
        );
      } else {
        // Email not found
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Email not found. Please check and try again."),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  // Simple email validation using RegEx
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  // void _resetPassword() {
  //   String email = _emailController.text;
  //   if (_isValidEmail(email)) {
  //     // Proceed with password reset logic
  //     setState(() {
  //       _errorText = '';
  //     });
  //     // Implement reset password functionality here
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Password reset link sent to $email')),
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => EnterCode()), // Replace with your page
  //     );
  //   } else {
  //     // Show error message if email is invalid
  //     setState(() {
  //       _errorText = 'Please enter a valid email address';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive layout
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Make the body scrollable when keyboard appears
        child: Padding(
          padding: EdgeInsets.all(width * 0.05), // responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot password",
                style: TextStyle(
                  fontSize: width * 0.06, // responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.02), // responsive spacing
              Text(
                "Please enter your email to reset the password",
                style: TextStyle(
                  fontSize: width * 0.04, // responsive font size
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: height * 0.04), // responsive spacing
              Text(
                "Your Email",
                style: TextStyle(
                  fontSize: width * 0.045, // responsive font size
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.01), // responsive spacing
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  errorText: _errorText.isEmpty ? null : _errorText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.02), // responsive border radius
                  ),
                ),
              ),
              SizedBox(height: height * 0.04), // responsive spacing
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: height * 0.02), // responsive padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02), // responsive border radius
                    ),
                  ),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: width * 0.045, // responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
