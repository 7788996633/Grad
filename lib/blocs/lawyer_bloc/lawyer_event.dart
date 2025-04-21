part of 'lawyer_bloc.dart';

@immutable
sealed class LawyerEvent {}

class CreateLawyerProfile extends LawyerEvent {
  final String licenseNumber;
  final String experienceYears;
  final String specialization;
  final String salary;
  final String type;
  final String filePath;

  CreateLawyerProfile(
      {required this.licenseNumber,
      required this.experienceYears,
      required this.specialization,
      required this.salary,
      required this.type,
      required this.filePath});
}
