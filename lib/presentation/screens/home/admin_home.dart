import 'package:flutter/material.dart';


class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  final List<Map<String, dynamic>> sections = [
    {'title': 'Lawyers & Trainees', 'icon': Icons.group},
    {'title': 'Cases Management', 'icon': Icons.gavel},
    {'title': 'Tasks & Delegations', 'icon': Icons.assignment},
    {'title': 'Documents & Requests', 'icon': Icons.description},
    {'title': 'Invoices & Payments', 'icon': Icons.payment},
    {'title': 'Reports', 'icon': Icons.bar_chart},
    {'title': 'Vacations', 'icon': Icons.beach_access},
    {'title': 'User Settings', 'icon': Icons.admin_panel_settings},
    {'title': 'Legal Library', 'icon': Icons.library_books},
    {'title': 'Legal News', 'icon': Icons.newspaper},
    {'title': 'FAQs', 'icon': Icons.help_center},
    {'title': 'Company Info', 'icon': Icons.info},
    {'title': 'Notifications', 'icon': Icons.notifications},
    {'title': 'Backup & Restore', 'icon': Icons.backup},
  ];

  // Function to handle the onPressed event for each card
  /*void onCardPressed(BuildContext context, String title) {
    switch (title) {
      case 'Lawyers & Trainees':
        Navigator.push(
          //context,
          /*MaterialPageRoute(
            //builder: (_) => BlocProvider(
              create: (_) => LawyerBloc(), // توفير الـ Bloc هنا
              child: const LawyersScreen(), // شاشة الـ Bloc المناسبة
            ),
          ),*/
        );
        break;
      case 'Cases Management':
        Navigator.push(
         // context,
      /*    MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => CasesBloc(), // تغيير إلى Bloc المناسب
              child: const CasesManagementScreen(), // شاشة الـ Bloc المناسبة
            ),
          ),*/
        );
        break;
    // يمكن إضافة المزيد من الـ cases كما في السابق
      default:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SectionPage(title: title),
          ),
        );
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: const Color(0XFF472A0C),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            tooltip: 'Settings',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/admin.jpg'), // admin image
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: sections.map((section) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 18, // 2 cards per row
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.blueGrey[50],
                child: InkWell(
                  onTap: () {
                    //onCardPressed(context, section['title']); // Use the function here
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          section['icon'],
                          size: 40,
                          color: const Color(0XFF472A0C),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          section['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF472A0C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;

  const SectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: Text(
          'Welcome to $title Page!',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
