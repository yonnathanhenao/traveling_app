part of '../data.dart';

class AuthRepositoryLocal implements AuthRepository {
  @override
  Future<Result<void>> login(String email, String password) async {
    return const Result.ok(null);
  }
}
