import 'package:project_2/core/client/client.dart';
import 'package:project_2/core/result.dart';

import '../../models/home/category_model.dart';
import '../../models/home/product_model.dart';

class SavedRepository {
  final ApiClient _apiClient;

  SavedRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ProductModel>>> getSavedProduct() async {
    final result = await _apiClient.get("/products/saved-products");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is List) {
          final products = data
              .map((json) => ProductModel.fromJson(json))
              .toList();
          return Result.ok(products);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }

}
