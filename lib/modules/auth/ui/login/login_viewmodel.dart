part of '../ui.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required this.loginUseCase}) {
    loginCommand = CommandWithArgs<String, LoginCredentials>(_login);
  }

  final LoginUseCase loginUseCase;
  late CommandWithArgs<String, LoginCredentials> loginCommand;

  Future<Result<String>> _login(LoginCredentials credentials) async {
    return await loginUseCase.execute(credentials.email, credentials.password);
  }

  Future<void> onLoginPressed(
    BuildContext context,
    String email,
    String password,
  ) async {
    await loginCommand.execute(
      LoginCredentials(email: email, password: password),
    );
    if (loginCommand.result is Error) {
      print('error ${loginCommand.result}');
      return;
    }
    print('success ${loginCommand.result}');
    if (context.mounted) {
      AppRouter.goToHome(context);
    }
  }
}

class LoginCredentials {
  LoginCredentials({required this.email, required this.password});

  final String email;
  final String password;
}
