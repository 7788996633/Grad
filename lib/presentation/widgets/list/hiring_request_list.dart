import 'package:flutter/material.dart';
import '../../../data/models/hiring_request_model.dart';

import 'hiring_request_card.dart';


class HiringRequestLisWidget extends StatelessWidget {
  final List<HiringRequestModel> requests;

  const HiringRequestLisWidget({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return const Center(child: Text("No hiring requests found."));
    }
    return ListView.separated(
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return HiringRequestCard(
            request: requests[index]
        );
      },
    );
  }
}
