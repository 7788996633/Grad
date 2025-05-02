import 'package:flutter/material.dart';

class AccountanHomeScreen extends StatelessWidget {
  const AccountanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text(
          'Accountant',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // إشعارات
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Text(
                  'User Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
      drawer: const AccountantDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: CustomCard(
                title: 'Employee Salaries List',
                icon: Icons.list_alt,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmployeeSalariesPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomCard(
                title: 'Verify Salary Delivery',
                icon: Icons.verified_user,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalaryVerificationPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomCard(
                title: 'Salary Delivery Schedule',
                icon: Icons.schedule,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalarySchedulePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountantDrawer extends StatelessWidget {
  const AccountantDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF62D284)),
            accountName: Text('User Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // تسجيل الخروج
            },
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Card(
          //EBEBEB
          color: const Color(0xFFEBEBEB), // ← هنا لون الكارد الرمادي الفاتح
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: const Color(0xFF62D284),
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
        ),
      ),
    );
  }
}

//------------------------

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class EmployeeSalariesPage extends StatelessWidget {
  const EmployeeSalariesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text('Employee Salaries List'),
      ),
      body: const Center(child: Text('Employee Salaries Page')),
    );
  }
}

class SalaryVerificationPage extends StatelessWidget {
  const SalaryVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text('Verify Salary Delivery'),
      ),
      body: const Center(child: Text('Salary Verification Page')),
    );
  }
}

class SalarySchedulePage extends StatelessWidget {
  const SalarySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62D284),
        title: const Text('Salary Delivery Schedule'),
      ),
      body: const Center(child: Text('Salary Schedule Page')),
    );
  }
}
