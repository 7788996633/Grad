import 'package:flutter/material.dart';

import '../factories/role_screen.dart';

class UserHomeScreen implements RoleScreen {
  @override
  Widget build() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Home',
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome User to Home',
        ),
      ),
    );
  }
}
