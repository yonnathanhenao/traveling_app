part of '../../data.dart';

class ProfileRepositoryLocal implements ProfileRepository {
  @override
  Future<Result<void>> load() async {
    return const Result.ok(null);
  }
}
