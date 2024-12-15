import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

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
        'uid': uid,
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
  // Fetch bookings for a specific date
  Stream<List<Map<String, dynamic>>> getBookings(DateTime selectedDay) {
    // Get the start and end of the selected day
    DateTime startOfDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));

    // Query Firestore for bookings within the selected day's range
    return _firestore
        .collection('bookings')
        .where('appointmentDate', isGreaterThanOrEqualTo: startOfDay)
        .where('appointmentDate', isLessThanOrEqualTo: endOfDay)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'doctorId': doc['doctorId'],
          'patientName': doc['patientName'],
          'appointmentDate': (doc['appointmentDate'] as Timestamp).toDate(),
          'time': doc['time'],
          'purpose': doc['purpose'],
        };
      }).toList();
    });
  }
}
