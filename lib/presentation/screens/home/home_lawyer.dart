import 'package:flutter/material.dart';

class HomeLawyerScreen extends StatefulWidget {
  const HomeLawyerScreen({Key? key}) : super(key: key);

  @override
  State<HomeLawyerScreen> createState() => _HomeLawyerScreenState();
}

class _HomeLawyerScreenState extends State<HomeLawyerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.gavel, 'title': 'القضايا'},
    {'icon': Icons.schedule, 'title': 'الجلسات'},
    {'icon': Icons.calendar_today, 'title': 'طلب إجازة'},
    {'icon': Icons.insert_drive_file, 'title': 'التقارير'},
    {'icon': Icons.menu_book, 'title': 'مراجع قانونية'},
    {'icon': Icons.event_available, 'title': 'مواعيد الاجتماعات'},
    {'icon': Icons.question_answer, 'title': 'استشارات قانونية'},
    {'icon': Icons.people, 'title': 'اجتماعات العملاء'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E9AD8),
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
    accountEmail: const Text('hr@example.com'),
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

    },
    ),
    ListTile(
    leading: const Icon(Icons.logout),
    title: const Text('Logout'),
    onTap: () {
    Navigator.pop(context);
    }, ), ],  ),),






      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'العدالة تبدأ من هنا. لا تتوقف عن السعي لتحقيق الحق.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E9AD8)),
                textAlign: TextAlign.center,
              ),
            ),


            // الأزرار
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E9AD8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'إضافة تذكير',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E9AD8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'إضافة قضية',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Grid View
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final Animation<double> animation = CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      (index / items.length),
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  );
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(animation),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 6,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // أكشن عند الضغط
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item['icon'], size: 40, color: Color(0xFF1E9AD8)),
                              SizedBox(height: 12),
                              Text(
                                item['title'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
