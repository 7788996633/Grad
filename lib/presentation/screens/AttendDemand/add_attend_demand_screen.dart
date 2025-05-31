import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/attend_Demand_bloc/attend_demand_bloc.dart';

class AttendDemandScreen extends StatefulWidget {
  const AttendDemandScreen({super.key});

  @override
  State<AttendDemandScreen> createState() => _AttendDemandScreenState();
}

class _AttendDemandScreenState extends State<AttendDemandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات'),
      ),
      body: BlocProvider(
        create: (context) => AttendDemandBloc()
          ..add(
            GetAllDemandByIssueEvent(issueId: 1),
          ), // تغيير ID حسب الحاجة
        child: BlocBuilder<AttendDemandBloc, AttendDemandState>(
          builder: (context, state) {
            if (state is DemandLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DemandListLoadedSuccessfully) {
              return ListView.builder(
                itemCount: state.listdemand.length,
                itemBuilder: (context, index) {
                  final demand = state.listdemand[index];
                  return ListTile(
                    leading: const Icon(Icons.event),
                    title: Text("الطلب رقم ${demand.id}"),
                    subtitle: Text("التاريخ: ${demand.date}"),
                  );
                },
              );
            } else if (state is DemandFail) {
              return Center(child: Text('فشل: ${state.errmsg}'));
            } else {
              return const Center(child: Text('لا توجد بيانات'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final now = DateTime.now();
          final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
          context
              .read<AttendDemandBloc>()
              .add(AddDemandEvent(idIssue: 1, date: formattedDate));
        },
        tooltip: 'إضافة طلب',
        child: const Icon(Icons.add),
      ),
    );
  }
}
