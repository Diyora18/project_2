import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/client/client.dart';
import '../../core/result.dart';
import '../models/auth/reset_password_email.dart';
import '../models/auth/reset_password_reset.model.dart';
import '../models/auth/reset_password_verify.dart';

class PasswordRepository {
  final ApiClient apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  PasswordRepository({required this.apiClient});

  Future<Result<String>> email(EmailModel model) async {
    try {
      final result = await apiClient.post(
        "/auth/reset-password/email",
        data: model.toJson(),
      );

      return result.fold(
            (err) => Result.error(err),
            (data) {


            return Result.ok(data);

        },
      );
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }


  Future<Result<Map<String, dynamic>>> verify(VerifyModel model) async {
    try {
      final result = await apiClient.post(
        "/auth/reset-password/verify",
        data: model.toJson()
      );

      return result.fold(
            (err) => Result.error(err),
            (data) {
          if (data is Map<String, dynamic> && data.containsKey('code')) {
            return Result.ok(data);
          }
          return Result.error(Exception("Xato javob formati"));
        },
      );
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<Result<Map<String, dynamic>>> reset(ResetModel model) async {
    try {
      final result = await apiClient.post(
        "/auth/email-password/reset",
        data: model.toJson(),
      );

      return result.fold(
            (err) => Result.error(err),
            (data) {
          if (data is Map<String, dynamic> && data.containsKey('password')) {
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
