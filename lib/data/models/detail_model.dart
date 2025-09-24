class DetailModel {
  final int id;
  final String title;
  final String description;
  final num price;
  final bool isLiked;
  final num reviewsCount;
  final num rating;
  final List<ProductImages> images;
  final List<ProductSizes> sizes;

  DetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
    required this.reviewsCount,
    required this.rating,
    required this.images,
    required this.sizes,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      title: json['title']??"",
      description: json['description']??"",
      price: json['price']??"",
      isLiked: json['isLiked']??false,
      reviewsCount: json['reviewsCount']??0,
      rating: json['rating']??0,
      images: (json['productImages'] as List<dynamic>?)
          ?.map((e) => ProductImages.fromJson(e))
          .toList() ??
          [],
      sizes: (json['productSizes'] as List<dynamic>?)
          ?.map((e) => ProductSizes.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class ProductImages {
  final int id;
  final String image;

  ProductImages({
    required this.id,
    required this.image,
  });

  factory ProductImages.fromJson(Map<String, dynamic> json) {
    return ProductImages(
      id: json['id'],
      image: json['image'],
    );
  }
}

class ProductSizes {
  final int id;
  final String title;

  ProductSizes({
    required this.id,
    required this.title,
  });

  factory ProductSizes.fromJson(Map<String, dynamic> json) {
    return ProductSizes(
      id: json['id'],
      title: json['title'],
    );
  }
}
