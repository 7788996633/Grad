import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/factories/role_screen.dart';
import 'package:graduation/presentation/screens/home/lawyer_home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LawyerHomePage extends StatefulWidget implements RoleScreen {
  const LawyerHomePage({super.key});

  @override
  State<LawyerHomePage> createState() => _LawyerHomePageState();

  @override
  Widget build() {
    throw UnimplementedError();
  }
}

class _LawyerHomePageState extends State<LawyerHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // الصفحة الرئيسية
    const LawyerHomeScreen(),
    // المفضلات
    const Center(child: Text('مفضلتي')),
    // المواعيد
    const Center(child: Text('مواعيدي')),
    // الأخبار القانونية
    const Center(child: Text('الأخبار القانونية')),
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
            icon: const Icon(Icons.home),
            title: const Text("الرئيسية"),
            selectedColor: const Color(0xFF1E9AD8),
          ),
          // المفضلات
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text("المفضلة"),
            selectedColor: const Color(0xFF1E9AD8),
          ),
          // المواعيد
          SalomonBottomBarItem(
            icon: const Icon(Icons.schedule),
            title: const Text("مواعيدي"),
            selectedColor: const Color(0xFF1E9AD8),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.new_releases),
            title: const Text("الأخبار القانونية"),
            selectedColor: const Color(0xFF1E9AD8),
          ),
        ],
      ),
    );
  }
}
