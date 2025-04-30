
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_hr.dart';

class HrMainPage extends StatefulWidget {
  const HrMainPage({super.key});

  @override
  State<HrMainPage> createState() => _HrMainPageState();
}

class _HrMainPageState extends State<HrMainPage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HrHomePage(),
    const StatisticsPage(),
    const MyTasksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,//B8820E
        color: Color(0xFFB8820E),
        buttonBackgroundColor: Color(0xFFB8820E),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.black54),
          Icon(Icons.bar_chart, size: 30, color: Colors.black54),
          Icon(Icons.task, size: 30, color: Colors.black54),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: const Center(
        child: Text(
          'Statistics Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: const Center(
        child: Text(
          'My Tasks Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


class HrSettingsPage extends StatelessWidget {
  const HrSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('HR Settings Page')),
    );
  }
}

class JobApplicationsPage extends StatelessWidget {
  const JobApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Applications')),
      body: const Center(child: Text('Job Applications Page')),
    );
  }
}

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List')),
      body: const Center(child: Text('Employee List Page')),
    );
  }
}

class AddEmployeeDataPage extends StatelessWidget {
  const AddEmployeeDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee Data')),
      body: const Center(child: Text('Add Employee Data Page')),
    );
  }
}

class ScheduleInterviewsPage extends StatelessWidget {
  const ScheduleInterviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Interviews')),
      body: const Center(child: Text('Schedule Interviews Page')),
    );
  }
}
