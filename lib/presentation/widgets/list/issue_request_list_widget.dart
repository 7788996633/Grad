import 'package:flutter/material.dart';
import '../../../data/models/issue_request_model.dart';
import 'issue_request_card.dart';

class RequestListWidget extends StatelessWidget {
  final List<IssueRequestModel> requests;

  const RequestListWidget({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return const Center(child: Text("No issue requests found."));
    }
    return ListView.separated(
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return IssueRequestCard(
            request: requests[index]
        );
      },
    );
  }
}
