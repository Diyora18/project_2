class VerifyModel {
  final String email;
  final String code;


  VerifyModel({
    required this.email,
    required this.code,

  });

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code,};
  }

  @override
  String toString() {
    return 'SignUpModel{email:$email,"code": code,}';
  }
}
