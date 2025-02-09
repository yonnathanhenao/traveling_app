part of 'ui.dart';

abstract class AuthRouter {
  static const login = '/login';
  static const signUp = '/sign-up';

  static get routes => [];

  static void goToLogin(BuildContext context) {
    context.go(login);
  }

  static void goToSignUp(BuildContext context) {
    context.go(signUp);
  }
}
