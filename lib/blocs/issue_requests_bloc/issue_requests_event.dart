

import 'package:meta/meta.dart';

@immutable
sealed class IssueRequestsEvent {}

class CreateIssueRequestsEvent extends IssueRequestsEvent {
  final String title;
  final String description;


  CreateIssueRequestsEvent({required this.title, required this.description,});
}

class ShowIssueRequestsEvent extends IssueRequestsEvent {}

class GetAllIssueRequests extends IssueRequestsEvent {}


class GetIssueRequestsById extends IssueRequestsEvent {
  final int issueRequestsId;

  GetIssueRequestsById({required this.issueRequestsId});
}

class DeleteIssueRequestByIdEvent extends IssueRequestsEvent{
  final int issueRequestId;

  DeleteIssueRequestByIdEvent({required this.issueRequestId});
}


class UpdateIssueRequestEvent extends IssueRequestsEvent {
  final int issueRequestId;
  final String title;
  final String description;

  UpdateIssueRequestEvent(
      {required this.issueRequestId,
        required this.title,
        required this.description,
        });
}