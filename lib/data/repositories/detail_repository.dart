import 'package:project_2/core/client/client.dart';
import 'package:project_2/core/result.dart';

import '../models/detail_model.dart';

class DetailRepository {
  final ApiClient _apiClient;

  DetailRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<DetailModel>> getDetails(int id) async {
    final result = await _apiClient.get("/products/detail/$id");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          final detail = DetailModel.fromJson(data);
          return Result.ok(detail);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
