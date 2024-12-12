import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/auth/user_auth.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'signuppage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _auth = UserAuth();
  final _user_email = TextEditingController();
  final _user_password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _user_email.dispose();
    _user_password.dispose();
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
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Top Section
                        SizedBox(height: size.height * 0.03),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "images/logo_nobg.png",
                            width: size.width * 0.7,
                            height: size.height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // Input Fields
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              _buildTextField(
                                  "Email Address", Icons.email, _user_email),
                              SizedBox(height: size.height * 0.02),
                              _buildTextField(
                                  "Password", Icons.lock, _user_password,
                                  obscure: true),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // Forgot Password
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFF67E27),
                                fontSize: 16,
                                fontFamily: 'Fredoka',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),

                        // Login Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _auth.loginUserWithEmailAndPassword(
                                  _user_email.text.trim(),
                                  _user_password.text.trim(),
                                  context,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardPage(selectedIndex: 0), // Pass petId or any other detail (petId: petId)
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),

                        // Signup Redirect
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: "SignUp",
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
                                        builder: (context) => Signuppage(),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                      builder: (context) => DashboardPage(selectedIndex: 0), // Pass petId or any other detail (petId: petId)
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
                              icon: Image.asset(
                                'images/google_icon_nobg.png',
                                width: 22,
                                height: 22,
                              ),
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
