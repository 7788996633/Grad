part of 'lawyer_profiel_bloc.dart';

@immutable
sealed class LawyerProfileEvent {}

class CreateLawyerProfileEvent extends LawyerProfileEvent {
  final String licenseNumber;
  final String experienceYears;
  final String specialization;
  final String certificatePath;

  CreateLawyerProfileEvent(
      {required this.licenseNumber,
      required this.experienceYears,
      required this.specialization,
      required this.certificatePath});
}

class ShowLawyerProfileEvent extends LawyerProfileEvent {}

class UpdateLawyerProfileEvent extends LawyerProfileEvent {
  final String licenseNumber;
  final String experienceYears;
  final String specialization;
  final String certificatePath;

  UpdateLawyerProfileEvent(
      {required this.licenseNumber,
      required this.experienceYears,
      required this.specialization,
      required this.certificatePath});
}

class DeleteLawyerProfileEvent extends LawyerProfileEvent {
  DeleteLawyerProfileEvent();
}