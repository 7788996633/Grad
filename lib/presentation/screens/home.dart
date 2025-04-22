import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/add_user_profile_screen.dart';
import 'package:graduation/presentation/screens/modify_users_permissions_screen.dart';
import 'package:graduation/presentation/screens/notifications_screen.dart';

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
          const Text("My User Profile"),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddUserProfileScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.person_pin,
            ),
          ),
        ],
      ),
    );
  }
}
