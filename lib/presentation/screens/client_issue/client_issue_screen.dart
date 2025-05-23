import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/models/issues_model.dart';
import 'package:graduation/blocs/show%20client%20issue_bloc/show_client_issue_bloc.dart';


class ClientIssuesScreen extends StatelessWidget {
  const ClientIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowClientIssueBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('قضايا العميل')),
        body: BlocBuilder<ShowClientIssueBloc, ShowClientIssueState>(
          builder: (context, state) {
            if (state is ShowClientIssuesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShowClientIssuesListLoadedSuccessFully) {
              if (state.issues.isEmpty) {
                return const Center(child: Text('لا توجد قضايا.'));
              }

              return ListView.builder(
                itemCount: state.issues.length,
                itemBuilder: (context, index) {
                  final issue = state.issues[index];
                  return ListTile(
                    title: Text(issue.title),
                    subtitle: Text(
                        'الحالة: ${statusToString(stringToStatus(issue.status))}\nآخر تحديث: ${issue.updatedAt}'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text('عرض التفاصيل'),
                    ),
                  );
                },
              );
            } else if (state is ShowClientIssuesFail) {
              return Center(child: Text(state.errmsg));
            } else {
              return const Center(child: Text('اضغط للتحميل'));
            }
          },
        ),
      ),
    );
  }
}
