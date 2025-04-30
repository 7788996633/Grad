import 'package:flutter/material.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text('My Tasks'),
      ),
      body: const Center(
        child: Text(
          'My Tasks Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
