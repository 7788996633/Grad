import 'package:flutter/material.dart';
import '../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../data/models/issue_request_model.dart';
import '../screens/issue_request/issue_request_detials_screen.dart';
import '../widgets/reusable_list_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssueRequestCard extends StatelessWidget {
  final IssueRequestModel request;

  const IssueRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<IssueRequestsBloc>(context);

    return ReusableListCard(
      title: request.title,
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
        bloc.add(DeleteIssueRequestEvent(issueRequestId: request.id));
        bloc.add(GetAllIssueRequestsEvent());
      },
      deleteDialogTitle: "Delete Issue Request",
      deleteDialogContent: "Are you sure you want to delete this issue request?",
      deleteSuccessMessage: "Request deleted successfully",
    );
  }
}
