part of '../data.dart';

class AuthRepositoryLocal implements AuthRepository {
  @override
  Future<Result<String>> login(String email, String password) async {
    return const Result.ok('');
  }
}
