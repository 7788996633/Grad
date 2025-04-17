import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated/blocs/notification_bloc/notification_bloc.dart';
import 'package:graduated/presentation/widgets/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider(
                create: (context) => NotificationBloc(),
                child: const NotificationsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
