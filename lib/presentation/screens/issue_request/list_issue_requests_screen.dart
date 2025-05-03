import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';
import '../../../data/models/issue_request_model.dart';

class ListIssueRequestsScreen extends StatefulWidget {
  const ListIssueRequestsScreen({super.key});

  @overridegit init
  git add .
  git commit -m "initial commit"
  git remote add origin https://github.com/7788996633/Grad.git
  State<ListIssueRequestsScreen> createState() => _ListIssueRequestsScreenState();
}

class _ListIssueRequestsScreenState extends State<ListIssueRequestsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late IssueRequestsBloc bloc;
  List<IssueRequestModel> _allRequests = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<IssueRequestsBloc>(context);
    bloc.add(GetAllIssueRequests());
  }

  void _onSearch(String requestId) {
    if (requestId.trim().isNotEmpty) {
      final id = int.tryParse(requestId.trim());
      if (id != null) {
        bloc.add(GetIssueRequestsById(issueRequestsId: id));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid numeric ID')),
        );
      }
    } else {
      bloc.add(GetAllIssueRequests());
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
              child: BlocBuilder<IssueRequestsBloc, IssueRequestsState>(
                builder: (context, state) {
                  if (state is IssueRequestsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is IssueRequestsListLoaded) {
                    _allRequests = state.issueRequestsList;
                    return _buildRequestList(_allRequests);
                  } else if (state is IssueRequestsByIdLoaded) {
                    return _buildRequestList([state.issueRequestModel]);
                  } else if (state is IssueRequestsFail) {
                    return Center(
                      child: Text(
                        'Error: ${state.errmsg}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data yet.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(GetAllIssueRequests()),
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
        return _buildRequestCard(requests[index]);
      },
    );
  }

  Widget _buildRequestCard(IssueRequestModel request) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      shadowColor: Colors.deepPurple.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${request.title}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFFB8820E),
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Description:', request.description),
            _buildInfoRow('Status:', request.status),
            _buildInfoRow('Admin Note:', request.adminNote ?? "No note"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$title ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
