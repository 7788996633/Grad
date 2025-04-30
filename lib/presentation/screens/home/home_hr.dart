import 'package:flutter/material.dart';

class HrHomePage extends StatelessWidget {
  const HrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HR Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // إشعارات
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('HR Name'),
              accountEmail: const Text('hr@example.com'), // يمكنك حذفه إذا لا تريد بريد
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFB8820E),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HrSettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // هنا تضيف منطق تسجيل الخروج
                Navigator.pop(context); // يغلق الدراور
                // يمكن تذهب إلى صفحة تسجيل الدخول مثلاً
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HrCustomCard(
              title: 'Job Applications',
              icon: Icons.assignment_ind,
              color: Color(0xFFF0C674),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobApplicationsPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            HrCustomCard(
              title: 'Employee List',
              icon: Icons.people,
              color: Color(0xFFFFD8A8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmployeeListPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            HrCustomCard(
              title: 'Add Employee Data',
              icon: Icons.person_add,
              color: Color(0xFFF8F1E5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddEmployeeDataPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            HrCustomCard(
              title: 'Schedule Interviews',
              icon: Icons.event_available,
              color: Color(0xFFD7B377),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScheduleInterviewsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HrCustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const HrCustomCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.black87,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ صفحات التنقل ------------------

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
