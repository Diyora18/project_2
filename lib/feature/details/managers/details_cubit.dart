import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/models/detail_model.dart';
import '../../../data/repositories/cart_repository.dart';
import '../../../data/repositories/detail_repository.dart';
import '../../../data/repositories/review_repository.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final DetailRepository _productRepo;
  final ReviewRepository _reviewRepository;
  final CartRepository _cartRepository;

  DetailCubit({
    required DetailRepository productRepo,
    required ReviewRepository reviewRepository,
    required CartRepository cartRepository,
  })  : _productRepo = productRepo,
        _reviewRepository = reviewRepository,
        _cartRepository = cartRepository,
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

  void selectSize(ProductSizes size) {
    emit(state.copyWith(selectedSize: size));
  }

  Future<void> addToCart() async {
    final selectedSize = state.selectedSize;
    if (selectedSize == null) {
      emit(state.copyWith(errorMessage: "Iltimos, razmer tanlang"));
      return;
    }

    final result = await _cartRepository.addToCart(
      productId: state.detail.id,
      sizeId: selectedSize.id,
    );

    result.fold(
          (error) => emit(state.copyWith(
        errorMessage: error.toString(),
        cartSuccess: false,
      )),
          (ok) => emit(state.copyWith(
        cartSuccess: true,
        errorMessage: null,
      )),
    );
  }

}
