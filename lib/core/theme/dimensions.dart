part of 'theme.dart';

abstract final class Dimensions {
  const Dimensions();

  static const double paddingHorizontal = 16;
  static const double paddingVertical = 16;

  double get paddingScreenHorizontal;
  double get paddingScreenVertical;
  double get profilePictureSize;

  EdgeInsets get edgeInsetsScreenHorizontal => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
      );

  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  static const Dimensions desktop = _DimensionsDesktop();
  static const Dimensions mobile = _DimensionsMobile();

  factory Dimensions.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 => desktop,
        _ => mobile,
      };
}

final class _DimensionsMobile extends Dimensions {
  @override
  final double paddingScreenHorizontal = Dimensions.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimensions.paddingVertical;

  @override
  final double profilePictureSize = 64;

  const _DimensionsMobile();
}

final class _DimensionsDesktop extends Dimensions {
  @override
  final double paddingScreenHorizontal = 32;

  @override
  final double paddingScreenVertical = 32;

  @override
  final double profilePictureSize = 128;

  const _DimensionsDesktop();
}
