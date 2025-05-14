import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';
import '../../../constant.dart';
import '../../../data/models/issue_request_model.dart';

import '../../widgets/appbar/custom_appbar_title.dart';
import '../../widgets/button/edit_button.dart';
import '../../widgets/profile_detials/build_info_title.dart';
import 'update_issue_request_screen.dart';

class IssueRequestDetailsScreen extends StatefulWidget {
  final int issueRequestId;

  const IssueRequestDetailsScreen({super.key, required this.issueRequestId});
  @override
  State<IssueRequestDetailsScreen> createState() =>
      _IssueRequestDetailsScreenState();
}

class _IssueRequestDetailsScreenState extends State<IssueRequestDetailsScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<IssueRequestsBloc>(context).add(
      GetIssueRequestsByIdEvent(
        issueRequestsId: widget.issueRequestId,
      ),
    );
  }

  Widget buildProfileUI(IssueRequestModel request, BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              buildInfoTile(Icons.subject, "title", request.title, ),
              buildInfoTile(Icons.description, "description", request.description),
              buildInfoTile(Icons.verified, "status", request.status),
              const SizedBox(height: 30),
              EditButton(
                destinationScreen: UpdateIssueRequestScreen(
                  issueRequest: request,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: customAppBar("Issue Request"),
      body: BlocConsumer<IssueRequestsBloc, IssueRequestsState>(
        listener: (context, state) {
          if (state is IssueRequestsFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errmsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is IssueRequestsLoadedSuccessfully) {
            return buildProfileUI(state.issueRequest, context);
          } else if (state is IssueRequestsFail) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("There is an error:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(state.errmsg,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
