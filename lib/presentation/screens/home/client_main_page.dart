import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_client.dart';  // تأكد من استيراد صفحة HomeClient

class MainClientPage extends StatefulWidget {
  @override
  _MainClientPageState createState() => _MainClientPageState();
}

class _MainClientPageState extends State<MainClientPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeClient(),  // صفحة HomeClient هي الصفحة الرئيسية
    FavoritesScreen(),
    LegalNewsScreen(),
  ];

  final List<Widget> _items = [
    Icon(Icons.home, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.newspaper, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0XFF472A0C),
        color: Colors.blue,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: _items,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text(
          'Your favorite cases and documents will appear here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class LegalNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal News'),
      ),
      body: Center(
        child: Text(
          'Latest legal news and updates will be shown here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
