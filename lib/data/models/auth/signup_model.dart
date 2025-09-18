class SignUpModel {
  final String fullName;
  final String email;
  final String password;

  SignUpModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {"fullName": fullName, "email": email, "password": password};
  }

  @override
  String toString() {
    return 'SignUpModel{fullName: $fullName,email:$email, password: $password}';
  }
}
