import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_profile_bloc/user_profile_bloc.dart';
import '../../widgets/custom_app_bar.dart';
import '../notifications_screen.dart';
import '../settings/setting_screen.dart';

class UserHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {
      'icon': Icons.add_circle,
      'title': 'Submit New Case',
      'page': const NewCaseScreen()
    },
    {
      'icon': Icons.contact_support,
      'title': 'Request Legal Consultation',
      'page': const LegalConsultationScreen()
    },
    {
      'icon': Icons.library_books,
      'title': 'Legal Library',
      'page': const LegalLibraryScreen()
    },
    {
      'icon': Icons.report_problem,
      'title': 'Submit Complaint',
      'page': const SubmitComplaintScreen()
    },
    {
      'icon': Icons.question_answer,
      'title': 'FAQs & Legal Terms',
      'page': const FAQsScreen()
    },
    {
      'icon': Icons.school,
      'title': 'Submit Training Request',
      'page': const TrainingRequestScreen()
    },
  ];

  UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Yaghmour Company ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0XFF5599E7),
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
        child: const CustomAppDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => gridItems[index]['page']),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        gridItems[index]['icon'],
                        size: 50,
                        color: const Color(0XFF5599E7),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        gridItems[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ------------------ New Case Screen ------------------
class NewCaseScreen extends StatelessWidget {
  const NewCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit New Case')),
      body: const Center(
        child: Text(
          'Here you can submit a new case.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ------------------ Legal Consultation Screen ------------------
class LegalConsultationScreen extends StatelessWidget {
  const LegalConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Legal Consultation')),
      body: const Center(
        child: Text(
          'Here you can request a legal consultation.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ------------------ Legal Library Screen ------------------
class LegalLibraryScreen extends StatelessWidget {
  const LegalLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Legal Library')),
      body: const Center(
        child: Text(
          'Here you can browse legal documents and articles.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ------------------ Submit Complaint Screen ------------------
class SubmitComplaintScreen extends StatelessWidget {
  const SubmitComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Complaint')),
      body: const Center(
        child: Text(
          'Here you can submit a complaint.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ------------------ FAQs Screen ------------------
class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQs & Legal Terms')),
      body: const Center(
        child: Text(
          'Here you can read FAQs and legal terms.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// ------------------ Training Request Screen ------------------
class TrainingRequestScreen extends StatelessWidget {
  const TrainingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Training Request')),
      body: const Center(
        child: Text(
          'Here you can submit a request for training.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
