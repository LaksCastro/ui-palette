import 'dart:ui';

import 'package:flutter/painting.dart';

import '../config/palette_brightness.dart';
import '../config/palette_harmony.dart';
import '../gradients/gradient_palette.dart';
import '../interfaces/ui_scheme.dart';

/// Create a brand complementar color
class BrandComplementar implements BrandScheme {
  /// [HUE] value used as base for all other brand colors
  /// Int value to calc brightness for all [dp] levels
  final double baseHue;

  /// Palette brightness, used for all brand colors
  final PaletteBrightness brightness;

  /// [dp] count for all brand colors
  ///
  ///
  /// If you want to get color count of brand palette,
  /// use [.colorCount] instead
  final int dpCount;

  /// Variability of color brightness for each [dp] level
  /// Create the brand color scheme from [baseHue]
  final double variability;

  /// If brand color is black (for light themes)
  /// or white (for dark themes), set baseHue to null
  const BrandComplementar({
    this.baseHue,
    this.variability,
    this.brightness,
    this.dpCount,
  }) : assert(
          baseHue != null ? baseHue >= 0 && baseHue <= 360 : true,
          '''[baseHue] must be a double between 0 and 360''',
        );

  @override
  int get colorCount => 2;

  @override
  PaletteHarmony get harmony => PaletteHarmony.complementar;

  @override
  UISchemeHueBased<int, Color> get primary => _colors[0];

  @override
  List<Object> get props => [..._colors.values];

  @override
  bool get stringify => false;

  Map<int, UISchemeHueBased<int, Color>> get _colors => {
        0: _PrimaryColorScheme(
          baseHue: baseHue,
          variability: variability,
          brightness: brightness,
          dpCount: dpCount,
        ),
        1: _SecondaryColorScheme(
          baseHue: baseHue,
          variability: variability,
          brightness: brightness,
          dpCount: dpCount,
        ),
      };

  @override
  UISchemeHueBased<int, Color> operator [](int color) {
    final target = _colors[color];

    if (target == null) throw RangeError.range(color, 0, colorCount);

    return target;
  }
}

class _PrimaryColorScheme extends GradientPalette {
  const _PrimaryColorScheme({
    double baseHue,
    PaletteBrightness brightness,
    int dpCount,
    double variability,
    double offset,
  }) : super(
          baseHue: baseHue,
          brightness: brightness == PaletteBrightness.dark
              ? PaletteBrightness.light
              : PaletteBrightness.dark,
          dpCount: dpCount ?? 5,
          variability: variability ?? 0.05,
          offset: offset ?? 0.05,
        );
}

class _SecondaryColorScheme extends GradientPalette {
  const _SecondaryColorScheme({
    double baseHue,
    PaletteBrightness brightness,
    int dpCount,
    double variability,
    double offset,
  }) : super(
          baseHue: baseHue == null ? null : (baseHue + 180) % 360,
          brightness: brightness == PaletteBrightness.dark
              ? PaletteBrightness.light
              : PaletteBrightness.dark,
          dpCount: dpCount ?? 5,
          variability: variability ?? 0.05,
          offset: offset ?? 0.05,
        );
}
