class EmailModel {
  final String email;

  EmailModel({
    required this.email,

  });

  Map<String, dynamic> toJson() {
    return {"email": email, };
  }

  @override
  String toString() {
    return 'EmailModel{email:$email,}';
  }
}
