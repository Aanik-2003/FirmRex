import 'dart:io';

import 'package:firm_rex/auth/user_auth.dart';
import 'package:firm_rex/controller/get_user.dart';
import 'package:firm_rex/model/user_profile_edit.dart';
import 'package:firm_rex/views/add_pet.dart';
import 'package:firm_rex/views/loginpage.dart';
import 'package:firm_rex/views/pet_profile.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  final int selectedIndex;

  const UserProfile({super.key, required this.selectedIndex});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>{
  final _auth = UserAuth();
  final _getUser = GetUser();


  int selectedIndex;

  _UserProfileState() : selectedIndex = 0;


  // Method to refresh user data
  Future<void> refreshUserProfile() async {
    // Simulate a network call or data fetch
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _getUser.getUserName();
      _getUser.getUserNumber();
      _getUser.getUserAddress();
      _getUser.retrieveAndDecodeImage();
    });
  }

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
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            height: 100,
          ),
          SafeArea(
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                            Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => DashboardPage(selectedIndex: selectedIndex)),
                          );
                        },
                      ),
                      FutureBuilder<String>(
                        future: GetUser().getUserName(), // Fetch the user's name
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            // While fetching data
                            return Text(
                              "Hello, loading...",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError || snapshot.data == null) {
                            // On error or no data
                            return Text(
                              "Hello, User!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          } else {
                            // On successful retrieval
                            return Text(
                              "${snapshot.data}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                      ),

                      // const CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //     'https://i.pinimg.com/736x/06/9b/7b/069b7b62afc2b8f186d5c6823bc63073.jpg', // Replace with actual image URL
                      //   ),
                      // ),
                      FutureBuilder<Image?>(
                        future: _getUser.retrieveAndDecodeImage(), // Call the method to fetch the image path
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: CircularProgressIndicator(), // Show a loading indicator
                            );
                          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null || snapshot.data == '') {
                            return const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('images/profile.png'), // Fallback image
                            );
                          } else {
                            final Image image = snapshot.data!;
                            return CircleAvatar(
                              radius: 20,
                              backgroundImage: MemoryImage((image.image as MemoryImage).bytes), // Display the local image
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: RefreshIndicator(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListView(
                          children: [
                            const SizedBox(height: 30),
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    FutureBuilder<Image?>(
                                      future: _getUser.retrieveAndDecodeImage(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const CircleAvatar(
                                            radius: 150,
                                            backgroundColor: Colors.grey,
                                            child: CircularProgressIndicator(), // Show a loading indicator
                                          );
                                        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null || snapshot.data == '') {
                                          return const CircleAvatar(
                                            radius: 150,
                                            backgroundImage: AssetImage('images/profile.png'), // Fallback image
                                          );
                                        } else {
                                          final Image image = snapshot.data!;
                                          return CircleAvatar(
                                            radius: 150,
                                            backgroundImage: MemoryImage((image.image as MemoryImage).bytes), // Display the local image
                                          );
                                        }
                                      },
                                    ),
                                    Positioned(
                                      child: IconButton(
                                        onPressed: () {
                                          _getUser.pickAndStoreImage(); // Call your method to update the image
                                        },
                                        icon: const Icon(Icons.add_a_photo),
                                      ),
                                      bottom: -10,
                                      left: 200,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                FutureBuilder<String>(
                                  future: GetUser().getUserName(), // Fetch the user's name
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      // While fetching data
                                      return Text(
                                        "Hello, loading...",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      );
                                    } else if (snapshot.hasError || snapshot.data == null) {
                                      // On error or no data
                                      return Text(
                                        "Hello, User!",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      );
                                    } else {
                                      // On successful retrieval
                                      return Text(
                                        "${snapshot.data}",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 5),
                                FutureBuilder<String>(
                                  future: GetUser().getUserEmail(), // Fetch the user's name
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      // While fetching data
                                      return Text(
                                        "Email loading...",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else if (snapshot.hasError || snapshot.data == null) {
                                      // On error or no data
                                      return Text(
                                        "user@gmail.com",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else {
                                      // On successful retrieval
                                      return Text(
                                        "${snapshot.data}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    }
                                  },
                                ),
                                FutureBuilder<String>(
                                  future: GetUser().getUserNumber(), // Fetch the user's name
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      // While fetching data
                                      return Text(
                                        "Phone Number loading...",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else if (snapshot.hasError || snapshot.data == null) {
                                      // On error or no data
                                      return Text(
                                        "Phone",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else {
                                      // On successful retrieval
                                      return Text(
                                        "${snapshot.data}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    }
                                  },
                                ),
                                FutureBuilder<String>(
                                  future: GetUser().getUserAddress(), // Fetch the user's name
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      // While fetching data
                                      return Text(
                                        "Address loading...",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else if (snapshot.hasError || snapshot.data == null) {
                                      // On error or no data
                                      return Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    } else {
                                      // On successful retrieval
                                      return Text(
                                        "${snapshot.data}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () async{
                                    await _auth.signOut(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginPage()),
                                    );
                                  },
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
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context)=>EditUserProfile(
                                    onSave: refreshUserProfile,
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.pets, color: Colors.green),
                              title: const Text("Add Pet"),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddPet()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      onRefresh: refreshUserProfile)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

