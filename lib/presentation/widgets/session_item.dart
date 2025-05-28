import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/sessions/sessions_bloc.dart';
import 'package:graduation/blocs/sessions/sessions_event.dart';
import 'package:graduation/data/models/session_model.dart';
import 'package:graduation/presentation/screens/session/session_details_screen.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({super.key, required this.sessionModel});
  final SessionModel sessionModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  SessionDetailsScreen(sessionModel: sessionModel),
            ),
          );
        },
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<SessionsBloc>(context).add(
              DeleteSessionEvent(
                sessionId: sessionModel.id,
              ),
            );
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        title: Text(
          "${sessionModel.id}",
        ),
        subtitle: Text(
          sessionModel.type,
        ),
      ),
    );
  }
}
