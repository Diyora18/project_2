class ProductModel {
  final int id;
  final int categoryId;
  final String image;
  final String title;
  final num price;
  final bool isLiked;
  final num discount;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.title,
    required this.price,
    required this.isLiked,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] is String ? int.parse(json["id"]) : json["id"],
      categoryId: json["categoryId"] is String
          ? int.parse(json["categoryId"])
          : json["categoryId"],
      image: json["image"] ?? "",
      title: json["title"] ?? "",
      price: json["price"] ?? 0,
      isLiked: json["isLiked"] ?? false,
      discount: json["discount"] ?? 0,
    );
  }

  ProductModel copyWith({
    int? id,
    int? categoryId,
    String? image,
    String? title,
    num? price,
    bool? isLiked,
    num? discount,
  }) {
    return ProductModel(id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        image: image ?? this.image,
        title: title ?? this.title,
        price: price ?? this.price,
        isLiked: isLiked ?? this.isLiked,
        discount: discount ?? this.discount);
  }
}
