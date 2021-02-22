import '../config/palette_brightness.dart';
import '../gradients/gradient_palette.dart';

/// Create a Background pallete from
/// [dpCount], [brightness], [baseHue], [variability], [range]
class ElevationOverlay extends GradientPalette {
  /// Create a Background pallete from
  /// [dpCount], [brightness], [baseHue], [variability], [range]
  const ElevationOverlay({
    int dpCount,
    PaletteBrightness brightness,
    double variability,
    double baseHue,
  }) : super(
          dpCount: dpCount,
          brightness: brightness,
          variability: variability,
          baseHue: baseHue,
        );
}
