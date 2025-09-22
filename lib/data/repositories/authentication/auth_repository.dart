import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_2/data/models/auth/signup_model.dart';
import '../../../core/client/client.dart';
import '../../../core/result.dart';
import '../../models/auth/login_model.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<Map<String, dynamic>>> register(SignUpModel model) async {
    final result = await _apiClient.post(
      "/auth/register",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          final token = data['accessToken'];
          if (token != null) {
            _secureStorage.write(key: "token", value: token);
          }
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }

  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    final result = await _apiClient.post(
      "/auth/login",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          final token = data['accessToken'];
          if (token != null) {
            _secureStorage.write(key: "token", value: token);
          }
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
