part of '../domain.dart';

abstract class AuthRepository {
  Future<Result<String>> login(String email, String password);
}
