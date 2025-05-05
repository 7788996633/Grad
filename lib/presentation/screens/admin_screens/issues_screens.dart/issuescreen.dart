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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<IssuesBloc>(context).add(
      IssueShowbyId(id:  widget.issueId),
    );
  }

  late IssuesModel issue;
  Widget buildInfoTile(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: customColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: TextStyle(color: customColor),
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyle(color: valueColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileUI() {
    return Center(
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
            CircleAvatar(
              radius: 45,
              backgroundColor: customColor,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lawyer Certificate",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            buildInfoTile(Icons.title, "Title", issue.title),
            buildInfoTile(Icons.numbers, "Issue Number", issue.issueNumber),
            buildInfoTile(Icons.category, "Category", issue.category),
            buildInfoTile(Icons.title, "Court Name", issue.courtName),
            buildInfoTile(Icons.numbers, "Number Of Payments",
                issue.numberOfPayments.toString()),
            buildInfoTile(
                Icons.numbers, "total Cost", issue.totalCost.toString()),
            // buildInfoTile(Icons.numbers, "Amount Paid", issue.amountPaid),
            // buildInfoTile(Icons.title, "Description", issue.description),
            buildInfoTile(Icons.title, "Court Name", issue.courtName),
            buildInfoTile(Icons.title, "Status", issue.status),
            buildInfoTile(Icons.numbers, "Priority", issue.priority),
            buildInfoTile(Icons.date_range, "Start Date", issue.startDate),
            // buildInfoTile(Icons.date_range, "End Date", issue.endDate),
            buildInfoTile(Icons.date_range, "Start Date", issue.createdAt),
            buildInfoTile(Icons.date_range, "End Date", issue.updatedAt),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditIssueScreen(
                    issue: issue,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: customColor,
        title: const Text(
          "Issue Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
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
