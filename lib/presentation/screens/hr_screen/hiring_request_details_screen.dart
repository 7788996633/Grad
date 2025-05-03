import 'package:flutter/material.dart';

class HiringRequestDetailsScreen extends StatelessWidget {
  final int requestId;

  const HiringRequestDetailsScreen({required this.requestId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiring Request Details'),
      ),
      body: Center(
        child: Text('Request ID: $requestId'),
      ),
    );
  }
}
