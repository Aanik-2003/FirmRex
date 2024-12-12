import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/auth/user_auth.dart';
import 'package:firm_rex/controller/register_user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class Signuppage extends StatefulWidget {
  @override
  State<Signuppage> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<Signuppage> {

  // instantiations
  final UserAuth _auth = UserAuth();
  final RegisterUser _registerUser = RegisterUser();

  final _fullnameController = TextEditingController();
  final _user_email = TextEditingController();
  final _user_password = TextEditingController();
  final _confrimpasswordController = TextEditingController();


  @override
  void dispose() {
    _fullnameController.dispose();
    _user_email.dispose();
    _user_password.dispose();
    _confrimpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.green.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Logo Section
                        SizedBox(height: size.height * 0.03),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "images/logo_nobg.png",
                            width: size.width * 0.7,
                            height: size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // Input Section
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              _buildTextField("Full Name", Icons.person,
                                  _fullnameController),
                              SizedBox(height: size.height * 0.02),
                              _buildTextField("Email Address", Icons.email,
                                  _user_email),
                              SizedBox(height: size.height * 0.02),
                              _buildTextField("Password", Icons.lock,
                                  _user_password,
                                  obscure: true),
                              SizedBox(height: size.height * 0.02),
                              _buildTextField("Retype Password",
                                  Icons.lock_outline, _confrimpasswordController,
                                  obscure: true),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),

                        // Sign Up Button
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _registerUser.signUp(
                                  _fullnameController.text.trim(),
                                  _user_email.text.trim(),
                                  _user_password.text.trim(),
                                  _confrimpasswordController.text.trim(),
                                context,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Login Redirect
                        RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(), // Replace with your LoginPage widget
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Google Connect Button
                        const Text(
                          "Or Connect With",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final User? user = await _auth.googleSignUp(context);
                                if (user != null) {
                                  // You can handle successful sign-in logic here, if needed
                                  debugPrint("Google Sign-In successful for user: ${user.email}");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(), // Pass petId or any other detail (petId: petId)
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              icon: Icon(Icons.login),
                              label: const Text("Google"),
                            ),
                          ),
                        ),

                        Spacer(),

                        // Footer Section
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "© All Rights Reserved to ANS - 2024",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      TextEditingController controller,
      {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
