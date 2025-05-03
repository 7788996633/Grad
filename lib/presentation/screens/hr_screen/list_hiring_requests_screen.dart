import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/hiring-requests/hiring-requests_block.dart';
import '../../../blocs/hiring-requests/hiring-requests_event.dart';
import '../../../blocs/hiring-requests/hiring-requests_state.dart';
import '../../../data/models/hiring_request_model.dart';
import 'hiring_request_details_screen.dart';

class ListHiringRequestsScreen extends StatefulWidget {
  const ListHiringRequestsScreen({super.key});

  @override
  State<ListHiringRequestsScreen> createState() => _ListHiringRequestsScreenState();
}

class _ListHiringRequestsScreenState extends State<ListHiringRequestsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late HiringRequestsBloc bloc;  // يجب تعديلها إلى HiringRequestsBloc
  List<HiringRequestModel> _allRequests = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HiringRequestsBloc>(context); // استخدام HiringRequestsBloc هنا
    bloc.add(GetAllHiringRequests());
  }

  void _onSearch(String requestId) {
    if (requestId.trim().isNotEmpty) {
      final id = int.tryParse(requestId.trim());
      if (id != null) {
        bloc.add(GetHiringRequestsById(hiringRequestId: id));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid numeric ID')),
        );
      }
    } else {
      bloc.add(GetAllHiringRequests());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F6),
      appBar: AppBar(
        title: const Text('Hiring Requests'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.deepPurple,
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
              child: BlocBuilder<HiringRequestsBloc, HiringRequestsState>(
                builder: (context, state) {
                  if (state is HiringRequestsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HiringRequestsListLoaded) {
                    _allRequests = state.hiringRequestsList;
                    return _buildRequestList(_allRequests);
                  } else if (state is HiringRequestsIdLoaded) {
                    return _buildRequestList([state.hiringRequestModel]);
                  } else if (state is HiringRequestsFail) {
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
        onPressed: () => bloc.add(GetAllHiringRequests()),
        backgroundColor: Colors.deepPurple,
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
          prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
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

  Widget _buildRequestList(List<HiringRequestModel> requests) {
    if (requests.isEmpty) {
      return const Center(child: Text("No hiring requests found."));
    }
    return ListView.separated(
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _buildRequestCard(requests[index]);
      },
    );
  }

  Widget _buildRequestCard(HiringRequestModel request) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HiringRequestDetailsScreen(requestId: request.id),
          ),
        );



      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        shadowColor: Colors.deepPurple.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Title: ${request.jopTitle}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoRow('Type:', request.type),
              _buildInfoRow('Description:', request.description),
            ],
          ),
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
