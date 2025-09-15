class ResetModel {
  final String email;
  final String code;
  final String password;

  ResetModel({
    required this.email,
    required this.code,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code, "password": password};
  }

  @override
  String toString() {
    return 'Reset{email:$email,"code": code, password: $password}';
  }
}
