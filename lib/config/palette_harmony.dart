/// Represent a behavior for searching complementary colors,
///
/// see [color calculator for details](https://www.sessions.edu/color-calculator/)
enum PaletteHarmony {
  /// Generate [1] secondary color relative
  /// to brand color (rotate [HUE] by 180deg)
  ///
  /// Total brand colors: [2]
  complementar,

  /// Generate [1] secondary color with same [HUE] but with diff lightness
  ///
  /// Total brand colors: [2]
  monochromatic,

  /// Generate [2] secondary color's: [1° = +10deg] [2° = -10deg]
  ///
  /// Total brand colors: [3]
  analogous,

  /// Generate [2] secondary color's: [1° = +160] [2° = -160deg]
  ///
  /// Total brand colors: [3]
  splitComplementary,

  /// Generate [2] secondary color's: [1° = +160] [2° = -160deg]
  ///
  /// Total brand colors: [3]
  triadic,

  /// Generate [3] secondary color's: [1° = +45deg] [2° = 1° + 180deg]
  /// [3° = +180deg]
  ///
  /// Total brand colors: [3]
  tetradic,

  /// Used to register a custom palette harmony
  custom,
}
