import 'package:flutter/material.dart';

import '../screens/notifications_screen.dart';

import '../screens/settings/setting_screen.dart';
import '../../constant.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.darkBlue,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          tooltip: 'Settings',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          tooltip: 'Notifications',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
