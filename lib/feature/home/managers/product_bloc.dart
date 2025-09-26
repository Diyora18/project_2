import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project_2/feature/home/managers/product_event.dart';
import 'package:project_2/feature/home/managers/product_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepo;
  List<ProductModel> _allProducts = [];

  ProductBloc({required ProductRepository productRepo})
      : _productRepo = productRepo,
        super(const ProductState()) {
    on<FetchAllProducts>(_onFetchAllProducts);
    on<FetchByCategory>(_onFetchByCategory);
    on<SearchProducts>(
      _onSearchProducts,
      transformer: _debounce(const Duration(seconds: 1)),
    );
    on<SaveProduct>(_onSaveProduct);
    on<UnsaveProduct>(_onUnSaveProduct);
  }

  EventTransformer<E> _debounce<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }

  Future<void> _onFetchAllProducts(
      FetchAllProducts event,
      Emitter<ProductState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _productRepo.getAllProducts();

    result.fold(
          (err) =>
          emit(state.copyWith(isLoading: false, errorMessage: err.toString())),
          (products) {
        _allProducts = products;
        emit(state.copyWith(isLoading: false, products: products));
      },
    );
  }

  Future<void> _onFetchByCategory(
      FetchByCategory event,
      Emitter<ProductState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _productRepo.getProducts(event.categoryId);

    result.fold(
          (err) =>
          emit(state.copyWith(isLoading: false, errorMessage: err.toString())),
          (products) {
        _allProducts = products;
        emit(
          state.copyWith(
            isLoading: false,
            products: products,
            categoryId: event.categoryId,
          ),
        );
      },
    );
  }

  Future<void> _onSearchProducts(
      SearchProducts event,
      Emitter<ProductState> emit,
      ) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(products: _allProducts));
      return;
    }

    final filtered = _allProducts.where((p) {
      return p.title.toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(state.copyWith(products: filtered));
  }

  Future<void> _onSaveProduct(
      SaveProduct event,
      Emitter<ProductState> emit,
      ) async {
    final result = await _productRepo.saveProducts(event.productId);

    result.fold(
          (e) => emit(state.copyWith(errorMessage: e.toString())),
          (_) {
        final updated = state.products.map((p) {
          if (p.id == event.productId) {
            return p.copyWith(isLiked: true);
          }
          return p;
        }).toList();
        emit(state.copyWith(products: updated, errorMessage: null));
      },
    );
  }

  Future<void> _onUnSaveProduct(
      UnsaveProduct event,
      Emitter<ProductState> emit,
      ) async {
    final result = await _productRepo.unSaveProduct(event.productId);

    result.fold(
          (e) => emit(state.copyWith(errorMessage: e.toString())),
          (_) {
        final updated = state.products.map((p) {
          if (p.id == event.productId) {
            return p.copyWith(isLiked: false);
          }
          return p;
        }).toList();
        emit(state.copyWith(products: updated, errorMessage: null));
      },
    );
  }

}
