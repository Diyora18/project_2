class CartModel {
  final List<CartItem> items;
  final num subTotal;
  final num vat;
  final num shippingFee;
  final num total;

  CartModel({
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      subTotal: json['subTotal'],
      vat: json['vat'],
      shippingFee: json['shippingFee'],
      total: json['total'],
      items: json['items'],
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
      title: json['title'],
      size: json['size'],
      price: json['price'] ?? 0,
      image: json['image'],
      quantity: json['quantity'] ?? 0,
    );
  }
}
