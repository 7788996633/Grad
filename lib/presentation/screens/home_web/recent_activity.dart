import 'package:flutter/material.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  final List<Activity> activities = const [
    Activity(time: '42 mins ago', title: 'Task Updated', description: 'Nikolai updated a Task', color: Colors.blue),
    Activity(time: '1 day ago', title: 'Deal Added', description: 'Panshi updated a Task', color: Colors.red),
    Activity(time: '40 mins ago', title: 'Published Article', description: 'Rasel published an Article', color: Colors.orange),
    Activity(time: '1 day ago', title: 'Dock Updated', description: 'Roshni updated a Dock', color: Colors.purple),
    Activity(time: '1 day ago', title: 'Replied Comment', description: 'Jonathan added a Comment', color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent Activities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          ...activities.map((activity) => activityWidget(activity)).toList(),
        ],
      ),
    );
  }

  Widget activityWidget(Activity activity) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: activity.color),
      title: Text(activity.title),
      subtitle: Text(activity.description),
      trailing: Text(activity.time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }
}

class Activity {
  final String time;
  final String title;
  final String description;
  final Color color;

  const Activity({
    required this.time,
    required this.title,
    required this.description,
    required this.color,
  });
}
