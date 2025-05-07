import 'package:meta/meta.dart';

@immutable
sealed class LawyerEvent {}

class GetAllLawyersEvent extends LawyerEvent {}

class DeleteLawyerByIdEvent extends LawyerEvent {
  final int lawyerId;

  DeleteLawyerByIdEvent({required this.lawyerId});
}

class GetLawyerByIdEvent extends LawyerEvent {
  final int lawyerId;

  GetLawyerByIdEvent({required this.lawyerId});
}
