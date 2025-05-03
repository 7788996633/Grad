import 'package:flutter/material.dart';

import '../ls.dart';
import '../admin_screens/users_management_screens/modify_users_permissions_screen.dart';
import '../notifications_screen.dart';
import '../p.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const ModifyUsersPermissionsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('تعديل صلاحيات المستخدمين'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications),
                  label: const Text('الإشعارات'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: ProfileScreenLauncher(),
            ),
            const Expanded(child: LawyerButtonScreen()),
          ],
        ),
      ),
    );
  }
}
