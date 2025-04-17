import 'package:flutter/material.dart';
import 'package:graduated/presentation/screens/modify_users_permissions_screen.dart';
import 'package:graduated/presentation/screens/notifications_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ModifyUsersPermissionsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
    );
  }
}
