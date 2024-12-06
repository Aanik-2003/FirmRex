import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/views/loginpage.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check the connection state and handle loading or error states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "An error occurred. Please try again.",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          // If there's no user (logged out), navigate to the LoginPage
          if (snapshot.data == null) {
            return LoginPage();
          } else {
            // If the user is logged in, navigate to the DashboardPage
            return DashboardPage(selectedIndex: 0);
          }
        },
      ),
    );
  }
}
