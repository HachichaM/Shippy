import 'package:flutter/material.dart';

class NotificationCenter extends StatelessWidget {
  final List<String> notifications;

  NotificationCenter({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.white,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.notification_important),
          title: Text(notifications[index]),
        ),
      ),
    );
  }
}
