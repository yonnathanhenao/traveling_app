part of '../domain.dart';

class LoginUseCase {
  LoginUseCase(this.repository);

  final AuthRepository repository;

  Future<Result<String>> execute(String email, String password) {
    return repository.login(email, password);
  }
}
