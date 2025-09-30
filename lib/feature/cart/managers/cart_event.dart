abstract class CartEvent {}

class LoadingCart extends CartEvent {}

class RemoveFromCart extends CartEvent {
  final int id;

  RemoveFromCart(this.id);
}
class AddToCart extends CartEvent {
  final int productId;
  final int sizeId;

  AddToCart({
    required this.productId,
    required this.sizeId,
  });
}
