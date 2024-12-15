
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/model/esewa_pay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class AppointmentPage extends StatefulWidget {
  final String? doctorName;
  final String? doctorId;

  const AppointmentPage({super.key, required this.doctorName, required this.doctorId});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final _esewaPay = EsewaPay();
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;
  String? _selectedPurpose;
  late String doctorName;
  late String docId;

  final List<String> _timeSlots = [
    "9:30",
    "10:30",
    "11:30",
    "3:30",
    "4:30",
    "5:30",
  ];

  final List<String> _purposes = [
    "Followup",
    "Doctor Appointment",
    "Routine Checkup",
    "Vaccination",
  ];

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with default values if null
    doctorName = widget.doctorName ?? "Unknown Doctor";
    docId = widget.doctorId ?? "Unknown ID";  // Default value if doctorId is null
  }

  // Method to add booking to Firestore
  Future<void> _addBooking() async {
    if (_selectedTime == null || _selectedPurpose == null || _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields.")),
      );
      return;
    }

    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('bookings').add({
        'uid': uid,
        'doctorId': docId,
        'patientName': _nameController.text,
        'appointmentDate': _selectedDate,
        'time': _selectedTime!,
        'purpose': _selectedPurpose!,
        'createdAt': FieldValue.serverTimestamp(), // Automatically set timestamp
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Appointment booked for ${DateFormat('MMMM dd, yyyy').format(_selectedDate)} at $_selectedTime for $_selectedPurpose"),
        ),
      );
      _esewaPay.esewapaymentcall();
    } catch (e) {
      print('Error adding booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error booking appointment. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(doctorName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% padding on each side
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Input Section
              const Text(
                "Your Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              const SizedBox(height: 20),

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
              const SizedBox(height: 20),

              // Purpose Dropdown Section
              const Text(
                "Select Purpose",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedPurpose,
                items: _purposes.map((purpose) {
                  return DropdownMenuItem<String>(
                    value: purpose,
                    child: Text(purpose),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPurpose = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Select the purpose",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              const SizedBox(height: 30),

              // Book Appointment Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, screenHeight * 0.08), // Responsive height
                ),
                onPressed: _addBooking,
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
      ),
    );
  }
}
