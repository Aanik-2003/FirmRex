import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => dashboardPageState();
}

class dashboardPageState extends State<DashboardPage> {
  // Horizontal scroll function with gesture detection
  Widget horizontalScrollFunction(var size, var color) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const DetailsPage()),
        // );
      },
      child: Container(
        width: size.width / 1.5,
        height: size.height / 5,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/bg_flutter.jpeg",
                fit: BoxFit.cover,
                height: size.height / 5,
                width: size.width / 1.5,
              ),
            ),
            Positioned(
              bottom: 25,
              left: 15,
              child: Container(
                width: size.width / 2,
                child: Text(
                  "First Image Of My Flutter Project. This is my new project...",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 15,
              child: Container(
                width: size.width / 2,
                child: Text(
                  "Sept 20, 2024",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Icon(
                Icons.play_circle,
                size: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Vertical scroll function
 // static Widget verticalScrollFunction(var size, var color) {
 //    return Container(
 //      width: size.width / 2.2,
 //      height: size.height / 6,
 //      margin: EdgeInsets.only(top: 10, left: 10),
 //      decoration: BoxDecoration(
 //        color: Color(color),
 //        borderRadius: BorderRadius.circular(20),
 //      ),
 //      child: Stack(
 //        children: [
 //          ClipRRect(
 //            borderRadius: BorderRadius.circular(20),
 //            child: Image.asset(
 //              "images/bg_flutter.jpeg",
 //              fit: BoxFit.cover,
 //              height: size.height / 6,
 //              width: size.width / 2.2,
 //            ),
 //          ),
 //          Positioned(
 //            left: 60,
 //            bottom: 40,
 //            child: Icon(
 //              Icons.play_circle,
 //              size: 70,
 //              color: Colors.white,
 //            ),
 //          ),
 //          Positioned(
 //            top: 25,
 //            right: 0,
 //            child: Container(
 //              width: size.width / 2,
 //              child: Text(
 //                "First Image Of My Flutter Project. This is my new project...",
 //                style: TextStyle(
 //                  color: Colors.black,
 //                  fontWeight: FontWeight.bold,
 //                  fontSize: 16,
 //                ),
 //                maxLines: 2,
 //                overflow: TextOverflow.ellipsis,
 //              ),
 //            ),
 //          ),
 //          Positioned(
 //            bottom: 10,
 //            left: 300,
 //            child: Container(
 //              width: size.width / 2,
 //              child: Text(
 //                "Sept 20, 2024",
 //                style: TextStyle(
 //                  color: Colors.black,
 //                  fontWeight: FontWeight.normal,
 //                  fontSize: 14,
 //                ),
 //                maxLines: 1,
 //                overflow: TextOverflow.ellipsis,
 //              ),
 //            ),
 //          ),
 //          Positioned(
 //            bottom: 0,
 //            right: 103,
 //            child: ElevatedButton(
 //              onPressed: () {
 //              // No action defined
 //              },
 //              style: ElevatedButton.styleFrom(
 //              backgroundColor: Colors.red,
 //              minimumSize: Size(20, 40), // Set minimum width and height// Button color
 //              shape: RoundedRectangleBorder(
 //              borderRadius: BorderRadius.circular(10),
 //              ),
 //              ),
 //              child: Text("Play Now",
 //              style: TextStyle(
 //                color: Colors.black
 //              ),),
 //            ),
 //          ),
 //        ],
 //      ),
 //    );
 //  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 1,
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return horizontalScrollFunction(size, 0xff2345); // Updated color for visibility
              },
            ),
          ),
          // Container(
          //   height: size.height / 1.5,
          //   width: size.width / 1,
          //   child: ListView.builder(
          //     itemCount: 20,
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (context, index) {
          //       return verticalScrollFunction(size, 0xff2345); // Updated color for visibility
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
