class NotificationModel {

  NotificationModel( {
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;
  final List<Data> data;
  final bool isRead = false;
  final dynamic readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {

    return NotificationModel(
      id: json["id"],
      type: json["type"],
      notifiableType: json["notifiable_type"],
      notifiableId: json["notifiable_id"],
      data: Data.DataListFromJson(json["data"]),
      readAt: json["read_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  notificationsFromJson(json) {}
}

class Data {
  Data({
    required this.title,
    required this.body,
    required this.url,
  });

  final String title;
  final String body;
  final String url;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json["title"],
      body: json["body"],
      url: json["url"],
    );
  }
  static  List<Data> DataListFromJson(Map<String, dynamic> json) {
    var data = json['data'] as List;
    return data.map((item) => Data.fromJson(item)).toList();
  }
}
