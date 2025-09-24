import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/product_model.dart';

part 'saved_state.freezed.dart';

@freezed
abstract class SavedState with _$SavedState {
  const factory SavedState({
    String? errorMessage,
    @Default(true) bool loading,
    @Default([]) List<ProductModel> savedProduct,
  }) = _SavedState;

  factory SavedState.initial() => const SavedState(
    errorMessage: null,
    loading: true,
    savedProduct: [],
  );
}
