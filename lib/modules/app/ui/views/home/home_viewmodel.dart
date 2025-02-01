part of '../../ui.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.homeRepository});

  HomeRepository homeRepository;
  List<String> items = [];

  Future<List<String>> load() async {
    // final loadCommand = Command()
    final response = await Future.delayed(
      Duration(seconds: 5),
      () => ['1', '2', '3'],
    );
    // final hasError = false;
    // if (hasError) {}
    items = response;
    // notifyListeners();
    return response;
  }
}
