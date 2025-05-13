import 'package:flutter/material.dart';
import 'package:untitled23/blocs/hiring_requests/hiring_requests_block.dart';
import 'package:untitled23/data/models/hiring_request_model.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';

import '../../screens/issue_request/issue_request_detials_screen.dart';
import 'reusable_list_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiringRequestCard extends StatelessWidget {
  final HiringRequestModel request;

  const HiringRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HiringRequestsBloc>(context);

    return ReusableListCard(
      title: request.jopTitle,
      subtitle: request.description,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => IssueRequestsBloc(),
              child: IssueRequestDetailsScreen(issueRequestId: request.id),
            ),
          ),
        );
      },
      onDelete: () {
        //bloc.add(DeleteIssueRequestEvent(issueRequestId: request.id));
       // bloc.add(GetAllIssueRequestsEvent());
      },
      deleteDialogTitle: "Delete Hiring Request",
      deleteDialogContent: "Are you sure you want to delete this hiring request?",
      deleteSuccessMessage: "Request deleted successfully",
    );
  }
}
