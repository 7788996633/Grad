// blocs/lawyer/lawyer_state.dart
import '../../data/models/lawyer_model.dart';

abstract class LawyerState {}

class LawyerInitial extends LawyerState {}

class LawyerLoading extends LawyerState {}

class LawyersLoaded extends LawyerState {
  final List<Lawyer> lawyers;
  LawyersLoaded(this.lawyers);
}

class LawyerLoaded extends LawyerState {
  final Lawyer lawyer;
  LawyerLoaded(this.lawyer);
}

class LawyerError extends LawyerState {
  final String message;
  LawyerError(this.message);
}
class LawyerUpdated extends LawyerState {
  final Lawyer lawyer;

  LawyerUpdated(this.lawyer);
}

