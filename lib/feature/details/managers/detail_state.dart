import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/detail_model.dart';
import '../../../data/models/reviews_model.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    String? errorMessage,
    String? errorReviews,
    required bool loading,
    required bool revLoading,
    required DetailModel detail,
    required List<ReviewModel> reviews,
    ProductSizes? selectedSize,
    bool? cartSuccess,
  }) = _DetailState;

  factory DetailState.initial() => DetailState(
    errorMessage: null,
    errorReviews: null,
    loading: false,
    revLoading: false,
    detail: DetailModel(
      id: 0,
      title: '',
      description: '',
      price: 0,
      isLiked: false,
      images: [],
      sizes: [],
      reviewsCount: 0,
      rating: 0.0,
    ),
    reviews: [],
    selectedSize: null,
    cartSuccess: null,
  );

}
