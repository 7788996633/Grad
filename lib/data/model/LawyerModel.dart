class LawyerModel {
  final String licenseNumber;
  final String experienceYears;
  final String specialization;
  final String salary;
  final String type;
  final String filePath;
  final int userId;

  LawyerModel({
    required this.licenseNumber,
    required this.experienceYears,
    required this.specialization,
    required this.salary,
    required this.type,
    required this.filePath,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'license_number': licenseNumber,
      'experience_years': experienceYears,
      'specialization': specialization,
      'salary': salary,
      'type': type,
      'user_id': userId,
      // يمكن استثناء 'filePath' من الـ JSON إذا كان يتم إرساله كـ MultipartFile
    };
  }
}
