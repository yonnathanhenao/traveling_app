part of '../widgets.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.required = false,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.validator,
  });
  final bool obscureText;
  final bool required;
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String? errorText;

  _onChanged(String value) {
    errorText = _validator(value);
    setState(() {});
  }

  String? _validator(String? value) {
    if (widget.required && (value == null || value.isEmpty)) {
      return "Field required";
    }
    return widget.validator != null ? widget.validator!(value) : null;
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: _validator,
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          errorText: errorText,
        ),
      );
}
