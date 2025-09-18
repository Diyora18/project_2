import 'package:project_2/core/client/client.dart';
import 'package:project_2/core/result.dart';

import '../../models/home/category_model.dart';

class CategoryRepository {
  final ApiClient _apiClient;

  CategoryRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CategoryModel>>> getCategories() async {
    final result = await _apiClient.get("/categories/list");

    return result.fold((err) => Result.error(err), (data) {
      if (data is List) {
        final categories = data
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        return Result.ok(categories);
      }

      return Result.error(Exception("Xato javob formati"));
    });
  }
}
