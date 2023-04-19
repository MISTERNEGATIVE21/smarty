import 'package:bat_theme/src/themes/palette.dart';
import 'package:flutter/material.dart';

@immutable
class BatColors extends ThemeExtension<BatColors> {
  final Color background;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  const BatColors._({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  BatColors.light()
      : this._(
          background: BatPalette.white,
          primary: BatPalette.primary,
          secondary: BatPalette.secondary,
          tertiary: BatPalette.grey,
        );

  BatColors.dark()
      : this._(
          background: BatPalette.grey,
          primary: BatPalette.primary,
          secondary: BatPalette.secondary,
          tertiary: BatPalette.white,
        );

  @override
  BatColors copyWith() {
    return this;
  }

  @override
  BatColors lerp(covariant ThemeExtension<BatColors>? other, double t) {
    if (other is! BatColors) {
      return this;
    }
    return BatColors._(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
