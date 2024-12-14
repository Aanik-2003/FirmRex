import 'dart:convert';

import 'package:firm_rex/controller/pet_controller.dart';
import 'package:firm_rex/views/add_pet.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/admin_provider.dart';
import '../controller/get_user.dart';

class DashboardPage extends StatefulWidget {
  final int selectedIndex;
  // final bool isAdmin;

  // Constructor to accept selectedIndex
  const DashboardPage({super.key, required this.selectedIndex,});

  @override
  _DashboardPageState createState() => _DashboardPageState();
  
}

class _DashboardPageState extends State<DashboardPage> {


  final _petController = PetController();
  int selectedIndex = 0; // Current selected index for BottomNavigationBar

  _DashboardPageState() : selectedIndex = 0;

  List<Map<String, dynamic>> _pets = [];

  @override
  void initState() {
    super.initState();
    _refreshPetList(); // Initial load of pet list
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onItemTapped(BuildContext context, int index, bool isAdmin) {
    print(isAdmin);
    print(index);
    // Adjust the profile index based on user role
    if (isAdmin && index == 3) {
      // Admin profile (index 3)
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ManagePage()),
      // );
    } else if (isAdmin && index == 4) {
      // User profile (index 3)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserProfile(selectedIndex: selectedIndex, onItemTapped: onItemTapped,)),
      );
    }
    else if (!isAdmin && index == 3) {
      // User profile (index 3)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserProfile(selectedIndex: index, onItemTapped: onItemTapped,)),
      );
    } else {
      // Handle other navigation cases
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                DashboardPage(selectedIndex: selectedIndex)),
          );
          break;
        case 1:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ExplorePage()),
        // );
          break;
        case 2:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MapPage()),
        // );
          break;
      }
    }
  }

  @override
  Widget buildHorizontalScroll(int itemCount) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final cardWidth = screenWidth * 1; // Adjust card width to fit within the screen
        final cardHeight = screenWidth * 0.6; // Adjust card height based on the screen width
        final padding = screenWidth * 0.02; // Padding as a percentage of screen width

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              itemCount,
                  (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Container(
                  width: cardWidth,
                  height: cardHeight,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardHeight * 0.15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: const Color(0x3F000000),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                    width: cardWidth * 0.94, // Adjust inner container width
                    height: cardHeight,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: const Color(0x33A5A5A5),
                        ),
                        borderRadius: BorderRadius.circular(cardHeight * 0.15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(cardWidth * 0.03), // Scaled padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Section
                          Container(
                            width: cardWidth * 0.35,
                            height: cardHeight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: cardWidth * 0.33,
                                  height: cardHeight * 0.6,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/114x78"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: cardHeight * 0.2),
                                Text(
                                  'Last Visit: 25/11/2022',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: cardWidth * 0.03,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right Section
                          Expanded(  // Wrap the right section in Expanded to allow flexibility
                            child: Container(
                              height: cardHeight,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: cardHeight * 0.1,
                                    left: 0,
                                    child: Text(
                                      'Dr. Nambuvan',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: cardWidth * 0.05,
                                        fontFamily: 'Fredoka',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: cardHeight * 0.25,
                                    left: 0,
                                    child: Text(
                                      'Bachelor of veterinary science',
                                      style: TextStyle(
                                        color: const Color(0xFFA5A5A5),
                                        fontSize: cardWidth * 0.03,
                                        fontFamily: 'Fredoka',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: cardHeight * 0.45,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: cardWidth * 0.18,
                                          height: cardHeight * 0.1,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 2),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1.09,
                                                  color: Colors.redAccent),
                                              borderRadius:
                                              BorderRadius.circular(21.89),
                                            ),
                                          ),
                                          child: Text(
                                            'Roudy',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: cardWidth * 0.03,
                                              fontFamily: 'Fredoka',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: cardWidth * 0.04),
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: cardWidth * 0.01),
                                        Text(
                                          '2.5 km',
                                          style: TextStyle(
                                            color: const Color(0xFFA5A5A5),
                                            fontSize: cardWidth * 0.03,
                                            fontFamily: 'Fredoka',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: cardWidth * 0.04),
                                        const Icon(
                                          Icons.attach_money,
                                          color: Colors.green,
                                          size: 16.0,
                                        ),
                                        Text(
                                          '100\$',
                                          style: TextStyle(
                                            color: const Color(0xFFA5A5A5),
                                            fontSize: cardWidth * 0.03,
                                            fontFamily: 'Fredoka',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    height: 30,
                                    top: cardHeight * 0.73,
                                    left: cardWidth * 0.15,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print('Book Appointment button pressed');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: cardWidth * 0.04,
                                            vertical: cardHeight * 0.02),
                                      ),
                                      child: Text(
                                        'Book Appointment >',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: cardWidth * 0.03,
                                          fontFamily: 'Fredoka',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access isAdmin using Provider
    bool isAdmin = context.watch<AdminProvider>().isAdmin;

     var size = MediaQuery.of(context).size; // Get the screen size
      double width = size.width;
      double height = size.height;

      // Dynamically create BottomNavigationBar items
      final List<BottomNavigationBarItem> bottomNavItems = [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Calendar',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        if (isAdmin)
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
          ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];

      return Scaffold(
        body: SingleChildScrollView(  // Wrap the content in SingleChildScrollView for scrolling
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02), // Responsive padding
                decoration: BoxDecoration(
                  color: Colors.green, // Set background color to green
                  borderRadius: BorderRadius.circular(0), // Optional rounded corners
                ),
                child: Container(
                  height: size.height * 0.1, // Responsive height
                  width: width, // Full screen width
                  decoration: BoxDecoration(
                    color: Colors.green, // Background color for visibility
                    borderRadius: BorderRadius.circular(width * 0.03), // Scaled corner radius
                  ),
                  child: Stack(
                    children: [
                      // Text at Bottom Left
                      Positioned(
                        bottom: height * 0.01, // Responsive bottom position
                        left: width * 0.04, // Responsive left position
                        child:
                        FutureBuilder<String>(
                          future: GetUser().getUserName(), // Fetch the user's name
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // While fetching data
                              return Text(
                                "Hello, loading...",
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            } else if (snapshot.hasError || snapshot.data == null) {
                              // On error or no data
                              return Text(
                                "Hello, User!",
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              // On successful retrieval
                              return Text(
                                "Hello, ${snapshot.data}!",
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      // Image at Bottom Right
                      Positioned(
                        bottom: height * 0.01, // Responsive bottom position
                        right: width * 0.03, // Responsive right position
                        child: Container(
                          height: height * 0.07, // Responsive height
                          width: width * 0.15, // Responsive width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.03), // Scaled corner radius
                            color: Colors.grey.shade300, // Optional background color
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(width * 0.03), // Adjust to maintain rounded edges
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
              SizedBox(height: height / 35),
              _buildPetList(),
              SizedBox(height: height / 20),
              Container(
                width: size.width,
                // Remove fixed height, let the container expand based on content size
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02,
                ),
                decoration: ShapeDecoration(
                  color: Colors.red.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.07),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: size.width * 0.1,
                      offset: Offset(0, size.height * 0.01),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: SingleChildScrollView( // Wrap content inside a scroll view
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(right: size.width * 0.06, bottom: size.height * 0.01),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width * 0.065,
                              height: size.width * 0.065,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/26x26"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Vets',
                                  style: TextStyle(
                                    color: Color(0xFF131314),
                                    fontSize: size.width * 0.05,
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
                      SizedBox(height: size.height * 0.02),
                      buildHorizontalScroll(5),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.green[200],
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            onItemTapped(context, index, isAdmin); // Pass role to handle index
          },
          items: bottomNavItems,
        ),
      );
  }

  Future<void> _refreshPetList() async {
    try {
      final pets = await _petController.getAllPets();
      setState(() {
        _pets = pets;
      });

    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error refreshing pet list: $e")),
      );
    }
  }


  Widget _buildPetList() {
    return RefreshIndicator(
      onRefresh: _refreshPetList,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _pets.isEmpty
                ? const Center(child: Text("No pets added yet."))
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pet cards
                  ..._pets.map((pet) {
                    return GestureDetector(
                      onTap: () {
                        final petId = pet['id'];
                        _petController.navigateToPetProfile(context, petId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: pet['image']?.startsWith('http') ?? false
                                    ? NetworkImage(pet['image'])
                                    : pet['image']?.startsWith('/') ?? false // If it's a base64 string
                                    ? MemoryImage(base64Decode(pet['image']))
                                    : AssetImage('assets/profile.png') as ImageProvider,

                              ),
                              const SizedBox(height: 8),
                              Text(pet['name'] ?? 'Unknown'),
                            ],

                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  // AddButton at the end of the Row
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 20),
                    child: _buildAddButton(30), // Your AddButton
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


// Helper method to build add button
  Widget _buildAddButton(double width) {
    return SizedBox(
      width: width+1,
      height: width+1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPet(),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            "images/plus_icon.jpg",
            fit: BoxFit.cover,
            width: width,
            height: width,
          ),
        ),
      ),
    );
  }

}

