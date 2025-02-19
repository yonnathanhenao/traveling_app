part of '../ui.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Dimensions.of(context).edgeInsetsScreenSymmetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              'Login',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Spacing.v16,
            LoginForm(
              loading: context.watch<LoginViewModel>().loginCommand.running,
              onSubmit: (email, password) =>
                  context.read<LoginViewModel>().onLoginPressed(
                        context,
                        email,
                        password,
                      ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: TextWidget(
                  'Recover password',
                  style: TextStyle(
                    color: Colors.blue,
                    decorationColor: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
