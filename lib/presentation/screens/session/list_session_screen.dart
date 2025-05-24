/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/sessions/sessions_bloc.dart';
import '../../../blocs/sessions/sessions_event.dart';
import '../../../blocs/sessions/sessions_state.dart';
import '../../../constant.dart';

import '../../widgets/auth_widgets/issue_request_list_widget.dart';
import '../../widgets/custom_appbar_add.dart';
import '../../widgets/refresh_button.dart';
import 'create_session.dart';


class ListSessionsScreen extends StatefulWidget {
  const ListSessionsScreen({super.key});

  @override
  State<ListSessionsScreen> createState() =>
      _ListSessionsScreenState();
}

class _ListSessionsScreenState extends State<ListSessionsScreen> {
  late SessionsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SessionsBloc>(context);
    bloc.add(GetAllSessionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: CustomActionAppBar(
        title: 'List Sessions',
        actionIcon: Icons.add_circle_rounded,
        tooltip: 'Add New Sessions',
        onActionPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => SessionsBloc(),
                child: const CreateSessionScreen(),
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
              child: BlocBuilder<SessionsBloc, SessionsState>(
                builder: (context, state) {
                  if (state is SessionsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SessionsListLoaded) {
                    return RequestListWidget(requests: state.sessionsList);
                  } else if (state is SessionLoadedSuccessfully) {
                    return RequestListWidget(
                     requests: [state.Sessions],
                    );
                  } else if (state is SessionsFail) {
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
          bloc.add(
            GetAllSessionsEvent(),
          );
        },
      ),
    );
  }
}
*/