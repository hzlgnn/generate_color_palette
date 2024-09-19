# Generate Color Palette

**Generate Color Palette** is a simple Flutter package designed to help you create color palettes based on a primary color. This package can generate complementary, analog, monochromatic, and random color palettes, making it a versatile tool for developers.

## Features

- **Complementary Color:** Generates the complementary color for the given primary color.
- **Analog Colors:** Creates a palette with colors similar to the primary color.
- **Monochromatic Colors:** Generates shades of the primary color with varying opacity.
- **Random Palette:** Produces a palette with random colors.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  generate_color_palette: ^1.0.0
```


## Contributing
Contributions are welcome! Feel free to submit a pull request or open an issue.

## Usage
Here's an example of how to use the Generate Color Palette package:

```dart
import 'package:generate_color_palette/generate_color_palette.dart';
import 'package:flutter/material.dart';

void main() {
  final primaryColor = Colors.blue;
  final paletteGenerator = ColorPaletteGenerator(primaryColor);

  final complementaryColor = paletteGenerator.getComplementaryColor();
  final analogColors = paletteGenerator.getAnalogColors();
  final monochromaticColors = paletteGenerator.getMonochromaticColors();
  final randomPalette = paletteGenerator.getRandomPalette(5);

  runApp(MyApp(
    complementaryColor: complementaryColor,
    analogColors: analogColors,
    monochromaticColors: monochromaticColors,
    randomPalette: randomPalette,
  ));
}

class MyApp extends StatelessWidget {
  final Color complementaryColor;
  final List<Color> analogColors;
  final List<Color> monochromaticColors;
  final List<Color> randomPalette;

  MyApp({
    required this.complementaryColor,
    required this.analogColors,
    required this.monochromaticColors,
    required this.randomPalette,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Generate Color Palette Demo')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Complementary Color:', style: TextStyle(fontSize: 18)),
            Container(height: 50, color: complementaryColor),
            Text('Analog Colors:', style: TextStyle(fontSize: 18)),
            Row(
              children: analogColors.map((color) => Expanded(child: Container(height: 50, color: color))).toList(),
            ),
            Text('Monochromatic Colors:', style: TextStyle(fontSize: 18)),
            Row(
              children: monochromaticColors.map((color) => Expanded(child: Container(height: 50, color: color))).toList(),
            ),
            Text('Random Palette:', style: TextStyle(fontSize: 18)),
            Row(
              children: randomPalette.map((color) => Expanded(child: Container(height: 50, color: color))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
```