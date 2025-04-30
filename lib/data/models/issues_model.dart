class IssuesModel {
  int? id;
  String? title;
  String? issueNumber;
  String? category;
  String? opponentName;
  String? courtName;
  int? numberOfPayments;
  String? totalCost;
  String? amountPaid;
  String? description;
  int? userId;
  String? status;
  String? priority;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  IssuesModel(
      {this.id,
      this.title,
      this.issueNumber,
      this.category,
      this.opponentName,
      this.courtName,
      this.numberOfPayments,
      this.totalCost,
      this.amountPaid,
      this.description,
      this.userId,
      this.status,
      this.priority,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  IssuesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    issueNumber = json['issue_number'];
    category = json['category'];
    opponentName = json['opponent_name'];
    courtName = json['court_name'];
    numberOfPayments = json['number_of_payments'];
    totalCost = json['total_cost'];
    amountPaid = json['amount_paid'];
    description = json['description'];
    userId = json['user_id'];
    status = json['status'];
    priority = json['priority'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
