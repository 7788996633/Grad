import 'package:flutter/material.dart';

import '../factories/role_screen.dart';

class DefaultScreen implements RoleScreen {
  @override
  Widget build() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Default Screen',
        ),
      ),
      body: const Center(
        child: Text(
          'Screen not found',
        ),
      ),
    );
  }
}
