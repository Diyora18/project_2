

import '../../core/client/client.dart';
import '../../core/result.dart';
import '../models/reviews_model.dart';

class ReviewRepository {
  final ApiClient _apiClient;

  ReviewRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ReviewModel>>> getReviews({required int id}) async {
    var response = await _apiClient.get<List>("/reviews/list/$id");
    return response.fold(
          (error) => Result.error(error),
          (val) =>
          Result.ok(val.map((item) => ReviewModel.fromJson(item)).toList()),
    );
  }
}
