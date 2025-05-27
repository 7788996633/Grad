import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/lawyer_in_issues_bloc/lawyer_in_issues_bloc.dart';
import 'package:graduation/presentation/widgets/custom_lawyer_item.dart';

import '../../data/models/lawyer_model.dart';

class LawyersInIssueList extends StatefulWidget {
  const LawyersInIssueList({
    super.key,
    required this.issueId,
  });
  @override
  State<LawyersInIssueList> createState() => _LawyersInIssueListState();

  final int issueId;
}

class _LawyersInIssueListState extends State<LawyersInIssueList> {
  @override
  void initState() {
    BlocProvider.of<LawyerInIssuesBloc>(context).add(
      GetAllLawyersInIssuesEvent(issueId: widget.issueId),
    );
    super.initState();
  }

  List<LawyerModel> _allLawyers = [];

  Widget _buildLawyerList(List<LawyerModel> lawyers) {
    if (lawyers.isEmpty) {
      return const Center(
        child: Text("No lawyers found."),
      );
    }
    return ListView.builder(
      itemCount: lawyers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomLawyerItem(
          lawyer: lawyers[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LawyerInIssuesBloc, LawyerInIssuesState>(
      builder: (context, state) {
        if (state is LawyerInIssuesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LawyerInIssuesListLoadedSuccessfully) {
          _allLawyers = state.lawyerInissues;
          return _buildLawyerList(_allLawyers);
        } else if (state is LawyerInIssuesFail) {
          return Center(
            child: Text(
              'Error: ${state.errmsg}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(child: Text('No data yet.'));
        }
      },
    );
  }
}
