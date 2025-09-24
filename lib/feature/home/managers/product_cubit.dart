import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/repositories/product_repository.dart';
import 'package:project_2/feature/home/managers/category_state.dart';
import 'package:project_2/feature/home/managers/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductState());

  Future<void> fetchProducts(int categoryId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, categoryId: categoryId));
    final result = await _productRepository.getProducts(categoryId);

    result.fold(
          (e) => emit(state.copyWith(errorMessage: e.toString(),isLoading: false, )),
          (data) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          products: data,
          categoryId: categoryId,
        ),
      ),
    );
  }
  Future<void> fetchAllProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: null, categoryId: null));

    final result = await _productRepository.getAllProducts();

    result.fold(
          (e) => emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoading: false,
        ),
      ),
          (data) {
        emit(
          state.copyWith(
            isLoading: false,
            products: data,
            errorMessage: null,
            categoryId: 0,
          ),
        );
      },
    );
  }

  Future<void> saveProduct(int productId) async {
    final result = await _productRepository.saveProducts(productId);

    result.fold(
          (e) => emit(state.copyWith(errorMessage: e.toString())),
          (_) {
        final updatedProducts = state.products.map((p) {
          if (p.id == productId) {
            return p.copyWith(isLiked: true);
          }
          return p;
        }).toList();

        emit(state.copyWith(products: updatedProducts, errorMessage: null));
      },
    );
  }

  Future<void> unsaveProduct(int productId) async {
    final result = await _productRepository.unSaveProduct(productId);

    result.fold(
          (e) => emit(state.copyWith(errorMessage: e.toString())),
          (_) {
        final updatedProducts = state.products.map((p) {
          if (p.id == productId) {
            return p.copyWith(isLiked: false);
          }
          return p;
        }).toList();

        emit(state.copyWith(products: updatedProducts, errorMessage: null));
      },
    );
  }
}



