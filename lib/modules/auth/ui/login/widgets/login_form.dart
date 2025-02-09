part of '../../ui.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.loading,
    required this.onSubmit,
  });
  final bool loading;
  final Function(String, String) onSubmit;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            InputEmailWidget(
              controller: emailController,
              required: true,
            ),
            InputWidget(
              controller: passwordController,
              hintText: 'Enter your password',
              labelText: 'Password',
              obscureText: true,
              required: true,
            ),
            ButtonWidget(
              text: 'Login',
              fullWidth: true,
              loading: widget.loading,
              onPressed: widget.loading
                  ? null
                  : () {
                      final isFormValid =
                          _formKey.currentState?.validate() ?? false;
                      if (!isFormValid) return;
                      widget.onSubmit(
                          emailController.text, passwordController.text);
                    },
            ),
          ],
        ),
      );
}
