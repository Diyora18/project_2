import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/client/client.dart';
import '../../core/result.dart';
import '../models/reset_password_email.dart';
import '../models/reset_password_reset.model.dart';
import '../models/reset_password_verify.dart';

class PasswordRepository {
  final ApiClient apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  PasswordRepository({required this.apiClient});

  /// Send Code - Email
  Future<Result<String>> email(EmailModel model) async {
    try {
      final result = await apiClient.post(
        "/auth/reset-password/email",
        data: model.toJson(),
      );

      return result.fold(
            (err) => Result.error(err),
            (data) {
          // Backend faqat { "email": "string" } yuborsa ham ok

            return Result.ok(data);

        },
      );
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  /// Verify Code
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

  /// Reset Password
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
            // Backend kaliti password bo‘lsa qabul qilamiz
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
