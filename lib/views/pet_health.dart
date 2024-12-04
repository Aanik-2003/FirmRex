import 'package:firm_rex/views/medical_records.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

class PetHealth extends StatelessWidget {
  Widget buildHorizontalScroll(int itemCount){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          itemCount,
              (index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
            Container(
              width: 180,
              height: 120,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MedicalRecords()),
                          );
                        },
                        child: const Text(
                          "Medical Records",
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
              ],
            ),

          ),
          const SizedBox(height: 20,),
          Container(
            width: 408,
            height: 220,
            padding: const EdgeInsets.only(top: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.30000001192092896),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Upcoming Vaccinations',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      buildHorizontalScroll(5),
                    ],
                  ),
                ),
              ],
            ),

          ),
          const SizedBox(height: 450,),
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
