import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/session_appointment_bloc/session_appointment_bloc.dart';
import 'package:graduation/data/models/session_model.dart';
import 'package:graduation/presentation/screens/appiontment_session_screen/appointment_session_list_screen.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key, required this.sessionModel});
  final SessionModel sessionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              sessionModel.type,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SessionAppointmentBloc(),
                    child: AppointmentSessionListScreen(
                      sessionId: sessionModel.id,
                    ),
                  ),
                ),
              );
            },
            child: Text("Appointments"),
          ),
        ],
      ),
    );
  }
}
