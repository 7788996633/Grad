import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated/blocs/notification_bloc/notification_bloc.dart';
import 'package:graduated/data/models/notification_model.dart';
import 'package:graduated/presentation/widgets/notification_item.dart';

import '../../blocs/user_bloc/user_bloc.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({super.key});

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  void initState() {
    BlocProvider.of<NotificationBloc>(context).add(
      GetAllNotificationsEvent(),
    );
    super.initState();
  }

  List<NotificationModel> notificationsList = [];
  Widget buildNotificationModel() {
    return ListView.builder(
      itemCount: notificationsList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => NotificationItem(
        notificationModel: notificationsList[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationsListLoaded) {
          notificationsList = state.notificationsList;
          return notificationsList.isEmpty
              ? const Text('There is no notifications')
              : buildNotificationModel();
        } else if (state is NotificationFail) {
          return Column(
            children: [
              const Text(
                "There is an error:",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.errmsg,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
