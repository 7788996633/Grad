part of 'show_client_sessions_bloc.dart';

@immutable
sealed class ShowClientSessionsState {}

final class ShowClientSessionsInitial extends ShowClientSessionsState {}

final class ShowClientIssuesListLoadedSuccessFully
    extends ShowClientSessionsState {
  final List<ClientSessionModel> clientsession;

  ShowClientIssuesListLoadedSuccessFully({required this.clientsession});
}

final class ShowClientIssuesLoading extends ShowClientSessionsState {}

final class ShowClientIssuesFail extends ShowClientSessionsState {
  final String errmsg;

  ShowClientIssuesFail({required this.errmsg});
}
