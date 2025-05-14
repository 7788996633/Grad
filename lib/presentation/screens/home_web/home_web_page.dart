import 'package:flutter/material.dart';
import 'custom_drawer_web.dart';
import 'main_page_web.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    MainScreen(),
    Center(child: Text('الإعدادات', style: TextStyle(fontSize: 24))),
    Center(child: Text('الملف الشخصي', style: TextStyle(fontSize: 24))),
    Center(child: Text('تسجيل الخروج', style: TextStyle(fontSize: 24))),
  ];

  void onSelectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawer(
            selectedIndex: selectedIndex,
            onItemSelected: onSelectItem,
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }
}