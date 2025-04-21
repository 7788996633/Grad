import 'package:bloc/bloc.dart';
import 'package:graduation/data/models/notification_model.dart';
import 'package:graduation/data/repositories/notifications_repositories.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetAllNotificationsEvent) {
        emit(
          NotificationLoading(),
        );
        try {
          List<NotificationModel> value =
              await NotificationsRepositories().getAllNotifications();
          emit(
            NotificationsListLoaded(
              notificationsList: value,
            ),
          );
        } catch (e) {
          emit(
            NotificationFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    });
  }
}
