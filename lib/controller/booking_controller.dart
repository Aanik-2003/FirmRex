import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to add booking
  Future<void> addBooking({
    required String doctorId,
    required String patientName,
    required DateTime appointmentDate,
    required String time,
    required String purpose,
  }) async {
    try {
      // Add a new booking to the 'bookings' collection
      await _firestore.collection('bookings').add({
        'doctorId': doctorId,
        'patientName': patientName,
        'appointmentDate': appointmentDate,
        'time': time,
        'purpose': purpose,
        'createdAt': FieldValue.serverTimestamp(), // Automatically set timestamp
      });

      print('Booking successfully added!');
    } catch (e) {
      print('Error adding booking: $e');
    }
  }
}
