import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/widgets/lawyer_item.dart';

import '../../../blocs/lawyer_bloc/lawyer_bloc.dart';
import '../../../blocs/lawyer_bloc/lawyer_event.dart';
import '../../../blocs/lawyer_bloc/lawyer_state.dart';
import '../../../data/models/lawyer_model.dart';
import '../widgets/custom_search_bar.dart';

class LawyersListScreen extends StatefulWidget {
  const LawyersListScreen({super.key});

  @override
  State<LawyersListScreen> createState() => _LawyersScreenState();
}

class _LawyersScreenState extends State<LawyersListScreen> {
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
            CustomSearchBar(
              hint: 'Search by Lawyer Name',
              onSearch: _onSearch,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<LawyerBloc, LawyerState>(
                builder: (context, state) {
                  if (state is LawyerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LawyersListLoaded) {
                    _allLawyers = state.lawyersList;
                    return _buildLawyerList(_allLawyers);
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
          bloc.add(
            GetAllLawyersEvent(),
          );
        },
        backgroundColor: const Color(0XFF472A0C),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
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
        return LawyerItem(
          lawyer: lawyers[index],
          bloc: bloc,
        );
      },
    );
  }
}
