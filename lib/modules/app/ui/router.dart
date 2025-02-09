part of 'ui.dart';

abstract class AppRouter {
  static const home = '/home';
  static const profile = '/profile';

  static void goToHome(BuildContext context) {
    context.go(home);
  }

  static void goToProfile(BuildContext context) {
    context.go(profile);
  }
}
