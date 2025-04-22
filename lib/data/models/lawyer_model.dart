
class LawyerModel {
  final int id;
  final String licenseNumber;
  final int experienceYears;
  final String salary;
  final String certificate;
  final String type;
  final String specialization;
  final int userId;
  final String createdAt;

  LawyerModel({
    required this.id,
    required this.licenseNumber,
    required this.experienceYears,
    required this.salary,
    required this.certificate,
    required this.type,
    required this.specialization,
    required this.userId,
    required this.createdAt,
  });

  factory LawyerModel.fromJson(Map<String, dynamic> json) {
    return LawyerModel(
      id: json['id'],
      licenseNumber: json['license_number'],
      experienceYears: json['experience_years'],
      salary: json['salary'].toString(),
      certificate: json['certificate'],
      type: json['type'],
      specialization: json['specialization'],
      userId: json['user_id'],
      createdAt: json['created_at'],
    );
  }
}
