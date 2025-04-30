import 'package:meta/meta.dart';

@immutable
sealed class LawyerEvent {}

class GetAllLawyer extends LawyerEvent {}

class DeleteLawyerById extends LawyerEvent {
  final int lawyerId;

  DeleteLawyerById({required this.lawyerId});
}

class GetLawyerById extends LawyerEvent {
  final int lawyerId;

  GetLawyerById({required this.lawyerId});
}
