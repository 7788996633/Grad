part of 'show_client_issue_bloc.dart';

@immutable
sealed class ShowClientIssueState {}

final class ShowClientIssueInitial extends ShowClientIssueState {}

final class ShowClientIssuesListLoadedSuccessFully
    extends ShowClientIssueState {
  final List<IssuesModel> issues;

  ShowClientIssuesListLoadedSuccessFully({required this.issues});
}

final class ShowClientIssuesLoading extends ShowClientIssueState {}

final class ShowClientIssuesFail extends ShowClientIssueState {
  final String errmsg;

  ShowClientIssuesFail({required this.errmsg});
}
