import 'package:project_2/core/client/client.dart';
import 'package:project_2/core/result.dart';

import '../../models/home/category_model.dart';
import '../../models/home/product_model.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ProductModel>>> getProducts(int categoryId) async {
    final result = await _apiClient.get(
      "/products/list?CategoryId=$categoryId",
    );

    return result.fold(
      (err) => Result.error(err),
      (data) {
        print("API data: $data");

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

  Future<Result<List<ProductModel>>> getAllProducts() async {
    final result = await _apiClient.get("/products/list");

    return result.fold((err) => Result.error(err), (data) {
      if (data is List) {
        final products = data
            .map((json) => ProductModel.fromJson(json))
            .toList();
        return Result.ok(products);
      }
      return Result.error(Exception("Xato javob formati"));
    });
  }

  Future<Result> saveProducts(int productId) async {
    return await _apiClient.post(
      "/auth/save/$productId",
      data: {},
    );
  }

  Future<Result> unSaveproduct(int productId) async {
    return await _apiClient.post("/auth/unsave/$productId", data: {});
  }
}
