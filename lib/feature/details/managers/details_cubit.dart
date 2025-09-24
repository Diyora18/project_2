import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/detail_repository.dart';
import '../../../data/repositories/review_repository.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final DetailRepository _productRepo;
  final ReviewRepository _reviewRepository;

  DetailCubit({
    required DetailRepository productRepo,
    required ReviewRepository reviewRepository,
  }) : _productRepo = productRepo,
        _reviewRepository = reviewRepository,
        super(DetailState.initial());

  Future<void> fetchProductDetail(int productId) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _productRepo.getDetails(productId);

    result.fold(
          (err) => emit(
        state.copyWith(
          loading: false,
          errorMessage: err.toString(),
        ),
      ),
          (product) => emit(
        state.copyWith(
          loading: false,
          detail: product,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> fetchReviews(int productId) async {
    emit(state.copyWith(revLoading: true, errorReviews: null));

    final result = await _reviewRepository.getReviews(id: productId);

    result.fold(
          (err) => emit(
        state.copyWith(
          revLoading: false,
          errorReviews: err.toString(),
        ),
      ),
          (reviews) => emit(
        state.copyWith(
          revLoading: false,
          reviews: reviews,
          errorReviews: null,
        ),
      ),
    );
  }
}
