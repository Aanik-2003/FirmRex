import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.description,
    required this.timestamp,
  });
}


class NotificationsPage extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "New Message",
      description: "You have a new message from John.",
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    NotificationModel(
      title: "App Update",
      description: "A new version of the app is available.",
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationModel(
      title: "Reminder",
      description: "Don't forget your meeting at 3 PM.",
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
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
        // You can handle the notification tap here, e.g., navigate to a detail page
        print('Notification tapped: ${notification.title}');
      },
    );
  }
}
