import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/feature/saved/managers/saved_state.dart';
import '../../../data/repositories/product_repository.dart';



class SavedCubit extends Cubit<SavedState> {
  SavedCubit({
    required ProductRepository savedProductRepo,
  })  : _savedProductRepo = savedProductRepo,
        super(SavedState.initial()) {
    fetchSavedProduct();
  }

  final ProductRepository _savedProductRepo;

  Future<void> fetchSavedProduct() async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _savedProductRepo.getSavedProduct();

    result.fold(
          (failure) => emit(
        state.copyWith(errorMessage: failure.toString(), loading: false),
      ),
          (products) => emit(
        state.copyWith(savedProduct: products, loading: false),
      ),
    );
  }

  Future<void> removeFromSaved(int productId) async {
    final result = await _savedProductRepo.unSaveProduct(productId);

    result.fold(
          (failure) {
        emit(state.copyWith(errorMessage: failure.toString()));
      },
          (_) {
        final updated =
        state.savedProduct.where((p) => p.id != productId).toList();
        emit(state.copyWith(savedProduct: updated));
      },
    );
  }
}
