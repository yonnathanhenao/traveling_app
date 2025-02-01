part of '../../ui.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        InputWidget(controller: emailController),
        InputWidget(controller: passwordController),
        ButtonWidget(
          text: 'Login',
          onPressed: onSubmit,
        ),
      ],
    );
  }
}
