import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/attend_Demand_bloc/attend_demand_bloc.dart';
import '../../widgets/attend_demand_list.dart';

class AllAttendDemandScreen extends StatelessWidget {
  const AllAttendDemandScreen({super.key, required this.issueId});
  final int issueId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => AttendDemandBloc(),
            child: AttendDemandList(
              issueId: issueId,
            ),
          ),
        ],
      ),
    );
  }
}
