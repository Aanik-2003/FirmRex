import 'dart:async';
import 'package:flutter/material.dart';

import 'getstarted1.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    // Set a timer to navigate to the next page after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted1()), // Replace with your next page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF5CB15A), // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered GIF
            Image.asset(
              'images/dog.gif', // Replace with your GIF path
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
            ),
            const SizedBox(height: 20), // Add spacing between GIF and text
            // Loading text
            const Text(
              "Loading...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
