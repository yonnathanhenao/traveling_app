import 'package:traveling_app/core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<void>> login(String email, String password);
}
