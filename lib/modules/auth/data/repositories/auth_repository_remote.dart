part of '../data.dart';

class AuthRepositoryRemote implements AuthRepository {
  late ApiDataSource _api;

  AuthRepositoryRemote() : super() {
    _api = ApiDataSource();
  }

  @override
  Future<Result<void>> login(String email, String password) async {
    final result = await _api.post(
      '/auth/login',
      <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error():
        return Result.error(result.error);
    }
  }
}
