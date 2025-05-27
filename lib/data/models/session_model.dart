class SessionModel {
  SessionModel({
    required this.id,
    required this.type,
    required this.outcome,
    required this.lawyerId,
    required this.issueId,
    this.createdAt,
  });

  final int id;
  final String type;
  final String outcome;
  final int lawyerId;
  final int issueId;
  final DateTime? createdAt;

  factory SessionModel.fromJson(json) {
    return SessionModel(
      id: json['id'],
      type: json['type'],
      outcome: json['outcome'],
      lawyerId: json['lawyer_id'] ?? 0,
      issueId: json['issue_id'],
      createdAt: DateTime.tryParse(
        json['created_at'],
      ),
    );
  }
}

enum AttendStatus { attend, absent }
