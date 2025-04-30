import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9), // خلفية رمادية
      appBar: AppBar(
        backgroundColor: const Color(0xFF8C9D8B), // لون AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // يرجع للصفحة السابقة
          },
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold, // غامقة
          ),
        ),
      ),
      body: const NotificationsList(),
    );


  }
}

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  final List<NotificationModel> notificationsList = const [
    NotificationModel(
      id: 1,
      title: 'New Message',
      message: 'You have received a new message!',
      isRead: false,
    ),
    NotificationModel(
      id: 2,
      title: 'System Update',
      message: 'System update completed successfully.',
      isRead: true,
    ),
    NotificationModel(
      id: 3,
      title: 'Reminder',
      message: 'Don\'t forget your appointment tomorrow.',
      isRead: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notificationsList.length,
      itemBuilder: (context, index) {
        return NotificationItem(notificationModel: notificationsList[index]);
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // مكان تنفيذ حدث الضغط، مثل تعليم الإشعار كمقروء
      },
      child: Card(
        color: Colors.white, // الكارت لونه أبيض
        elevation: 6, // الظل
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Icon(
            notificationModel.isRead
                ? Icons.mark_email_read
                : Icons.mark_email_unread,
            color: notificationModel.isRead ? Colors.grey : Colors.green,
            size: 30,
          ),
          title: Text(
            notificationModel.title,
            style: TextStyle(
              fontWeight: notificationModel.isRead
                  ? FontWeight.normal
                  : FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              notificationModel.message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // مكان تنفيذ حذف الإشعار
            },
          ),
        ),
      ),
    );
  }
}

class NotificationModel {
  final int id;
  final String title;
  final String message;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.isRead,
  });
}
