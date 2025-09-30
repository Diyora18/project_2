import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/cart_model.dart';
part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    String? errorMessage,
    required bool isLoading,
    CartModel? cart,
  }) = _CartState;

  factory CartState.initial() => CartState(
    errorMessage: null,
    isLoading: false,
    cart: CartModel(
      items: [],
      subTotal: 0,
      vat: 0,
      shippingFee: 0,
      total: 0,
    ),
  );

}
