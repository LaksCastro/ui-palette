/// Use this to create a palette with of X brightness
enum PaletteBrightness {
  /// Use this to create a [dark palette]
  dark,

  /// Use this to create a [light palette]
  light,
}

/// Extension to enable alias for [PaletteBrightness.values]
extension PaletteBrightnessAlias on PaletteBrightness {
  /// Alias for: `
  /// ```
  /// value == PaletteBrightness.dark`
  /// ```
  bool get isDark => this == PaletteBrightness.dark;

  /// Alias for: `
  /// ```
  /// value == PaletteBrightness.light`
  /// ```
  bool get isLight => this == PaletteBrightness.light;
}
