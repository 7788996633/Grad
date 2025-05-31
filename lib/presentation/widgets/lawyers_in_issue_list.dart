import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/lawyer_in_issues_bloc/lawyer_in_issues_bloc.dart';
import '../../data/models/lawyer_model.dart';
import 'custom_lawyer_item.dart';

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
  List<LawyerModel> _allLawyers = [];
  List<int> selectedLawyerIds = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LawyerInIssuesBloc>(context).add(
      GetAllLawyersInIssuesEvent(issueId: widget.issueId),
    );
  }

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
          isSelected: selectedLawyerIds.contains(lawyers[index].id), // ✅ هذا السطر هو اللي يغير اللون
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
          selectedLawyerIds = _allLawyers.map((lawyer) => lawyer.id).toList(); // ✅ كل المحامين الحاليين مختارين
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
