import 'package:firm_rex/model/pet_profile_edit.dart';
import 'package:firm_rex/views/pet_health.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:firm_rex/views/user_profile.dart';
import 'package:flutter/material.dart';


class PetProfile extends StatefulWidget {
  final int selectedIndex;

  const PetProfile({super.key, required this.selectedIndex});

  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  int selectedIndex;

  _PetProfileState() : selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget
        .selectedIndex; // Set the initial selected index from the constructor
  }

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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ExplorePage()),
      // );
        break;
      case 2:
      // Navigate to Map page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MapPage()),
      // );
        break;
      case 3:
      // Navigate to Manage page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ManagePage()),
      // );
        break;
      case 4:
      // Navigate to Profile page (this is already the current page)
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserProfile(selectedIndex: selectedIndex)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.pinimg.com/736x/f0/f8/85/f0f885b81b5848e9b9379f3e6e0a2437.jpg', // Replace with actual pet image URL
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage(selectedIndex: 0,)),
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 8,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // User Name Section
                        Text(
                          'Bella',
                          style: TextStyle(
                            color: Color(0xFF131314),
                            fontSize: 26,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Button Section
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Color(0xFFF576AC),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(
                            Icons.female, // Example icon, replace with your asset if needed
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // About Bella with Edit Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "About Bella",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Edit Icon or Edit Text Button
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditPetProfile();
                            },
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoCard('Age', '1y 4m 11d'),
                      _buildInfoCard('Weight', '7.5 kg'),
                      _buildInfoCard('Height', '54 cm'),
                      _buildInfoCard('Color', 'Black'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "My first dog which was gifted by my mother for my 20th birthday.",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Bella's Status",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.health_and_safety, color: Colors.red, size: 40),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            'Health: Last medical checkup (2 weeks ago)',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PetHealth(selectedIndex: 3),
                              ),
                            );
                          },
                          child: const Text(
                            "View",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

