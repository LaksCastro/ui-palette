import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';

import 'package:ui_palette/config/palette_brightness.dart';
import 'package:ui_palette/gradients/gradient_palette.dart';

void main() {
  group('class GradientPalette { ... }', () {
    test('basic features - red dark', () {
      final mock = PaletteMock(
        paletteBrightness: PaletteBrightness.dark,
        offset: 0.2,
        baseHue: 0, // red
        dpCount: 10,
        variability: 0.01,
      );

      for (var i = 0; i < mock.dpCount - 1; i++) {
        expect(mock.hslLightness(i), equals('0.2$i'));
      }

      expect(mock[0].red, greaterThan(mock[0].blue));
      expect(mock[0].red, greaterThan(mock[0].green));

      expect(() => mock[10], throwsA(isA<RangeError>()));
    });
    test('basic features - blue light', () {
      final mock = PaletteMock(
        paletteBrightness: PaletteBrightness.light,
        offset: 0.2,
        baseHue: 210, // blue
        dpCount: 10,
        variability: 0.01,
      );

      expect(mock.hslLightness(9), equals('0.80'));

      expect(mock[0].blue, greaterThan(mock[0].red));
      expect(mock[0].blue, greaterThan(mock[0].green));

      expect(() => mock[10], throwsA(isA<RangeError>()));
    });
    test('invalid palette - should throw AssertionError', () {
      expect(
        () => PaletteMock(
          paletteBrightness: PaletteBrightness.light,
          offset: 0.2,
          baseHue: 0,
          dpCount: 10,
          variability: 1,
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

class PaletteMock extends GradientPalette {
  const PaletteMock({
    PaletteBrightness paletteBrightness,
    double offset,
    double baseHue,
    int dpCount,
    double variability,
  }) : super(
          baseHue: baseHue,
          brightness: paletteBrightness,
          dpCount: dpCount,
          offset: offset,
          variability: variability,
        );

  /// [toStringAsFixed] uis being used to avoid floating errors
  /// Like the below:
  /// ```
  /// Expected: <0.21>
  ///  Actual: <0.21000000000000002>
  /// ```
  String hslLightness(int dp) => hsl(dp).lightness.toStringAsFixed(2);

  HSLColor hsl(int dp) => fromDp(dp);
}
