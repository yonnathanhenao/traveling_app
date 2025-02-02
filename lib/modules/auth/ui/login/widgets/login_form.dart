part of '../../ui.dart';

class LoginForm extends StatefulWidget {
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFormValid = false;

  _onSubmit() {
    print(widget.emailController.text);
    print(widget.passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        isFormValid = _formKey.currentState?.validate() ?? false;
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          InputEmailWidget(
            controller: widget.emailController,
            required: true,
          ),
          InputWidget(
            controller: widget.passwordController,
            hintText: 'Enter your password',
            labelText: 'Password',
            obscureText: true,
            required: true,
          ),
          ButtonWidget(
            text: 'Login',
            fullWidth: true,
            enabled: isFormValid,
            onPressed: _onSubmit,
          ),
        ],
      ),
    );
  }
}
