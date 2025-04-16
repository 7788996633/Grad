abstract class AddLawyerEvent {}

class SubmitLawyerData extends AddLawyerEvent {
  final String licenseNumber;
  final String experienceYears;
  final String specialization;
  final String salary;
  final String type;
  final String filePath;

  SubmitLawyerData({
    required this.licenseNumber,
    required this.experienceYears,
    required this.specialization,
    required this.salary,
    required this.type,
    required this.filePath,
  });
}
