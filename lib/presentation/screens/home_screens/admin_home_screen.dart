import 'package:flutter/material.dart';

import '../factories/role_screen.dart';

class AdminHomeScreen implements RoleScreen {
  @override
  Widget build() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Home',
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome Admin to Home',
        ),
      ),
    );
  }
}
