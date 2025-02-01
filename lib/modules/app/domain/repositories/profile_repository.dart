import 'package:traveling_app/shared/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<void>> load();
}
