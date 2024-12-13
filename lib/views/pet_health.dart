import 'package:firm_rex/controller/pet_controller.dart';
import 'package:firm_rex/views/medical_records.dart';
import 'package:firm_rex/views/pet_profile.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';

class PetHealth extends StatefulWidget {
  final int selectedIndex;
  const PetHealth({super.key, required this.selectedIndex});

  @override
  _PetHealthState createState() => _PetHealthState();
}

class _PetHealthState extends State<PetHealth> {
  final _petController = PetController();
  int selectedIndex;
  _PetHealthState() : selectedIndex = 0;



  // Build horizontal scroll view for upcoming vaccinations
  Widget buildHorizontalScroll(int itemCount) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          itemCount,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
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
  void initState() {
    super.initState();
    selectedIndex = widget
        .selectedIndex; // Set the initial selected index from the constructor
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update selected index
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage(selectedIndex: 0)),
        );
        break;
      case 1:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PetHealth(selectedIndex: 1)),
        // );
        break;
      case 2:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PetHealth(selectedIndex: 2)),
        // );
        break;
      case 3:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PetHealth(selectedIndex: 3)),
        // );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfile(selectedIndex: 4)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Container with header
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => PetProfile(selectedIndex: 4,)),
                        // );
                        // _petController.navigateToPetProfile(context,);
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
                Row(
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
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Upcoming Vaccinations Container
          Container(
            width: size.width * 0.9, // Make responsive with screen size
            height: 220,
            padding: const EdgeInsets.only(top: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Upcoming Vaccinations',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
        showSelectedLabels: true,
        // Show labels for selected items
        currentIndex: selectedIndex,
        // Highlight the selected item
        onTap: _onItemTapped,
        // Update the state on tap
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
}
