import 'package:firm_rex/views/pet_profile.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final int selectedIndex;

  // Constructor to accept selectedIndex
  const DashboardPage({super.key, required this.selectedIndex});

  @override
  _DashboardPageState createState() => _DashboardPageState();
  
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0; // Current selected index for BottomNavigationBar

  _DashboardPageState() : selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update selected index on button tap
    });
    switch (index) {
      case 0:
      // Navigate to Home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage(selectedIndex: selectedIndex,)),
        );
        break;
      case 1:
      // Navigate to Explore page
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ExplorePage()),
      //   );
        break;
      case 2:
      // Navigate to Map page
      //   Navigator.push(
      //     context,
          // MaterialPageRoute(builder: (context) => MapPage()),
      //   );
        break;
      case 3:
      // Navigate to Manage page
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ManagePage()),
      //   );
        break;
      case 4:
      // Navigate to Profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfile(selectedIndex: selectedIndex,)),
        );
        break;
    }
  }

  @override
  Widget buildHorizontalScroll(int itemCount){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          itemCount,
            (index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
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
                    width: 330,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 130,
                            height: 180,
                            color: Colors.blue,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 125,
                                  height: 110,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://via.placeholder.com/114x78"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(height: 43,),
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
                          // const SizedBox(width: 5,),
                          Container(
                            width: 177,
                            height: 180,
                            color: Colors.blueGrey,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 20, // Adjust top position
                                  left: 0, // Adjust left position
                                  child: Text(
                                    'Dr. Nambuvan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Fredoka',
                                      fontWeight: FontWeight.w500,
                                      height: 0.07,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 45,
                                  left: 0,
                                  child: Text(
                                    'Bachelor of veterinary science ',
                                    style: TextStyle(
                                      color: Color(0xFFA5A5A5),
                                      fontSize: 12,
                                      fontFamily: 'Fredoka',
                                      fontWeight: FontWeight.w400,
                                      height: 0.11,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 16,
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1.09, color: Colors.redAccent),
                                            borderRadius: BorderRadius.circular(21.89),
                                          ),
                                        ),
                                        child: Text(
                                          'Roudy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Fredoka',
                                            fontWeight: FontWeight.w400,
                                            height: 0.19,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 13,),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red, // Icon color
                                        size: 16.0, // Icon size
                                      ),
                                      const SizedBox(width: 2,),
                                      Text(
                                        '2.5 km',
                                        style: TextStyle(
                                          color: Color(0xFFA5A5A5),
                                          fontSize: 11,
                                          fontFamily: 'Fredoka',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                      const SizedBox(width: 7,),
                                      Icon(
                                        Icons.attach_money, // Dollar icon
                                        color: Colors.green, // Customize color
                                        size: 16.0, // Customize size
                                      ),
                                      Text(
                                        '100\$',
                                        style: TextStyle(
                                          color: Color(0xFFA5A5A5),
                                          fontSize: 11,
                                          fontFamily: 'Fredoka',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 30, // Adjust this for horizontal positioning
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle button press
                                      print('Book Appointment button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(80, 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8), // Rounded corners
                                        side: BorderSide(
                                          color: Colors.transparent, // Make the border invisible
                                          width: 0.0, // Set border width to 0.0
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5), // Button padding
                                    ),
                                    child: const Text(
                                      'Book Appointment  >',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Fredoka',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2, // Adjust height for spacing
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:16.0),
            decoration: BoxDecoration(
              color: Colors.green, // Set background color to green
              borderRadius: BorderRadius.circular(0), // Optional rounded corners
            ),
            child:
            Container(
              height: size.height / 11,
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
                    left: 15,
                    child: Text(
                      "Hello, Aanik!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Image at Bottom Right
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: Container(
                      height: size.height / 16,
                      width: size.width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300, // Optional background color
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Adjust to maintain rounded edges
                        child: Image.asset(
                          "images/logo.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height/35,),
          Container(
            width: size.width,
            height: size.height / 4,
            padding: const EdgeInsets.only(
              top: 25,
              left: 21.89,
              right: 18,
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
                  width: size.width,
                  padding: const EdgeInsets.only(left: 10, bottom: 8.76),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                SizedBox(height: size.height / 30),

                // Image and button section
                Container(
                  width: size.width,
                  height: size.height / 10,
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Logic for first image
                          print("First pet image tapped!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PetProfile(selectedIndex: 4,)),
                          );
                        },
                        child: Container(
                          width: size.width / 5,
                          height: size.height / 10,
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
                                  width: size.width / 5,
                                  height: size.height / 10,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.pinimg.com/736x/2d/bb/a9/2dbba9862aef7279188d60b27d5ef458.jpg"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: size.width / 25),
                      GestureDetector(
                        onTap: () {
                          // Logic for second image
                          print("Second pet image tapped!");
                        },
                        child: Container(
                          width: size.width / 5,
                          height: size.height / 10,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width / 5,
                                height: size.height / 10,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: size.width / 5,
                                        height: size.height / 10,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://i.pinimg.com/736x/25/21/aa/2521aaed6a2594cae2fa64fc00a3fdb5.jpg"),
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
                      ),
                      SizedBox(width: size.width / 25),
                      SizedBox(
                        width: size.width / 12, // Equal width
                        height: size.width / 12, // Equal height to make it square
                        child: ElevatedButton(
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
                              width: size.width / 13, // Match the button's width
                              height: size.width / 13, // Match the button's height
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 90),
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 21),
                  child: Row(
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
                      SizedBox(width: size.width / 9),
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

          SizedBox(height: size.height/35,),
          Container(
            width: size.width,
            height: size.height/2.39,
            padding: const EdgeInsets.only(
              top: 16,
              left: 10,
              right: 10,
              bottom: 16,
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
                  width: size.width,
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
                // Container(
                //   width: 350,
                //   height: 180,
                //   decoration: ShapeDecoration(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(26.27),
                //     ),
                //     shadows: [
                //       BoxShadow(
                //         color: Color(0x3F000000),
                //         blurRadius: 10,
                //         offset: Offset(0, 4),
                //         spreadRadius: 0,
                //       )
                //     ],
                //   ),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //
                //     children: [
                //       Container(
                //         width: 330,
                //         height: 180,
                //         decoration: ShapeDecoration(
                //           color: Colors.white,
                //           shape: RoundedRectangleBorder(
                //             side: BorderSide(
                //               width: 1,
                //               strokeAlign: BorderSide.strokeAlignOutside,
                //               color: Color(0x33A5A5A5),
                //             ),
                //             borderRadius: BorderRadius.circular(26.27),
                //           ),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 130,
                //                 height: 180,
                //                 color: Colors.blue,
                //                 child: Column(
                //                   mainAxisSize: MainAxisSize.min,
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       width: 125,
                //                       height: 110,
                //                       decoration: ShapeDecoration(
                //                         image: DecorationImage(
                //                           image: NetworkImage("https://via.placeholder.com/114x78"),
                //                           fit: BoxFit.fill,
                //                         ),
                //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //                       ),
                //                     ),
                //                     const SizedBox(height: 43,),
                //                     Text(
                //                       'Last Visit: 25/11/2022',
                //                       textAlign: TextAlign.right,
                //                       style: TextStyle(
                //                         color: Colors.black,
                //                         fontSize: 12,
                //                         fontFamily: 'Fredoka',
                //                         fontWeight: FontWeight.w400,
                //                         height: 0.12,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               // const SizedBox(width: 5,),
                //               Container(
                //                 width: 177,
                //                 height: 180,
                //                 color: Colors.blueGrey,
                //                 child: Stack(
                //                   children: [
                //                     Positioned(
                //                       top: 20, // Adjust top position
                //                       left: 0, // Adjust left position
                //                       child: Text(
                //                         'Dr. Nambuvan',
                //                         style: TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 20,
                //                           fontFamily: 'Fredoka',
                //                           fontWeight: FontWeight.w500,
                //                           height: 0.07,
                //                         ),
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: 45,
                //                       left: 0,
                //                       child: Text(
                //                         'Bachelor of veterinary science ',
                //                         style: TextStyle(
                //                           color: Color(0xFFA5A5A5),
                //                           fontSize: 12,
                //                           fontFamily: 'Fredoka',
                //                           fontWeight: FontWeight.w400,
                //                           height: 0.11,
                //                         ),
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: 80,
                //                       child: Row(
                //                         children: [
                //                           Container(
                //                             width: 55,
                //                             height: 16,
                //                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                //                             decoration: ShapeDecoration(
                //                               shape: RoundedRectangleBorder(
                //                                 side: BorderSide(width: 1.09, color: Colors.redAccent),
                //                                 borderRadius: BorderRadius.circular(21.89),
                //                               ),
                //                             ),
                //                             child: Text(
                //                               'Roudy',
                //                               style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontSize: 10,
                //                                 fontFamily: 'Fredoka',
                //                                 fontWeight: FontWeight.w400,
                //                                 height: 0.19,
                //                               ),
                //                             ),
                //                           ),
                //                           const SizedBox(width: 13,),
                //                           Icon(
                //                             Icons.location_on,
                //                             color: Colors.red, // Icon color
                //                             size: 16.0, // Icon size
                //                           ),
                //                           const SizedBox(width: 2,),
                //                           Text(
                //                             '2.5 km',
                //                             style: TextStyle(
                //                               color: Color(0xFFA5A5A5),
                //                               fontSize: 11,
                //                               fontFamily: 'Fredoka',
                //                               fontWeight: FontWeight.w400,
                //                               height: 0.12,
                //                             ),
                //                           ),
                //                           const SizedBox(width: 7,),
                //                           Icon(
                //                             Icons.attach_money, // Dollar icon
                //                             color: Colors.green, // Customize color
                //                             size: 16.0, // Customize size
                //                           ),
                //                           Text(
                //                             '100\$',
                //                             style: TextStyle(
                //                               color: Color(0xFFA5A5A5),
                //                               fontSize: 11,
                //                               fontFamily: 'Fredoka',
                //                               fontWeight: FontWeight.w400,
                //                               height: 0.12,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: 120,
                //                       left: 30, // Adjust this for horizontal positioning
                //                       child: ElevatedButton(
                //                         onPressed: () {
                //                           // Handle button press
                //                           print('Book Appointment button pressed');
                //                         },
                //                         style: ElevatedButton.styleFrom(
                //                           minimumSize: const Size(80, 10),
                //                           shape: RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(8), // Rounded corners
                //                             side: BorderSide(
                //                               color: Colors.transparent, // Make the border invisible
                //                               width: 0.0, // Set border width to 0.0
                //                             ),
                //                           ),
                //                           padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5), // Button padding
                //                         ),
                //                         child: const Text(
                //                           'Book Appointment  >',
                //                           textAlign: TextAlign.center,
                //                           style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 12,
                //                             fontFamily: 'Fredoka',
                //                             fontWeight: FontWeight.w400,
                //                             height: 1.2, // Adjust height for spacing
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                buildHorizontalScroll(5),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[200],
        showSelectedLabels: true, // Show labels for selected items
        currentIndex: selectedIndex, // Highlight the selected item
        onTap: _onItemTapped, // Update the state on tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  // Helper method to create the icon and label containers

}

