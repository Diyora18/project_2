import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository;

  CartBloc({required CartRepository repository})
      : _repository = repository,
        super(CartState.initial()) {
    on<LoadingCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  Future<void> _onLoadCart(
      LoadingCart event,
      Emitter<CartState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _repository.getCartList();

    result.fold(
          (error) => emit(state.copyWith(
        errorMessage: error.toString(),
        isLoading: false,
      )),
          (cart) => emit(state.copyWith(
        cart: cart,
        isLoading: false,
      )),
    );
  }

  Future<void> _onAddToCart(
      AddToCart event,
      Emitter<CartState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _repository.addToCart(
      productId: event.productId,
      sizeId: event.sizeId,
    );

    await result.fold(
          (error) async {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
        ));
      },
          (_) async {
        final updatedList = await _repository.getCartList();
        updatedList.fold(
              (error) => emit(state.copyWith(
            errorMessage: error.toString(),
            isLoading: false,
          )),
              (cart) => emit(state.copyWith(
            cart: cart,
            isLoading: false,
          )),
        );
      },
    );
  }

  Future<void> _onRemoveFromCart(
      RemoveFromCart event,
      Emitter<CartState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _repository.removeFromCart(id: event.id);

    await result.fold(
          (error) async {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
        ));
      },
          (_) async {
        final updatedList = await _repository.getCartList();
        updatedList.fold(
              (error) => emit(state.copyWith(
            errorMessage: error.toString(),
            isLoading: false,
          )),
              (cart) => emit(state.copyWith(
            cart: cart,
            isLoading: false,
          )),
        );
      },
    );
  }
}
