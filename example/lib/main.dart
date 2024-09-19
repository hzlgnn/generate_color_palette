import 'package:flutter/material.dart';
import 'package:generate_color_palette/generate_color_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Colors.pink;

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the color palette generator with the primary color
    final paletteGenerator = ColorPaletteService(primaryColor);

    // Generate different color palettes
    final complementaryColor = paletteGenerator.getComplementaryColor();
    final analogColors = paletteGenerator.getAnalogColors();
    final monochromaticColors = paletteGenerator.getMonochromaticColors();
    final saturationPalette = paletteGenerator.generateSaturationPalette();
    final huePalette = paletteGenerator.generateHuePalette();
    final lightnessPalette = paletteGenerator.generateLightnessPalette();
    // final randomPalette = paletteGenerator.getRandomPalette(5); // Uncomment if needed

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Color Palette Generator')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the primary color and its hex value
            Text('Primary Color: ${colorToHex(primaryColor)}',
                style: const TextStyle(fontSize: 18)),
            Container(
              height: 50,
              color: primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the complementary color and its hex value
            Text('Complementary Color: ${colorToHex(complementaryColor)}',
                style: const TextStyle(fontSize: 18)),
            Container(height: 50, color: complementaryColor),
            const SizedBox(
              height: 20,
            ),
            // Display the analog colors and their hex values
            const Text('Analog Colors:', style: TextStyle(fontSize: 18)),
            Row(
              children: analogColors
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the monochromatic colors and their hex values
            const Text('Monochromatic Colors:', style: TextStyle(fontSize: 18)),
            Row(
              children: monochromaticColors
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the saturation palette and their hex values
            const Text('Saturation Palette:', style: TextStyle(fontSize: 18)),
            Row(
              children: saturationPalette
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the hue palette and their hex values
            const Text('Hue Palette:', style: TextStyle(fontSize: 18)),
            Row(
              children: huePalette
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the lightness palette and their hex values
            const Text('Lightness Palette:', style: TextStyle(fontSize: 18)),
            Row(
              children: lightnessPalette
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),
            /* Uncomment if you want to display the random palette
            const Text('Random Palette:', style: TextStyle(fontSize: 18)),
            Row(
              children: randomPalette
                  .map((color) => Expanded(
                      child: Container(
                          height: 50,
                          color: color,
                          child: Text(colorToHex(color)))))
                  .toList(),
            ),*/
          ],
        ),
      ),
    );
  }

  // Converts a Color object to a hex string (e.g., #FF5733)
  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
