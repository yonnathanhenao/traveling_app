part of 'widgets.dart';

TextStyle textStyle(BuildContext context) => TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    );

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle(context).merge(style),
      textAlign: textAlign,
    );
  }
}
