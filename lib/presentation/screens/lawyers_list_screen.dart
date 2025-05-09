import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/lawyer_bloc/lawyer_bloc.dart';
import '../../../blocs/lawyer_bloc/lawyer_event.dart';
import '../../../blocs/lawyer_bloc/lawyer_state.dart';
import '../../../blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import '../../../data/models/lawyer_model.dart';
import 'lawyer_screens/lawyer_profile_screens/lawyer_details_screen.dart';

class LawyersListScreen extends StatefulWidget {
  const LawyersListScreen({super.key});

  @override
  State<LawyersListScreen> createState() => _LawyersScreenState();
}

class _LawyersScreenState extends State<LawyersListScreen> {
  final TextEditingController _searchController = TextEditingController();
  late LawyerBloc bloc;
  List<LawyerModel> _allLawyers = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LawyerBloc>(context);
    bloc.add(GetAllLawyersEvent());
  }

  void _onSearch(String lawyerId) {
    if (lawyerId.trim().isNotEmpty) {
      final id = int.tryParse(lawyerId.trim());
      if (id != null) {
        bloc.add(GetLawyerByIdEvent(lawyerId: id));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid numeric ID')),
        );
      }
    } else {
      bloc.add(GetAllLawyersEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F6),
      appBar: AppBar(
        title: const Text(
          'Lawyers Directory',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 8,
        backgroundColor: const Color(0XFF472A0C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<LawyerBloc, LawyerState>(
                builder: (context, state) {
                  if (state is LawyerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LawyersListLoaded) {
                    _allLawyers = state.lawyersList;
                    return _buildLawyerList(_allLawyers);
                  } else if (state is LawyerInfoByIdLoaded) {
                    return _buildLawyerList([state.lawyerModel]);
                  } else if (state is LawyerFail) {
                    return Center(
                      child: Text(
                        'Error: ${state.errorMsg}',
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
        onPressed: () {
          bloc.add(GetAllLawyersEvent());
        },
        backgroundColor: const Color(0XFF472A0C),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
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
          hintText: 'Search by Lawyer ID...',
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0XFF472A0C),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildLawyerList(List<LawyerModel> lawyers) {
    if (lawyers.isEmpty) {
      return const Center(
        child: Text("No lawyers found."),
      );
    }
    return ListView.separated(
      itemCount: lawyers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _buildLawyerCard(lawyers[index]);
      },
    );
  }

  Widget _buildLawyerCard(LawyerModel lawyer) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LawyerProfileBloc(),
              child: LawyerDetailsScreen(
                lawyerId: lawyer.id,
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        elevation: 6,
        shadowColor: Colors.deepPurple.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lawyer.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0XFF472A0C),
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoRow('Experience:', '${lawyer.experienceYears} years'),
              _buildInfoRow('Specialization:', lawyer.specialization),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    bloc.add(DeleteLawyerByIdEvent(lawyerId: lawyer.id));
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
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
