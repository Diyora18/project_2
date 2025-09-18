import 'package:equatable/equatable.dart';

import '../../../data/models/home/category_model.dart';



class CategoryState extends Equatable {
  final bool isLoading;
  final List<CategoryModel> categories;
  final String? errorMessage;

  const CategoryState({
    this.isLoading = false,
    this.categories = const [],
    this.errorMessage,
  });

  CategoryState copyWith({
    bool? isLoading,
    List<CategoryModel>? categories,
    String? errorMessage,

  }){
    return CategoryState(isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      errorMessage: errorMessage,);
  }

  @override
  List<Object?> get props => [isLoading,categories,errorMessage];
}
