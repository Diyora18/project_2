import 'package:project_2/data/models/new_card_model.dart';

import '../../core/client/client.dart';
import '../../core/result.dart';
import '../models/payment_model.dart';
class CardRepository {
  final ApiClient _apiClient;

  CardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CardModel>>> getCards() async {
    var response = await _apiClient.get<List<dynamic>>('/cards/list');

    return response.fold(
          (error) => Result.error(error),
          (data) {
        final cards = data
            .map((x) => CardModel.fromJson(x as Map<String, dynamic>))
            .toList();
        return Result.ok(cards);
      },
    );
  }

  Future<Result<void>> addCard(NewCardModel data) async {
    var response = await _apiClient.post("/cards/create", data: data.toJson());

    return response.fold(
          (error) => Result.error(error),
          (_) => Result.ok(null),
    );
  }
}
