import 'package:flutter/painting.dart';
import '../config/palette_brightness.dart';

import 'gradient_palette.dart';

/// Generate a gradient palette that change [alpha] value for each [dp] value
abstract class AlphaGradientPalette extends GradientPalette {
  /// Generate a gradient palette that change [alpha] value for each [dp] value
  const AlphaGradientPalette({
    double baseHue,
    PaletteBrightness brightness,
    int dpCount,
    double variability,
    double offset,
  }) : super(
          baseHue: baseHue,
          brightness: brightness,
          dpCount: dpCount,
          variability: variability,
          offset: offset ?? 0.1,
        );

  @override
  Color operator [](int dp) {
    return fromDp(dp).toColor();
  }

  @override
  HSLColor fromDp(int dp) {
    final hslResult = super.fromDp(dp);
    final darkerResult = super.fromDp(0);

    final hslColor = HSLColor.fromAHSL(
      hslResult.lightness,
      baseHue ?? 0,
      isMonochrome ? 0 : 1,
      darkerResult.lightness,
    );

    return hslColor;
  }
}
