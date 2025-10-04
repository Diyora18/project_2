import 'package:project_2/core/client/client.dart';

import '../../core/result.dart';
import '../models/user_model.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<UserModel>> getMe() async {
    final result = await _apiClient.get("/auth/me");

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(
        UserModel.fromJson(
          Map<String, dynamic>.from(data),
        ),
      ),
    );
  }

  Future<Result<UserModel>> getUser(UserModel user) async {
    final result = await _apiClient.patch("/auth/update", data: user.toJson());

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(UserModel.fromJson(Map<String, dynamic>.from(data))),
    );
  }
}
