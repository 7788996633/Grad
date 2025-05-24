import '../../../../blocs/issue_bloc/issues_bloc.dart';
import '../../../../constant.dart';
import '../../../../data/models/issues_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuesScreen extends StatelessWidget {
  final IssuesModel issuesModel;

  const IssuesScreen({super.key, required this.issuesModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IssuesBloc(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Issue Management',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IssuesScreenCard(issues: issuesModel),
          ),
        ),
      ),
    );
  }
}

class IssuesScreenCard extends StatelessWidget {
  final IssuesModel issues;

  IssuesScreenCard({super.key, required this.issues});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: AppColors.darkBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رقم القضية: ${issues.id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 4),
                Text('${issues.startDate}',
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(' ${issues.opponentName}')),
                const SizedBox(width: 8),
                Text('الحالة :${issues.status}'),
                const SizedBox(width: 8),
                Text('الاولوية:${issues.priority}'),
                const SizedBox(width: 8),
                const Row(
                  children: [
                    Icon(Icons.visibility),
                    SizedBox(width: 4),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.remove_red_eye),
              label: const Text('عرض تفاصيل القضية'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
