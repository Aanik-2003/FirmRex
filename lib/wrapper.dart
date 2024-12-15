import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firm_rex/views/landingpage.dart';
import 'package:firm_rex/views/loginpage.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final hasLaunchedBefore = prefs.getBool('hasLaunchedBefore') ?? false;

    if (!hasLaunchedBefore) {
      // Mark as not the first launch
      await prefs.setBool('hasLaunchedBefore', true);
      setState(() {
        _isFirstLaunch = true;
      });
    } else {
      setState(() {
        _isFirstLaunch = false;
      });
    }
  }

  Future<bool> isNewUser(User user) async {
    // Check if the user exists in Firestore
    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    return !doc.exists; // If no user document, the user is new
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstLaunch) {
      return LandingPage(); // Show LandingPage only on first app launch
    }

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Handle loading state
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

          // If user is logged out, show LoginPage
          if (snapshot.data == null) {
            return LoginPage();
          } else {
            // If user is logged in, check if they are new
            return FutureBuilder<bool>(
              future: isNewUser(snapshot.data!), // Check if the user is new
              builder: (context, isNewUserSnapshot) {
                if (isNewUserSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (isNewUserSnapshot.hasError) {
                  return const Center(
                    child: Text(
                      "An error occurred. Please try again.",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }

                // Redirect new users to the LoadingScreen (or onboarding screen)
                if (isNewUserSnapshot.data == true) {
                  return LandingPage(); // Replace with your onboarding/loading page
                }

                // Otherwise, redirect to the dashboard
                return DashboardPage(selectedIndex: 0);
              },
            );
          }
        },
      ),
    );
  }
}
