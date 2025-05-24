

import 'package:meta/meta.dart';

import '../../data/models/sessions.dart';

@immutable
sealed class SessionsState {}

final class SessionsInitial extends SessionsState {}

final class SessionsSuccess extends SessionsState {
  final String successmsg;

  SessionsSuccess({required this.successmsg});
}


final class SessionsLoading extends SessionsState {}

final class SessionsFail extends SessionsState {
  final String errmsg;

  SessionsFail({required this.errmsg});
}

final class SessionsListLoaded extends SessionsState {
  final List<Sessions> sessionsList;
  SessionsListLoaded({required this.sessionsList});
}


final class SessionLoadedSuccessfully extends SessionsState {
  final Sessions session;
  SessionLoadedSuccessfully({required this.session});
}