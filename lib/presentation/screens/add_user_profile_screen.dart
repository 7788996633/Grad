import 'package:flutter/material.dart';

class AddUserProfileScreen extends StatefulWidget {
  const AddUserProfileScreen({super.key});

  @override
  State<AddUserProfileScreen> createState() => _AddUserProfileScreenState();
}

class _AddUserProfileScreenState extends State<AddUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create My Profile ",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: const Column(
          children: [
            Text(
              "Add Your Information Below",
            ),
          ],
        ),
      ),
    );
  }
}
