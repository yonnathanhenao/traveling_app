import 'package:traveling_app/core/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<void>> load();
}
