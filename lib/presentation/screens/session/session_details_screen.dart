import 'package:flutter/material.dart';
import 'package:graduation/data/models/session_model.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key, required this.sessionModel});
  final SessionModel sessionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            sessionModel.type,
          ),
        ],
      ),
    );
  }
}
