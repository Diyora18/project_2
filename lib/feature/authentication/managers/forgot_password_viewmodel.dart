import 'package:flutter/cupertino.dart';

import '../../../data/models/reset_password_email.dart';
import '../../../data/models/reset_password_reset.model.dart';
import '../../../data/models/reset_password_verify.dart';
import '../../../data/repositories/password_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final PasswordRepository _resetRepo;

  AuthViewModel({required PasswordRepository resetRepo})
      : _resetRepo = resetRepo;

  // Loading holatlari
  bool isLoadingEmail = false;
  bool isLoadingVerify = false;
  bool isLoadingReset = false;

  // Error holatlari
  String? emailError;
  String? verifyError;
  String? resetError;

  // Data states
  String? email;
  String? code;
  String? newPassword;

  // Page o‘tish flaglari
  bool canGoToVerifyPage = false;
  bool canGoToResetPage = false;

  /// Send Code - Email
  Future<void> fetchForgotEmail({required EmailModel model}) async {
    isLoadingEmail = true;
    emailError = null;
    canGoToVerifyPage = false;
    notifyListeners();

    final result = await _resetRepo.email(model);

    result.fold(
          (failure) {
        emailError = failure.toString();
      },
          (success) {
        // Backend formatiga mos shart

          email = model.email;
          canGoToVerifyPage = true; // Page ga o‘tish flag

      },
    );

    isLoadingEmail = false;
    notifyListeners();
  }

  /// Verify Code
  Future<void> fetchForgotVerify({required VerifyModel model}) async {
    isLoadingVerify = true;
    verifyError = null;
    canGoToResetPage = false;
    notifyListeners();

    final result = await _resetRepo.verify(model);

    result.fold(
          (failure) {
        verifyError = failure.toString();
      },
          (success) {
        if (success.containsKey('status') && success['status'] == 'success') {
          code = model.code;
          canGoToResetPage = true; // Page ga o‘tish flag
        } else {
          verifyError = "Xato javob formati";
        }
      },
    );

    isLoadingVerify = false;
    notifyListeners();
  }

  /// Reset Password
  Future<void> fetchForgotReset({required ResetModel model}) async {
    isLoadingReset = true;
    resetError = null;
    notifyListeners();

    final result = await _resetRepo.reset(model);

    result.fold(
          (failure) {
        resetError = failure.toString();
      },
          (success) {
        if (success.containsKey('newPassword')) {
          newPassword = success['newPassword'];
        } else {
          resetError = "Xato javob formati";
        }
      },
    );

    isLoadingReset = false;
    notifyListeners();
  }
}
