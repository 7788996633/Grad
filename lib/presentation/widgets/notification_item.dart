import 'package:flutter/material.dart';
import 'package:graduated/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          notificationModel.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(notificationModel.message),
      ),
    );
  }
}
