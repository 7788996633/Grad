import 'package:flutter/material.dart';

import 'modify_users_permissions_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ModifyUsersPermissionsScreen(),
          ));
        },
        icon: const Icon(
          Icons.person,
        ),
      ),
    );
  }
}