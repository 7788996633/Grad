class Profile {
  int? id;
  String? address;
  String? phone;
  String? scientificLevel;
  int? age;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.address,
        this.phone,
        this.scientificLevel,
        this.age,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    phone = json['phone'];
    scientificLevel = json['scientificLevel'];
    age = json['age'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['scientificLevel'] = this.scientificLevel;
    data['age'] = this.age;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}