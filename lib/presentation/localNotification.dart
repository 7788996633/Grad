import 'dart:convert';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graduation/constant.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings();
    final LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          print('Notification clicked: ${details.payload}');
        }
      },
    );
  }

  static void showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Socket Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(android: androidDetails),
      payload: payload,
    );
  }

  static Future<Socket> _connectToServer() async {
    return await Socket.connect(IP, 4040);
  }


  static Future<void> sendMessage({
    required String fromUser,
    required String toUser,
    required String message,
  }) async {
    try {
      final socket = await _connectToServer();
      socket.write(jsonEncode({
        'type': 'message',
        'from': fromUser,
        'to': toUser,
        'content': message,
      }));

      socket.listen((data) {
        final response = jsonDecode(utf8.decode(data));
        if (response['type'] == 'message') {
          showNotification(
            title: 'From ${response['from']}',
            body: response['content'],
            payload: 'chat',
          );
        }
      });
    } catch (e) {
      print('Message sending error: $e');
    }
  }
}