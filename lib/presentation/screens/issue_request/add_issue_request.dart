import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/hiring-requests/hiring-requests_block.dart';
import '../../../blocs/hiring-requests/hiring-requests_event.dart';
import '../../../blocs/hiring-requests/hiring-requests_state.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';


class AddIssueRequestScreen extends StatefulWidget {
  const AddIssueRequestScreen({super.key});

  @override
  State<AddIssueRequestScreen> createState() => _AddIssueRequestScreenState();
}

class _AddIssueRequestScreenState extends State<AddIssueRequestScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Issue Request ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<IssueRequestsBloc, IssueRequestsState>(
          listener: (context, state) {
            if (state is IssueRequestsSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Success: ${state.successmsg}")),
              );

            } else if (state is IssueRequestsFail ) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed: ${state.errmsg}")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                state is  IssueRequestsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<IssueRequestsBloc>(context).add(
                      CreateIssueRequestsEvent(
                        title: _titleController.text,
                        description: _descriptionController.text,

                      ),
                    );
                  },
                  child: const Text("Submit"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


