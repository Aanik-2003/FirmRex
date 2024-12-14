import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dr.Nambuvan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Image
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://i.pinimg.com/736x/fb/0e/17/fb0e1739d5b0f708829b7c7e9ad7b847.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  color: Colors.black.withOpacity(0.3),
                ),
                const Positioned(
                  bottom: 10,
                  left: 16,
                  child: Text(
                    "Dr. Nambuvan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Doctor Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Name and Qualification
                  const Text(
                    "Dr. Nambuvan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Bachelor of Veterinary Science",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),

                  // Ratings and Reviews
                  // Row(
                  //   children: [
                  //     Icon(Icons.star, color: Colors.amber, size: 20),
                  //     Icon(Icons.star, color: Colors.amber, size: 20),
                  //     Icon(Icons.star, color: Colors.amber, size: 20),
                  //     Icon(Icons.star, color: Colors.amber, size: 20),
                  //     Icon(Icons.star_half, color: Colors.amber, size: 20),
                  //     SizedBox(width: 8),
                  //     Text(
                  //       "5.0 (100 reviews)",
                  //       style: TextStyle(color: Colors.grey[600]),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 8),

                  // Availability and Location
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "Monday - Friday 8:00 am - 5:00 pm",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "2.5 km",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Fee
                  const Text(
                    "Rs.500 for an Appointment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Doctor Bio
                  Text(
                    "Dr. Nambhuvan, one of the most skilled and experienced veterinarians "
                        "and the owner of the most convenient animal clinic 'Petz & Vetz'. "
                        "Our paradise is situated in the heart of the town with a pleasant environment. "
                        "We are ready to treat your beloved doggos & puppers with love and involvement.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),

                  // Book Appointment Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Book Appointment Logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Appointment Booked!")),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8),
                        Text(
                          "Book Now",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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
