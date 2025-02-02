part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fullWidth = false,
    this.enabled = true,
  });

  final bool fullWidth;
  final bool enabled;
  final String text;
  final double? width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: enabled ? onPressed : null,
        child: TextWidget(text),
      ),
    );
  }
}
