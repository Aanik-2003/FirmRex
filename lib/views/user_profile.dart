import 'package:firm_rex/views/pet_profile.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfileScreen(),
//     );
//   }
// }

class UserProfile extends StatefulWidget {
  final int selectedIndex;

  const UserProfile({super.key, required this.selectedIndex});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>{
  int selectedIndex;

  _UserProfileState() : selectedIndex = 0;

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
              builder: (context) => PetProfile(selectedIndex: selectedIndex)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            height: 100,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                            Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {},
                      ),
                      const Text(
                        "Aaniya Thapa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/06/9b/7b/069b7b62afc2b8f186d5c6823bc63073.jpg', // Replace with actual image URL
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(30),
                      //   topRight: Radius.circular(30),
                      // ),
                    ),
                    child: ListView(
                      children: [
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 150,
                              backgroundImage: NetworkImage(
                                'https://i.pinimg.com/736x/f0/f8/85/f0f885b81b5848e9b9379f3e6e0a2437.jpg', // Replace with actual profile image
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Aaniya Thapa',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'aaniyathapa@gmail.com',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              '0758519048',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign out",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.info_outline, color: Colors
                              .green),
                          title: const Text("About me"),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                              Icons.location_on_outlined, color: Colors.green),
                          title: const Text("My Address"),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.pets, color: Colors.green),
                          title: const Text("Add Pet"),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

