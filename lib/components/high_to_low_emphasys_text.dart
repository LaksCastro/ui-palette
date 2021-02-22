import 'package:flutter/painting.dart';

import '../config/palette_brightness.dart';
import '../gradients/gradient_palette.dart';

/// Create a Background pallete from
/// [dpCount], [brightness], [baseHue], [variability], [range]
class HighToLowEmphasysText extends GradientPalette {
  /// Create a background palette with [dpCount]
  const HighToLowEmphasysText({
    int dpCount,
    PaletteBrightness brightness,
    double variability,
    double baseHue,
  }) : super(
          dpCount: dpCount,
          brightness: brightness == PaletteBrightness.dark
              ? PaletteBrightness.light
              : PaletteBrightness.dark,
          variability: variability,
          baseHue: baseHue,
          offset: 0.05,
        );

  /// Disabled color, based on [baseHue] and [brightness]
  Color get disabled => disabled.withOpacity(.5);

  /// Low emphasys, based on [baseHue] and [brightness]
  Color get lowEmphasys => this[dpCount - 1];

  /// Hight emphasys, based on [baseHue] and [brightness]
  Color get highEmphasys => this[0];
}
