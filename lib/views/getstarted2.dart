import 'package:flutter/material.dart';

class GetStarted2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/dog2.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom Content Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Pagination Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 7,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 7,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)

                          ),
                        ),
                        Container(
                          width: 20,
                          height: 7,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)

                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Welcome Text
                    Text(
                      'Now ! ',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fredoka',
                        color: Color(0xFF131314),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Subtitle
                    Text(
                      'One tap for foods, accessories, health \ncare products & digital gadgets\n\nGrooming & boarding \n \nEasy & best consulation bookings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Fredoka',
                        color: Color(0xFFA1A1A1),
                      ),
                    ),
                    SizedBox(height: 15),

                    Spacer(),
                    Spacer(),
                    // Next Button
                    ElevatedButton(
                      onPressed: () {
                        // Add your navigation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5BB15A), // Green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 160),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
