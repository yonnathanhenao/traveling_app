part of '../widgets.dart';

class InputEmailWidget extends InputWidget {
  const InputEmailWidget({
    super.key,
    required super.controller,
    super.hintText = 'Enter your email',
    super.labelText = "Email",
    super.required,
  }) : super(
          keyboardType: TextInputType.emailAddress,
          validator: InputEmailWidget.validateEmail,
        );

  static String? validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      final emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      if (!emailRegex.hasMatch(value)) {
        return "Enter a valid email";
      }
    }
    return null;
  }
}
