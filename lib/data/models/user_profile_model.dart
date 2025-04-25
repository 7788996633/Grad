
class UserProfileModel {
  final int id;
  final String address;
  final String phone;
  final String? scientificLevel;
  final int age;
  // final int userId;
  // final String? image;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      address: json['address'],
      phone: json['phone'],
      scientificLevel: json['scientificLevel'],
      age: json['age'],
      // userId: json['user_id'],
      // image: json['image'],
    );
  }

  UserProfileModel({
    required this.id,
    required this.address,
    required this.phone,
    required this.scientificLevel,
    required this.age,
    // required this.userId,
    // required this.image,
  });
}
