import 'package:flutter/material.dart';

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

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(height: 10),
              const Text('Client Name', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5),
              const Text('email@example.com',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.brightness_6),
                title: const Text('Toggle Dark/Light Mode'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _showSettings(context),
          ),
        ],
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
