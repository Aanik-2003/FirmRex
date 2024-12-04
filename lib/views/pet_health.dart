import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

class PetHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align items to the top
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left

        children: [
          Container(
            width: double.infinity, // Full width of the screen
            height: 110,
            padding: const EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
              color: Colors.green, // Set the container color to green
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child:
            Column(
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child:
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Pet Health",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(left: 50,),
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Wellness",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 4,
                        ),
                      ),
                      const SizedBox(width: 80),
                      const Text(
                        "Medical Records",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
          const SizedBox(height: 690,),
          Container(
            width: 412,
            height: 90,
            padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconHelper.buildIconWithLabel(Icons.home, 'Home', Colors.green,),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.explore, "Explore", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.map, "Map", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.settings, "Manage", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.person, "Profile", Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
