import 'package:flutter/foundation.dart';

@immutable
abstract class AddLawyerState {}

class AddLawyerInitial extends AddLawyerState {}

class AddLawyerLoading extends AddLawyerState {}

class AddLawyerSuccess extends AddLawyerState {
  final String token;

  AddLawyerSuccess({required this.token});
}

class AddLawyerFailure extends AddLawyerState {
  final String error;

  AddLawyerFailure({required this.error});
}
