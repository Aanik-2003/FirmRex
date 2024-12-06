import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Discover',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Explore',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Manage',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Profile',
            ),
          ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  color: Colors.blue,
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Replace with actual image URL
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cardiologist',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  Divider(thickness: 1, height: 40),
                  Text(
                    'Experience',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '10 years of experience in cardiology, specializing in heart surgeries and patient care.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(thickness: 1, height: 40),
                  Text(
                    'Qualifications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- MBBS from XYZ University\n- MD in Cardiology from ABC Institute',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(thickness: 1, height: 40),
                  Text(
                    'Contact Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+1 234 567 890'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('dr.john.doe@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('1234 Heart Lane, Health City, TX'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
