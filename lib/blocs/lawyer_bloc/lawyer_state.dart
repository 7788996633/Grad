part of 'lawyer_bloc.dart';

@immutable
sealed class LawyerState {}

final class LawyerInitial extends LawyerState {}

final class LawyerSuccess extends LawyerState {
  final String successmsg;

  LawyerSuccess({required this.successmsg});
}

final class LawyerFail extends LawyerState {
  final String errmsg;

  LawyerFail({required this.errmsg});
}

final class LawyerLoading extends LawyerState {}
