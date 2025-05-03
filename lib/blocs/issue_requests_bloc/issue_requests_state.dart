

import 'package:meta/meta.dart';

import '../../data/models/hiring_request_model.dart';
import '../../data/models/issue_request_model.dart';

@immutable
sealed class IssueRequestsState {}

final class IssueRequestsInitial extends IssueRequestsState {}

final class IssueRequestsLoading extends IssueRequestsState {}

final class IssueRequestsSuccess extends IssueRequestsState {
  final String successmsg;

  IssueRequestsSuccess({required this.successmsg});
}

final class IssueRequestsLoadedSuccessfully extends IssueRequestsState {
  final HiringRequestModel hiringRequestModel;

  IssueRequestsLoadedSuccessfully({required this.hiringRequestModel});
}

final class IssueRequestsFail extends IssueRequestsState {
  final String errmsg;

  IssueRequestsFail({required this.errmsg});
}


final class IssueRequestsListLoaded extends IssueRequestsState {
  late final List<IssueRequestModel> issueRequestsList;

  IssueRequestsListLoaded({required this.issueRequestsList});
}

final class IssueRequestsByIdLoaded extends IssueRequestsState {
  final IssueRequestModel issueRequestModel;

  IssueRequestsByIdLoaded({required this.issueRequestModel, });
}