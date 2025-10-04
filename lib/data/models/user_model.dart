class UserModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final DateTime? birthDate;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      gender: json["gender"],
      birthDate: json["birthDate"] != null
          ? DateTime.parse(json["birthDate"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (id != null) data["id"] = id;
    if (fullName != null) data["fullName"] = fullName;
    if (email != null) data["email"] = email;
    if (phoneNumber != null) data["phoneNumber"] = phoneNumber;
    if (gender != null) data["gender"] = gender;
    if (birthDate != null) data["birthDate"] = birthDate!.toIso8601String();

    return data;
  }
}
