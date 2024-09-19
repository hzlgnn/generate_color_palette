import 'dart:math';

import 'package:flutter/material.dart';

/// A service class for generating various color palettes
/// based on a primary color.
class ColorPaletteService {
  final Color primaryColor;

  ColorPaletteService(this.primaryColor);

  /// Returns the complementary color for the [primaryColor].
  Color getComplementaryColor() {
    final hsl = HSLColor.fromColor(primaryColor);
    final complementaryHue = (hsl.hue + 180) % 360;
    final complementaryColor = hsl.withHue(complementaryHue).toColor();
    return complementaryColor;
  }

  /// Generates a list of analog colors based on the [primaryColor].
  List<Color> getAnalogColors() {
    return [
      HSLColor.fromColor(primaryColor)
          .withHue((HSLColor.fromColor(primaryColor).hue + 30) % 360)
          .toColor(),
      primaryColor,
      HSLColor.fromColor(primaryColor)
          .withHue((HSLColor.fromColor(primaryColor).hue - 30) % 360)
          .toColor(),
    ];
  }

  /// Generates a monochromatic color palette based on the [primaryColor].
  List<Color> getMonochromaticColors() {
    return [
      primaryColor.withOpacity(0.25),
      primaryColor.withOpacity(0.5),
      primaryColor.withOpacity(0.75),
      primaryColor,
    ];
  }

  /// Generates a random color palette with [count] colors.
  List<Color> getRandomPalette(int count) {
    final random = Random();
    return List.generate(
        count,
        (index) => Color.fromARGB(
              255,
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
            ));
  }

  /// Generates a color palette by varying the saturation of the [primaryColor].
  List<Color> generateSaturationPalette() {
    final hsl = HSLColor.fromColor(primaryColor);

    return [
      hsl.withSaturation(0.2).toColor(),
      hsl.withSaturation(0.4).toColor(),
      hsl.withSaturation(0.6).toColor(),
      hsl.withSaturation(0.8).toColor(),
      hsl.withSaturation(1.0).toColor(),
    ];
  }

  /// Generates a color palette by varying the hue of the [primaryColor].
  List<Color> generateHuePalette() {
    final hsl = HSLColor.fromColor(primaryColor);

    return [
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
      hsl.withHue((hsl.hue + 60) % 360).toColor(),
      hsl.withHue((hsl.hue + 90) % 360).toColor(),
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 150) % 360).toColor(),
    ];
  }

  /// Generates a color palette by varying the lightness of the [primaryColor].
  List<Color> generateLightnessPalette() {
    final hsl = HSLColor.fromColor(primaryColor);

    return [
      hsl.withLightness(0.2).toColor(),
      hsl.withLightness(0.4).toColor(),
      hsl.withLightness(0.6).toColor(),
      hsl.withLightness(0.8).toColor(),
      hsl.withLightness(1.0).toColor(),
    ];
  }
}
