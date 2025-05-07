import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/issue_bloc/issues_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../admin_screens/issues_screens.dart/create_issue_screen.dart';
import '../issue_request/add_issue_request.dart';
import '../settings/setting_screen.dart';

// ------------------ User Home Screen ------------------
class UserHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {
      'icon': Icons.add_circle,
      'title': 'Submit New Case',
    },
    {
      'icon': Icons.add_circle,
      'title': 'Submit New issues',
    },

    {
      'icon': Icons.contact_support,
      'title': 'Request Legal Consultation',
    },
    {
      'icon': Icons.library_books,
      'title': 'Legal Library',
    },
    {
      'icon': Icons.report_problem,
      'title': 'Submit Complaint',
    },
    {
      'icon': Icons.question_answer,
      'title': 'FAQs & Legal Terms',
    },
    {
      'icon': Icons.school,
      'title': 'Submit Training Request',
    },
  ];

  UserHomeScreen({super.key});


  void _navigateToPage(BuildContext context, String title) {
    switch (title) {

      case 'Submit New Issue Requests':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>     BlocProvider(
                create: (context) => IssueRequestsBloc(),
                child: const AddIssueRequestScreen(),
              ),
            ));
        break;

      case 'add Issues':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => IssuesBloc(),
              child: const CreateIssueScreen(),
            ),
          ),
        );
        break;
      case 'Request Legal Consultation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LegalConsultationScreen()),
        );
        break;
      case 'Legal Library':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LegalLibraryScreen()),
        );
        break;
      case 'Submit Complaint':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubmitComplaintScreen()),
        );
        break;
      case 'FAQs & Legal Terms':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FAQsScreen()),
        );
        break;
      case 'Submit Training Request':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TrainingRequestScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Yaghmour Company'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => const SettingsScreen(),
          ),
        ],
      ),
      drawer:const Drawer(),
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
                  _navigateToPage(context, gridItems[index]['title']);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        gridItems[index]['icon'],
                        size: 50,
                        color: Theme.of(context).primaryColor,
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
