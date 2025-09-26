import 'package:project_2/data/models/cart_model.dart';

import '../../core/client/client.dart';
import '../../core/result.dart';

class CartRepository {
  final ApiClient _apiClient;

  CartRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<String>> addToCart({
    required int productId,
    required int sizeId,
  }) async {
    final response = await _apiClient.post(
      "/my-cart/add-item",
      data: {
        "productId": productId,
        "sizeId": sizeId,
      },
    );

    return response.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data),
    );
  }

  Future<Result<List<CartModel>>> cartList() async {
    final response = await _apiClient.get('/my-cart/my-cart-items');

    return response.fold((error) => Result.error(error), (data) {
      if (data is List) {
        final carts = data.map((json) => CartModel.fromJson(json)).toList();
        return Result.ok(carts);
      }
      return Result.error(Exception('Xatolik'));
    });
  }
}
