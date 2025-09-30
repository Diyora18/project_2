import '../../core/utils/size_mapper.dart';

class CartModel {
  final List<CartItem> items;
  final int subTotal;
  final int vat;
  final int shippingFee;
  final int total;

  CartModel({
    required this.items,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      subTotal: json['subTotal'] ,
      vat: json['vat'] ,
      shippingFee: json['shippingFee'] ,
      total: json['total'] ,
    );
  }
}


class CartItem {
  final int id;
  final int productId;
  final String title;
  final String size;
  final num price;
  final String image;
  final num quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      title: json['title'] ?? "",
      size: json['size'] ?? "",
      price: json['price'] ?? 0,
      image: json['image'],
      quantity: json['quantity'] ?? 0,
    );
  }

  int get sizeId => getSizeId(size);
}
