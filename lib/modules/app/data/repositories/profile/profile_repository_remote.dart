part of '../../data.dart';

class ProfileRepositoryRemote implements ProfileRepository {
  @override
  Future<Result<void>> load() async {
    return const Result.ok(null);
  }
}
