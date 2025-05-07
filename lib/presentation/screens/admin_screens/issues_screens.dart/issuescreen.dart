import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/issue_bloc/issues_bloc.dart';
import '../../../../data/models/issues_model.dart';
import 'edit_issue_screen.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key, required this.issueId});
  final int issueId;

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final Color customColor = const Color(0xFF472A0C);
  final Color valueColor = const Color(0xFF0F6829);

  late IssuesModel issue;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<IssuesBloc>(context).add(
      IssueShowbyId(id: widget.issueId),
    );
  }

  Widget buildInfoTile(IconData icon, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: customColor, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: valueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }

  Widget buildProfileUI() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: customColor,
            child: const Icon(Icons.gavel, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 15),
          const Text(
            "Issue Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                buildInfoTile(Icons.title, "Title", issue.title),
                buildInfoTile(Icons.numbers, "Issue Number", issue.issueNumber),
                buildInfoTile(Icons.category, "Category", issue.category),
                buildInfoTile(Icons.account_balance, "Court Name", issue.courtName),
                buildInfoTile(Icons.payments, "Number Of Payments", issue.numberOfPayments.toString()),
                buildInfoTile(Icons.attach_money, "Total Cost", issue.totalCost.toString()),
                buildInfoTile(Icons.info_outline, "Status", issue.status),
                buildInfoTile(Icons.priority_high, "Priority", issue.priority),
                buildInfoTile(Icons.date_range, "Start Date", issue.startDate),
                buildInfoTile(Icons.calendar_today, "Created At", issue.createdAt),
                buildInfoTile(Icons.update, "Updated At", issue.updatedAt),
              ],
            ),
          ),
        ],
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
          "Issue Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditIssueScreen(issue: issue),
                ),
              );
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<IssuesBloc, IssuesState>(
        builder: (context, state) {
          if (state is IssuesLoadedSuccessFully) {
            issue = state.issue;
            return buildProfileUI();
          } else if (state is IssuesFail) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "There is an error:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.errmsg,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
