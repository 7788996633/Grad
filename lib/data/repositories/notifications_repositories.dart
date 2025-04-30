
import '../models/notification_model.dart';
import '../services/notifications_services.dart';

class NotificationsRepositories {
  Future<List<NotificationModel>> getAllNotifications() async {
    var notificationsList = await NotificationsServices().getAllNotifications();
    return notificationsList
        .map(
          (e) => NotificationModel.fromJson(e),
        )
        .toList();
  }
}
