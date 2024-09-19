import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generate_color_palette/generate_color_palette.dart';

void main() {
  group('ColorPaletteGenerator Tests', () {
    test('Complementary color should be calculated correctly', () {
      const color = Colors.blue;
      final generator = ColorPaletteService(color);

      final complementaryColor = generator.getComplementaryColor();

      expect(complementaryColor, Color(0xFFFFFF - color.value));
    });

    test('Analog colors should be generated correctly', () {
      const color = Colors.blue;
      final generator = ColorPaletteService(color);

      final analogColors = generator.getAnalogColors();

      expect(analogColors.length, 3);
      expect(analogColors[1], color);
    });

    test('Monochromatic colors should be generated correctly', () {
      const color = Colors.blue;
      final generator = ColorPaletteService(color);

      final monochromaticColors = generator.getMonochromaticColors();

      expect(monochromaticColors.length, 4);
      expect(monochromaticColors[0].opacity, 0.25);
      expect(monochromaticColors[1].opacity, 0.5);
      expect(monochromaticColors[2].opacity, 0.75);
      expect(monochromaticColors[3].opacity, 1.0);
    });

    test('Random palette should generate correct number of colors', () {
      const color = Colors.blue;
      final generator = ColorPaletteService(color);

      final randomPalette = generator.getRandomPalette(5);

      expect(randomPalette.length, 5);
    });

    test('Random palette colors should be unique', () {
      const color = Colors.blue;
      final generator = ColorPaletteService(color);

      final randomPalette = generator.getRandomPalette(5);

      final uniqueColors = randomPalette.toSet();
      expect(uniqueColors.length, randomPalette.length);
    });
  });
}
