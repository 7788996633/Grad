import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/issue_bloc/issues_bloc.dart';
import 'package:graduation/data/models/issues_model.dart';

import '../../../constant.dart';


class JobRequestScreen extends StatelessWidget {
  const JobRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IssuesBloc() ,
      child: Scaffold(
        backgroundColor: AppColors.softGray,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFE1E1E1),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  'إدارة قضايا',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 20),
                BlocBuilder<IssuesBloc, IssuesState>(
                  builder: (context, state) {
                    if (state is IssuesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is IssuesLoadedSuccessFully) {
                      final issue = state.issue;
                      return JobRequestCard(issue: issue);
                    } else if (state is IssuesFail) {
                      return Text(state.errmsg);
                    }
                    return const Text('يرجى الانتظار...');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobRequestCard extends StatelessWidget {
  final IssuesModel issue;


  const JobRequestCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: AppColors.darkBlue ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رقم القضية: ${issue.id}', style: const TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 4),
                Text('${issue.startDate}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' ${issue.opponentName}'),
                const SizedBox(height: 4),
                Text('الحالة :${issue.status}'),
                const SizedBox(height: 4),
                Text(' الاولوية:${issue.priority}'),
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
                foregroundColor: Colors.black,
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
