import 'dart:convert';
import 'dart:typed_data';
import 'package:firm_rex/controller/pet_controller.dart';
import 'package:firm_rex/views/add_pet.dart';
import 'package:firm_rex/views/book_appointment.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/admin_provider.dart';
import '../controller/doctor_controller.dart';
import '../controller/get_user.dart';
import 'add_doctors.dart';
import 'calender.dart';
import 'map.dart';
import 'notification.dart';

class DashboardPage extends StatefulWidget {
  final int selectedIndex;

  // Constructor to accept selectedIndex
  const DashboardPage({super.key, required this.selectedIndex,});

  @override
  _DashboardPageState createState() => _DashboardPageState();
  
}

class _DashboardPageState extends State<DashboardPage> {

  final DoctorController _doctorController = DoctorController();
  bool _isLoading = true;
  List<Map<String, dynamic>> _doctors = [];

  final _petController = PetController();
  int selectedIndex = 0; // Current selected index for BottomNavigationBar

  _DashboardPageState() : selectedIndex = 0;

  List<Map<String, dynamic>> _pets = [];

  @override
  void initState() {
    super.initState();
    _refreshPetList(); // Initial load of pet list
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate data fetch. Replace this with your actual API call or database fetch.
    await _doctorController.fetchDoctors();
    setState(() {
      _doctors = _doctorController.doctors; // Assume this contains fetched data
      _isLoading = false;
    });
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddDoctors(selectedIndex: index, onItemTapped: onItemTapped,)),
      );
    } else if (isAdmin && index == 4) {
      // User profile (index 3)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserProfile(selectedIndex: index, onItemTapped: onItemTapped,)),
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
                DashboardPage(selectedIndex: index)),
          );
          break;
        case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarWithNotes(selectedIndex: index, onItemTapped: onItemTapped)),
        );
          break;
        case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapSample(selectedIndex: index, onItemTapped: onItemTapped,)),
        );
          break;
      }
    }
  }

  @override
  Widget buildHorizontalScroll(List<Map<String, dynamic>> doctors) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final cardWidth = screenWidth *
            1; // Adjust card width to fit within the screen
        final cardHeight = screenWidth *
            0.6; // Adjust card height based on the screen width
        final padding = screenWidth *
            0.02; // Padding as a percentage of screen width

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              doctors.length,
                  (index) {
                final doctor = doctors[index];
                return Padding(
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
                          width: cardWidth * 0.94,
                          // Adjust inner container width
                          height: cardHeight,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: const Color(0x33A5A5A5),
                              ),
                              borderRadius: BorderRadius.circular(
                                  cardHeight * 0.15),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(cardWidth * 0.03),
                            // Scaled padding
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Section
                                Container(
                                  width: cardWidth * 0.35,
                                  height: cardHeight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Container(
                                        width: cardWidth * 0.33,
                                        height: cardHeight * 0.6,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: doctor['photo'] != null
                                                ? MemoryImage(base64Decode(doctor['photo'])) // Use base64 decoded image
                                                : AssetImage("images/profile.png") as ImageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: cardHeight * 0.2),
                                    ],
                                  ),
                                ),

                                // Right Section
                                Expanded(
                                  child: Container(
                                    height: cardHeight,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: cardHeight * 0.1,
                                          left: 0,
                                          child: Text(
                                            doctor['fullName'] ?? 'Unknown',
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
                                            doctor['fieldOfStudy'] ??
                                                'Field Unknown',
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
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 13,
                                                    vertical: 2),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 1.09,
                                                        color: Colors
                                                            .redAccent),
                                                    borderRadius: BorderRadius
                                                        .circular(21.89),
                                                  ),
                                                ),
                                                child: Text(
                                                  doctor['status'] ??
                                                      'Status Unknown',
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
                                                doctor['location'] ?? 'Unknown',
                                                style: TextStyle(
                                                  color: const Color(
                                                      0xFFA5A5A5),
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
                                                doctor['chargePerAppointment'] ?? '0\$',
                                                style: TextStyle(
                                                  color: const Color(
                                                      0xFFA5A5A5),
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AppointmentPage(doctorName: doctor['fullName'],
                                                    doctorId: doctor['id'],),
                                                ),
                                              );
                                              print(
                                                  'Book Appointment button pressed');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(8),
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
                );
              },
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NotificationsPage()),
                            );
                            // Handle the tap event here
                            print('Notification icon tapped');
                            // You can perform any action, such as navigating or showing a message
                          },
                          child: Icon(
                            Icons.notifications, // Notification icon
                            size: width * 0.08, // Adjust size as needed
                            color: Colors.grey.shade300, // Icon color
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
                  color: Colors.white.withOpacity(0.4),
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
                                  image: AssetImage("images/logo.jpeg"),
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
                      buildHorizontalScroll(_doctors),
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

