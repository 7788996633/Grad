import 'package:graduation/data/models/issues_model.dart';

class ClientSessionModel {
  ClientSessionModel({
    required this.issue,
    required this.sessions,
  });

  final IssuesModel issue;

  final List<Session> sessions;

  factory ClientSessionModel.fromJson(Map<String, dynamic> json) {
    return ClientSessionModel(
      issue: IssuesModel.fromJson(json),
      sessions: json["sessions"] == null
          ? []
          : List<Session>.from(
              json["sessions"]!.map((x) => Session.fromJson(x))),
    );
  }
}

class Session {
  Session({
    required this.id,
    required this.type,
    required this.outcome,
    required this.isAttend,
    required this.issueId,
    required this.lawyerId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String type;
  final String outcome;
  final int isAttend;
  final int issueId;
  final int lawyerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json["id"],
      type: json["type"],
      outcome: json["outcome"],
      isAttend: json["is_attend"],
      issueId: json["issue_id"],
      lawyerId: json["lawyer_id"],
      createdAt: DateTime.tryParse(json["created_at"]),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

enum Sessiontype { follow_down, follow_up }

String typeToString(Sessiontype p) {
  return p.name[0].toUpperCase() + p.name.substring(1);
}

Sessiontype stringToPriority(String s) {
  return Sessiontype.values.firstWhere(
    (e) => e.name.toLowerCase() == s.toLowerCase(),
    orElse: () => Sessiontype.follow_up,
  );
}
