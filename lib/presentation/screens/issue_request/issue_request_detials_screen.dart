import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';
import '../../../data/models/issue_request_model.dart';

class IssueRequestDetailsScreen extends StatefulWidget {
  final int issueRequestId;

  const IssueRequestDetailsScreen({super.key, required this.issueRequestId});
  @override
  State<IssueRequestDetailsScreen> createState() =>
      _IssueRequestDetailsScreenState();
}

class _IssueRequestDetailsScreenState extends State<IssueRequestDetailsScreen> {
  final Color customColor = const Color(0xFFB8820E);
  final Color valueColor = const Color(0xFF0F6829);

  @override
  void initState() {
    super.initState();

    BlocProvider.of<IssueRequestsBloc>(context).add(
      GetIssueRequestsByIdEvent(
        issueRequestsId: widget.issueRequestId,
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String label, String value,
      {Widget? customWidget}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: customColor),
          const SizedBox(width: 10),
          Expanded(
            child: customWidget ??
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: "$label: ",
                          style: TextStyle(color: customColor)),
                      TextSpan(
                          text: value, style: TextStyle(color: valueColor)),
                    ],
                  ),
                ),
          ),
        ],
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
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20),
            buildInfoTile(Icons.person, "title", request.title),
            buildInfoTile(Icons.email, "description", request.description),
            buildInfoTile(Icons.location_on, "status", request.status),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: customColor,
        title: const Text(
          "Issue Request",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
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
            return buildProfileUI(state.issueRequestModel, context);
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
