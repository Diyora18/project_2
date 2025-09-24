import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<ProductModel> products;
  final String? errorMessage;
  final int? categoryId;

  const ProductState({
    this.categoryId,
    this.isLoading = false,
    this.products = const [],
    this.errorMessage,
  });

  ProductState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
    String? errorMessage,
    int? categoryId,
  }) {
    return ProductState(
      categoryId: categoryId ?? this.categoryId,
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage?? this.errorMessage,
    );
  }


  @override
  List<Object?> get props => [categoryId, isLoading, products, errorMessage];
}
