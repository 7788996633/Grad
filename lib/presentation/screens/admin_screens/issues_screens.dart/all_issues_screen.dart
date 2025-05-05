import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/issue_bloc/issues_bloc.dart';
import 'package:graduation/presentation/widgets/all_issues_list.dart';

class AllIssuesScreen extends StatelessWidget {
  const AllIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Issues"),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider(
                create: (context) => IssuesBloc(),
                child: const AllIssuesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
