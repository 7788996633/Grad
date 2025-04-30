import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'home_lawyer.dart';

class LawyerHomePage extends StatefulWidget {
  const LawyerHomePage({Key? key}) : super(key: key);

  @override
  State<LawyerHomePage> createState() => _LawyerHomePageState();
}

class _LawyerHomePageState extends State<LawyerHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // الصفحة الرئيسية
    HomeLawyerScreen(),
    // المفضلات
    Center(child: Text('مفضلتي')),
    // المواعيد
    Center(child: Text('مواعيدي')),
    // الأخبار القانونية
    Center(child: Text('الأخبار القانونية')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex], // عرض الصفحة بناءً على الـ index المحدد
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          // الواجهة الرئيسية
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("الرئيسية"),
            selectedColor: Color(0xFF1E9AD8),
          ),
          // المفضلات
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("المفضلة"),
            selectedColor: Color(0xFF1E9AD8),
          ),
          // المواعيد
          SalomonBottomBarItem(
            icon: Icon(Icons.schedule),
            title: Text("مواعيدي"),
            selectedColor: Color(0xFF1E9AD8),
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.new_releases),
            title: Text("الأخبار القانونية"),
            selectedColor: Color(0xFF1E9AD8),
          ),
        ],
      ),
    );
  }
}
