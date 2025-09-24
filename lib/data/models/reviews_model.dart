class ReviewModel {
  final int id, rating;
  final String comment, created, userFullName;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.created,
    required this.userFullName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      rating: json["rating"],
      comment: json["comment"],
      created: json["created"],
      userFullName: json["userFullName"],
    );
  }
}
