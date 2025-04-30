import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../MyTasksPage.dart';
import 'home_accountant.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AccountantMainPage extends StatefulWidget {
  const AccountantMainPage({super.key});

  @override
  State<AccountantMainPage> createState() => _AccountantMainPageState();
}

class _AccountantMainPageState extends State<AccountantMainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AccountantHomePage(),
    const MyTasksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFF2FDF6),
        color: const Color(0xFF62D284),
        buttonBackgroundColor: const Color(0xFF50B76D),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.assignment, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}