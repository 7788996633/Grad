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
  final String name;
  final String email;
  final String age;
  final String address;
  final String phone;
  final String image;
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
      address: json['address'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      phone: json['phone'],
      image: json['image'],

    );
  }

  LawyerModel(
      {required this.id,
      required this.licenseNumber,
      required this.experienceYears,
      required this.salary,
      required this.certificate,
      required this.type,
      required this.specialization,
      required this.userId,
      required this.createdAt,
      required this.name,
      required this.email,
      required this.age,
      required this.address,
      required this.phone,
      required this.image});
}
