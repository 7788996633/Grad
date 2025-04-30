import 'package:untitled19/data/models/user_profile_model.dart';

class LawyerModel {
  final int id; // non-nullable field
  final String licenseNumber;
  final int experienceYears; // non-nullable field
  final String salary;
  final String certificate;
  final String type;
  final String specialization;
  final int userId; // non-nullable field
  final String createdAt;
  final UserProfileModel userProfile;

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
    required this.userProfile,
  });

  factory LawyerModel.fromJson(Map<String, dynamic> json) {
    return LawyerModel(
      id: json['id'] ?? 0, // default to 0 if null
      licenseNumber: json['license_number'] ?? "", // default to empty string if null
      experienceYears: json['experience_years'] ?? 0, // default to 0 if null
      salary: json['salary']?.toString() ?? "", // default to empty string if null
      certificate: json['certificate'] ?? "", // default to empty string if null
      type: json['type'] ?? "", // default to empty string if null
      specialization: json['specialization'] ?? "", // default to empty string if null
      userId: json['user_id'] ?? 0, // default to 0 if null
      createdAt: json['created_at'] ?? "", // default to empty string if null
      userProfile: json['user_profile'] != null
          ? UserProfileModel.fromJson(json['user_profile'])
          : UserProfileModel(
        name: "",
        email: "",
        address: "",
        phone: "",
        scientificLevel: "",
        age: null,
        image: "",
      ),
    );
  }
}
