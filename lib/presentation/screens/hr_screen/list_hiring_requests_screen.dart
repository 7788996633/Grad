import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/hiring_requests/hiring_requests_block.dart';
import '../../../blocs/hiring_requests/hiring_requests_event.dart';
import '../../../blocs/hiring_requests/hiring_requests_state.dart';
import '../../../constant.dart';
import '../../../data/models/hiring_request_model.dart';
import '../../widgets/appbar/custom_appbar_add.dart';
import '../../widgets/button/refresh_button.dart';
import '../../widgets/info_row.dart';
import '../../widgets/list/hiring_request_list.dart';
import 'add_hiring_request_screen.dart';

class ListHiringRequestsScreen extends StatefulWidget {
  const ListHiringRequestsScreen({super.key});

  @override
  State<ListHiringRequestsScreen> createState() =>
      _ListHiringRequestsScreenState();
}

class _ListHiringRequestsScreenState extends State<ListHiringRequestsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late HiringRequestsBloc bloc;
  List<HiringRequestModel> _allRequests = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HiringRequestsBloc>(context);
    bloc.add(GetAllHiringRequests());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F6),
      appBar: CustomActionAppBar(
        title: 'Hiring Requests',
        actionIcon: Icons.add_circle_rounded,
        tooltip: 'Add New hiring Request',
        onActionPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => HiringRequestsBloc(),
                child: const AddHiringRequestScreen(),
              ),
            ),
          );
        },
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<HiringRequestsBloc, HiringRequestsState>(
                builder: (context, state) {
                  if (state is HiringRequestsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HiringRequestsListLoaded) {
                    return HiringRequestLisWidget(requests: state.hiringRequestsList, );
                  } else if (state is HiringRequestsIdLoaded) {
                    return HiringRequestLisWidget( requests:[state.hiringRequestModel],);
                  } else if (state is HiringRequestsFail) {
                    return Center(
                      child: Text(
                        'Error: ${state.errmsg}',
                        style: const TextStyle(color: AppColors.danger),
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
        floatingActionButton: RefreshButton(
            onPressed: () {
              bloc.add(GetAllHiringRequests());
            },
        ),
    );
  }
}


