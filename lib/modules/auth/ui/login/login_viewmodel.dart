import 'package:flutter/material.dart';
import 'package:traveling_app/modules/auth/domain/domain.dart';
import 'package:traveling_app/core/utils/utils.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    loginCommand = Command(_login);
  }

  final AuthRepository _authRepository;
  late Command<void> loginCommand;

  Future<Result<void>> _login() async {
    return await _authRepository.login('admin@example.com', 'admin');
  }
}
