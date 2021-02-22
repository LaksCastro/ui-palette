import 'dart:ui';

import 'package:equatable/equatable.dart';
import '../config/palette_harmony.dart';

/// Interface for array-like getters
///
/// Background example:
/// `pallete.background[0]` // #111111
/// `pallete.background[1]` // #151515
abstract class UIScheme<I extends Object, O extends Object> extends Equatable {
  /// Default constructor
  const UIScheme();

  /// Get a [O] value relative to [I] input
  O operator [](I input);
}

/// [HUE] based UI Scheme, use this for all scheme based on HSL color
abstract class UISchemeHueBased<I extends Object, O extends Object>
    extends UIScheme<I, O> {
  /// Base [HUE] used for all computed colors,
  /// if null, the base color will be black if [brightness] is dark
  /// or white if [brightness] is light
  final double baseHue;

  /// Default constructor
  const UISchemeHueBased(this.baseHue);
}

/// Superclass for all text scheme implementations
abstract class TextScheme implements UISchemeHueBased<int, Color> {}

/// Superclass for all brand scheme implementations
abstract class BrandScheme
    implements UISchemeHueBased<int, UISchemeHueBased<int, Color>> {
  /// Essencial property for all brand systems
  ///
  /// Can extend  and add [primaryVariant], [secondary], [secondaryVariant]
  UISchemeHueBased<int, Color> get primary;

  /// **_How many_** colors there are in that system
  int get colorCount;

  /// Harmony used by this
  PaletteHarmony get harmony;
}
