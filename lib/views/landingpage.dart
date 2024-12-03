import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF5CB15A), // Fallback color
          ),

          // Positioned dog.gif image
          Positioned(
            left: 50,   // X position (horizontal)
            top: 300,   // Y position (vertical)
            child: Image.asset(
              'images/dog.gif',
              width: 350, // Set width of the image
              height: 350, // Set height of the image
            ),
          ),

          // Positioned giphy1.gif image directly below dog.gif
          Positioned(
            left: 100,   // X position (horizontal)
            top: 300 + 220 + 10, // Y position: below dog.gif (350px height + 10px gap)
            child: Image.asset(
              'images/giphy1.gif',
              width: 268, // Set width of the image
              height: 268, // Set height of the image
            ),
          ),
        ],
      ),
    );
  }
}
