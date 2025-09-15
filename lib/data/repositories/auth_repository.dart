import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_2/data/models/reset_password_reset.model.dart';
import '../../../core/result.dart';
import '../../core/client/client.dart';
import '../models/login_model.dart';
import '../models/reset_password_email.dart';
import '../models/reset_password_verify.dart';
import '../models/signup_model.dart';

class AuthRepository {
  final ApiClient apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthRepository({required this.apiClient});

  Future<Result<Map<String, dynamic>>> register(SignUpModel model) async {
    try {
      final result = await apiClient.post(
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
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    try {
      final result = await apiClient.post(
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
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }



}
