import 'package:flutter/material.dart';

import 'loginpage.dart'; // Import your LoginPage

class GetStarted3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/dog3.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom Content Card with Scrollable Area
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView( // Make the bottom part scrollable if needed
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.6, // Increased the height for better space
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // 5% of screen width
                    vertical: screenHeight * 0.04, // 4% of screen height
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Pagination Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container(
                              width: screenWidth * 0.05, // 5% of screen width
                              height: screenHeight * 0.01, // 1% of screen height
                              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                              decoration: BoxDecoration(
                                color: i == 2 ? Colors.orange : Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03), // Space between elements

                      // Welcome Text
                      Text(
                        'We Provide',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08, // 8% of screen width
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Fredoka',
                          color: Color(0xFF131314),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),

                      // Subtitle
                      Text(
                        '24hrs location tracking & health\nupdates\n\nOn time feeding\nupdates',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // 5% of screen width
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Fredoka',
                          color: Color(0xFFA1A1A1),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Next Button
                      ElevatedButton(
                        onPressed: () {
                          // Add your navigation logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5BB15A), // Green color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02, // 2% of screen height
                            horizontal: screenWidth * 0.2, // Adjust padding dynamically
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // 5% of screen width
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // RichText (Login) with GestureDetector
                      SizedBox(height: screenHeight * 0.02),
                      GestureDetector(
                        onTap: () {
                          // Navigate to LoginPage when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already Have An Account? ',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04, // 4% of screen width
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fredoka',
                              color: Color(0xFF131314),
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
