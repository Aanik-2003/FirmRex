import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final DateTime timestamp;
  final String type; // Added type to distinguish between booking, note, etc.

  NotificationModel({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
  });
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late List<NotificationModel> notifications;

  @override
  void initState() {
    super.initState();
    notifications = [];
    _fetchNotifications();
  }

  // Fetch notifications (bookings, notes, etc.)
  Future<void> _fetchNotifications() async {
    // Get the current user ID
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Fetch notifications related to bookings
    QuerySnapshot bookingSnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('uid', isEqualTo: uid) // Assuming the doctor is the user
        .get();
    for (var doc in bookingSnapshot.docs) {
      notifications.add(NotificationModel(
        title: 'New Booking',
        description: 'You have a new booking with ${doc['patientName']}.',
        timestamp: (doc['appointmentDate'] as Timestamp).toDate(),
        type: 'booking',
      ));
    }

    // Fetch notes
    QuerySnapshot notesSnapshot = await FirebaseFirestore.instance
        .collection('notes')
        .where('uid', isEqualTo: uid)
        .get();
    for (var doc in notesSnapshot.docs) {
      notifications.add(NotificationModel(
        title: 'New Note',
        description: 'You have a new note: ${doc['title']}.',
        timestamp: (doc['timestamp'] as Timestamp).toDate(),
        type: 'note',
      ));
    }

    setState(() {
      notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp)); // Sort by timestamp
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.green,
      ),
      body: notifications.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator if no notifications yet
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationTile(notification: notification);
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(notification.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(notification.description),
      trailing: Text(
        '${notification.timestamp.hour}:${notification.timestamp.minute}',
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // Handle the notification tap based on the notification type
        print('Notification tapped: ${notification.title}');
        if (notification.type == 'booking') {
          // Navigate to booking details page
        } else if (notification.type == 'note') {
          // Navigate to notes page
        }
      },
    );
  }
}
