import 'package:flutter/material.dart';
import '../../../../data/models/hiring_request_model.dart';
import 'info_item_model.dart';
import 'profile_info_card.dart';

// import 'edit_button.dart'; //ً

class ProfileInfoHiringRequest extends StatelessWidget {
  final HiringRequestModel request;

  const ProfileInfoHiringRequest({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoCard(
      items: [
        InfoItemModel(
          icon: Icons.subject,
          label: "Title",
          value: request.jopTitle ?? '',
        ),
        InfoItemModel(
          icon: Icons.description,
          label: "Description",
          value: request.description ?? '',
        ),
        InfoItemModel(
          icon: Icons.verified,
          label: "Status",
          value: request.status ?? '',
        ),
      ],
      // actionButton: EditButton(
      //   destinationScreen: UpdateIssueRequestScreen(issueRequest: request),
      // ),
    );
  }
}
