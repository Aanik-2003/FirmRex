import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => dashboardPageState();
}

class dashboardPageState extends State<DashboardPage> {

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
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green, // Set background color to green
              borderRadius: BorderRadius.circular(0), // Optional rounded corners
            ),
            child: Container(
              height: size.height / 12,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.green, // Background color for visibility
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  // Text at Bottom Left
                  Positioned(
                    bottom: 5,
                    left: 10,
                    child: Text(
                      "Hello, Aanik!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Image at Bottom Right
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      height: size.height / 16,
                      width: size.width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300, // Optional background color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10), // Equal padding of 2
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Adjust to maintain rounded edges
                          child: Image.asset(
                            "images/logo.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 397,
            height: 220,
            padding: const EdgeInsets.only(
              top: 16,
              left: 21.89,
              right: 21.89,
              bottom: 21.89,
            ),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.4000000059604645),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 43.78,
                  offset: Offset(0, 5.47),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 21.89, bottom: 8.76),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 26.27,
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 26.27,
                              height: 100,
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.76),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'My Pets',
                            style: TextStyle(
                              color: Color(0xFF131314),
                              fontSize: 19.70,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 78,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: ShapeDecoration(
                          color: Color(0xFF7A86AE),
                          shape: RoundedRectangleBorder(
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
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://i.pinimg.com/736x/2d/bb/a9/2dbba9862aef7279188d60b27d5ef458.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: 90,
                        height: 90,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              child: Stack(
                                children: [
                                  //roudy
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://i.pinimg.com/736x/25/21/aa/2521aaed6a2594cae2fa64fc00a3fdb5.jpg"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                              ),

                            ),

                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Rounded corners
                          ),
                          padding: EdgeInsets.zero, // No padding to fit the image perfectly
                          backgroundColor: Colors.transparent, // Make the button's background invisible
                        ),
                        onPressed: () {
                          // Button action
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Match the button's corner radius
                          child: Image.asset(
                            "images/plus_icon.jpg",
                            fit: BoxFit.cover,
                            width: 60, // Button width
                            height: 60, // Button height
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 15, right: 128),
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Color(0x3F000000),
                  //       blurRadius: 4,
                  //       offset: Offset(0, 4),
                  //       spreadRadius: 0,
                  //     )
                  //   ],
                  // ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sundari',
                        style: TextStyle(
                          color: Color(0xFF5E5E62),
                          fontSize: 15,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                      const SizedBox(width: 79),
                      Text(
                        'Roudy',
                        style: TextStyle(
                          color: Color(0xFF5E5E62),
                          fontSize: 15,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Container(
            width: 400,
            height: 275,
            margin: new EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.only(
              top: 16,
              left: 21.89,
              right: 21.89,
              bottom: 29,
            ),
            decoration: ShapeDecoration(
              color: Colors.red.withOpacity(0.4000000059604645),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.27),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 43.78,
                  offset: Offset(0, 5.47),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 21.89, bottom: 8.76),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/26x26"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.76),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Vets',
                            style: TextStyle(
                              color: Color(0xFF131314),
                              fontSize: 19.70,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.24),
                Container(
                  width: 350,
                  height: 180,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.27),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        width: 350,
                        height: 180,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0x33A5A5A5),
                            ),
                            borderRadius: BorderRadius.circular(26.27),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 114,
                                height: 78,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/114x78"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              const SizedBox(height: 55,),
                              Text(
                                'Last Visit: 25/11/2022',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],

            ),
          )
        ],
      ),
    );
  }
}

