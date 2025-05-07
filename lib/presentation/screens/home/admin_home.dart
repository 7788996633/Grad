import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/issue_bloc/issues_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/lawyer_bloc/lawyer_bloc.dart';
import '../../../blocs/user_profile_bloc/user_profile_bloc.dart';
import '../../widgets/all_issues_list.dart';
import '../../widgets/custom_app_drawer.dart';
import '../admin_screens/issues_screens.dart/all_issues_screen.dart';
import '../admin_screens/issues_screens.dart/create_issue_screen.dart';
import '../admin_screens/users_management_screens/modify_users_permissions_screen.dart';
import '../issue_request/list_issue_requests_screen.dart';
import '../lawyer_screens/lawyers_list_screen.dart';
import '../notifications_screen.dart';
import '../settings/setting_screen.dart';
import '../user_screens/user_profile_screens/user_profile_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  final List<Map<String, dynamic>> sections = [
    {'title': 'Modify user permissions', 'icon': Icons.admin_panel_settings},
    {'title': 'Issues', 'icon': Icons.gavel},
    {'title': 'Issue Requests', 'icon': Icons.assignment},
    {'title': 'All Lawyers', 'icon':Icons.group},
    {'title': 'Invoices & Payments', 'icon': Icons.payment},
    {'title': 'Reports', 'icon': Icons.bar_chart},
    {'title': 'Vacations', 'icon': Icons.beach_access},
    {'title': 'User Settings', 'icon': Icons.admin_panel_settings},
    {'title': 'Legal Library', 'icon': Icons.library_books},
    {'title': 'Legal News', 'icon': Icons.newspaper},
    {'title': 'FAQs', 'icon': Icons.help_center},
    {'title': 'Company Info', 'icon': Icons.info},
    {'title': 'Lawyers & Trainees', 'icon': Icons.group},//Documents & Request// Icons.description
    {'title': 'Backup & Restore', 'icon': Icons.backup},
  ];

  void onCardPressed(BuildContext context, String title) {
    switch (title) {
      case 'Modify user permissions':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ModifyUsersPermissionsScreen(),
          ),
        );
        break;
      case 'Issues':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => IssuesBloc(),
              child: const AllIssuesList(),
            ),
          ),
        );
        break;
      case 'Issue Requests':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => IssueRequestsBloc(),
              child: const ListIssueRequestsScreen(),
            ),
          ),
        );
        break;
      case 'All Lawyers':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => LawyerBloc(),
              child: const LawyersListScreen(),
            ),
          ),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SectionPage(title: title),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    File? _pickedImage;
    // لنفترض أنك تحصل على userProfileModel من مكان ما، مثل Bloc أو Provider
    final userProfileModel = null; // قم بتعديله وفق حالتك

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manager of Yaghmour Company ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0XFF472A0C),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),

        ],
      ),

      drawer: BlocProvider(
          create: (context) => UserProfileBloc()..add(ShowUserProfileEvent()),

        child: CustomAppDrawer(),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllIssuesScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
              label: const Text('القضايا'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => IssuesBloc(),
                      child: const CreateIssueScreen(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
              label: const Text('انشاء قضية'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: sections.map((section) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 18,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.blueGrey[50],
                    child: InkWell(
                      onTap: () {
                        onCardPressed(context, section['title']);
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
          ],
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
