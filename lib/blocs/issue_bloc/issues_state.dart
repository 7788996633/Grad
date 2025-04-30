part of 'issues_bloc.dart';

@immutable
sealed class IssuesState {}

final class IssuesInitial extends IssuesState {}

final class IssuesSuccess extends IssuesState {
  final String successmsg;

  IssuesSuccess({required this.successmsg});
}

final class IssuesSuccessFully extends IssuesState {
  final IssuesModel issue;

  IssuesSuccessFully({required this.issue});
}

final class IssuesListSuccessFully extends IssuesState {
  final List<IssuesModel> issues;

  IssuesListSuccessFully({required this.issues});
}

final class IssuesLoading extends IssuesState {}

final class IssuesFail extends IssuesState {
  final String errmsg;

  IssuesFail({required this.errmsg});
}
