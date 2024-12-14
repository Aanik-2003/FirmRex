import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  final List<String> _timeSlots = [
    "9:30",
    "10:30",
    "11:30",
    "3:30",
    "4:30",
    "5:30",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dr. Nambuvan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.green,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Discover',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.pets),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.manage_accounts),
      //       label: 'Manage',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker Section
            const Text(
              "Choose a Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            // Time Picker Section
            const Text(
              "Pick a Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: _timeSlots.map((time) {
                return ChoiceChip(
                  label: Text(time),
                  selected: _selectedTime == time,
                  selectedColor: Colors.green,
                  onSelected: (selected) {
                    setState(() {
                      _selectedTime = selected ? time : null;
                    });
                  },
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: _selectedTime == time ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),

            Spacer(),

            // Book Appointment Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                if (_selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select a time slot.")),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Appointment booked for ${DateFormat('MMMM dd, yyyy').format(_selectedDate)} at $_selectedTime"),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Book Now!"),
                  SizedBox(width: 8),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

