import 'package:flutter/material.dart';

import '../../../data/models/auth/signup_model.dart';
import '../../../data/repositories/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _signupRepo;

  bool isLoading = false;
  String? error;
  bool success = false;

  SignUpViewModel({required AuthRepository signupRepo})
      : _signupRepo = signupRepo;

  Future<void> register(SignUpModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await _signupRepo.register(model);

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
