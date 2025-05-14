import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/issue_bloc/issues_bloc.dart';
import '../../data/models/issues_model.dart';
import '../screens/admin_screens/issues_screens.dart/issuescreen.dart';

class IssueItem extends StatelessWidget {
  const IssueItem({super.key, required this.issuesModel});
  final IssuesModel issuesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => IssuesBloc(),
              child: IssueScreen(
                issueId: issuesModel.id,
              ),
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            issuesModel.title,
          ),
          subtitle: Text(issuesModel.priority),
        ),
      ),
    );
  }
}
