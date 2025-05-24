import 'issues_model.dart';
import 'lawyer_model.dart';

class Sessions {
  Sessions({
    required this.id,
    required this.title,
    required this.type,
    required  this.outcome,
    required this.lawyerId,
    required this.issueId,
    this.createdAt,
    this.updatedAt,
    this.lawyer,
    this.issue,
  });

  final int id;
  final String type;
  final String title;
  final String? outcome;
  final int lawyerId;
  final int issueId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final LawyerModel? lawyer;
  final IssuesModel? issue;

  factory Sessions.fromJson(Map<String, dynamic> json) {
    return Sessions(
      id: json["id"],
      type: json["type"],
      title:json["title"],
      outcome: json["outcome"],
      lawyerId: json["lawyer_id"] ?? json["lawyerId"] ?? 0,
      issueId: json["issue_id"] ?? json["issueId"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      lawyer: json["lawyer"] != null
          ? LawyerModel.fromJson(json["lawyer"])
          : null,
      issue: json["issue"] != null
          ? IssuesModel.fromJson(json["issue"])
          : null,
    );
  }
}
enum AttendStatus { attend, absent }
