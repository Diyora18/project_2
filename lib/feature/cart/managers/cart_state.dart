

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/cart_model.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {

  const factory CartState({
    String? errorMessage,
    required bool isLoading,
    required CartModel cart,
    required List<CartModel> items,

  })=_CartState;

}

