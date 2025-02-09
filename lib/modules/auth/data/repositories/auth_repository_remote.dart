part of '../data.dart';

class AuthRepositoryRemote implements AuthRepository {
  late ApiDataSource _api;

  AuthRepositoryRemote() : super() {
    _api = ApiDataSource();
  }

  @override
  Future<Result<String>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 5), () {});

    return Result.ok('token');

    // final result = await _api.post(
    //   '/auth/login',
    //   <String, dynamic>{
    //     'email': email,
    //     'password': password,
    //   },
    // );

    // switch (result) {
    //   case Ok<void>():
    //     return Result.ok('token');
    //   case Error():
    //     return Result.error(result.error);
    // }
  }
}
