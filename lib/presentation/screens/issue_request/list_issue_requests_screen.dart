import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';
import '../../../data/models/issue_request_model.dart';
import 'issue_request_card.dart';

class ListIssueRequestsScreen extends StatefulWidget {
  const ListIssueRequestsScreen({super.key});

  @override
  State<ListIssueRequestsScreen> createState() => _ListIssueRequestsScreenState();
}

class _ListIssueRequestsScreenState extends State<ListIssueRequestsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late IssueRequestsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<IssueRequestsBloc>(context);
    bloc.add(GetAllIssueRequestsEvent());
  }

  void _onSearch(String requestId) {
    if (requestId.trim().isNotEmpty) {
      final id = int.tryParse(requestId.trim());
      if (id != null) {
        bloc.add(GetIssueRequestsByIdEvent(issueRequestsId: id));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid numeric ID')),
        );
      }
    } else {
      bloc.add(GetAllIssueRequestsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F6),
      appBar: AppBar(
        title: const Text('List Issue Requests'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: const Color(0xFFB8820E),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocConsumer<IssueRequestsBloc, IssueRequestsState>(
                listener: (context, state) {
                  if (state is IssueRequestsSuccess) {
                    print('Success: ${state.successmsg}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.successmsg),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is IssueRequestsFail) {
                    print('Error: ${state.errmsg}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: ${state.errmsg}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is IssueRequestsByIdLoaded) {
                    // Example: When searching by ID, print it to console
                    print('Issue request found by ID: ${state.issueRequestModel.id}');
                  }
                },
                builder: (context, state) {
                  if (state is IssueRequestsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is IssueRequestsListLoaded) {
                    return _buildRequestList(state.issueRequestsList);
                  } else if (state is IssueRequestsByIdLoaded) {
                    return _buildRequestList([state.issueRequestModel]);
                  } else {
                    bloc.add(GetAllIssueRequestsEvent());
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(GetAllIssueRequestsEvent()),
        backgroundColor: const Color(0xFFB8820E),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        controller: _searchController,
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: 'Search by Request ID...',
          prefixIcon: const Icon(Icons.search, color: Color(0xFFB8820E)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildRequestList(List<IssueRequestModel> requests) {
    if (requests.isEmpty) {
      return const Center(child: Text("No issue requests found."));
    }
    return ListView.separated(
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return IssueRequestCard.create(
          context: context,
          request: requests[index],
          bloc: bloc,
        );
      },
    );
  }
}
