import 'package:flutter/material.dart';

import '../factories/role_screen.dart';

class LawyerHomeScreen implements RoleScreen {
  @override
  Widget build() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lawyer Home',
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome Lawyer to Home',
        ),
      ),
    );
  }
}
