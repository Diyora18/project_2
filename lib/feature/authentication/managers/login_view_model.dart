import 'package:flutter/material.dart';

import '../../../data/models/auth/login_model.dart';
import '../../../data/models/auth/signup_model.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _loginRepo;

  bool isLoading = false;
  String? error;
  bool success = false;

  LoginViewModel({required AuthRepository loginRepo})
      : _loginRepo = loginRepo;

  Future<void> login (LoginModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await _loginRepo.login(model);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        success = true;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
