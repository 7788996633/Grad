import 'package:flutter/material.dart';

import '../../widgets/drawer_web/custom_drawer_web.dart';
import '../home_web/main_page_web.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  int selectedPage = 0;

  final List<Widget> pages = [
    const MainScreen(),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
  ];

  void _onDrawerItemSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawerWeb(onItemSelected: _onDrawerItemSelected),
          Expanded(child: pages[selectedPage]),
        ],
      ),
    );
  }
}
