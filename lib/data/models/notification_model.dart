class NotificationModel {
  final String id;
  final String type;
  final String title;
  final String message;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      title: json['data']['title'],
      message: json['data']['message'],
      isRead: json['read_at'] != null,
    );
  }
}
