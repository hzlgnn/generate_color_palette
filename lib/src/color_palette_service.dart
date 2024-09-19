import 'dart:math';

import 'package:flutter/material.dart';

class ColorPaletteService {
  final Color primaryColor;

  ColorPaletteService(this.primaryColor);

  Color getComplementaryColor() {
    final hsl = HSLColor.fromColor(primaryColor);
    final complementaryHue = (hsl.hue + 180) % 360;
    final complementaryColor = hsl.withHue(complementaryHue).toColor();
    return complementaryColor;
  }

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

  List<Color> getMonochromaticColors() {
    return [
      primaryColor.withOpacity(0.25),
      primaryColor.withOpacity(0.5),
      primaryColor.withOpacity(0.75),
      primaryColor,
    ];
  }

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
