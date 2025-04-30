import 'package:flutter/material.dart';

class HomeClient extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': Icons.add_circle, 'title': 'Submit New Case', 'page': NewCaseScreen()},
    {'icon': Icons.contact_support, 'title': 'Request Legal Consultation', 'page': LegalConsultationScreen()},
    {'icon': Icons.library_books, 'title': 'Legal Library', 'page': LegalLibraryScreen()},
    {'icon': Icons.report_problem, 'title': 'Submit Complaint', 'page': SubmitComplaintScreen()},
    {'icon': Icons.question_answer, 'title': 'FAQs & Legal Terms', 'page': FAQsScreen()},
    {'icon': Icons.school, 'title': 'Submit Training Request', 'page': TrainingRequestScreen()},
  ];

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              SizedBox(height: 10),
              Text('Client Name', style: TextStyle(fontSize: 20)),
              SizedBox(height: 5),
              Text('email@example.com', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.brightness_6),
                title: Text('Toggle Dark/Light Mode'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
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
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _showSettings(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 12,
            childAspectRatio:0.8,
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
                    MaterialPageRoute(builder: (context) => gridItems[index]['page']),
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
                      SizedBox(height: 20),
                      Text(
                        gridItems[index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit New Case')),
      body: Center(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Legal Consultation')),
      body: Center(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Legal Library')),
      body: Center(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Complaint')),
      body: Center(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs & Legal Terms')),
      body: Center(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Training Request')),
      body: Center(
        child: Text(
          'Here you can submit a request for training.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
