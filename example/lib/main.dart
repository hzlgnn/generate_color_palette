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
    final paletteGenerator = ColorPaletteService(primaryColor);

    final complementaryColor = paletteGenerator.getComplementaryColor();
    final analogColors = paletteGenerator.getAnalogColors();
    final monochromaticColors = paletteGenerator.getMonochromaticColors();
    final saturationPalette = paletteGenerator.generateSaturationPalette();
    final huePalette = paletteGenerator.generateHuePalette();
    final lightnessPalette = paletteGenerator.generateLightnessPalette();
    final randomPalette = paletteGenerator.getRandomPalette(5);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Color Palette Generator')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Primary Color: ${colorToHex(primaryColor)}',
                style: const TextStyle(fontSize: 18)),
            Container(
              height: 50,
              color: primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Complementary Color: ${colorToHex(complementaryColor)}',
                style: const TextStyle(fontSize: 18)),
            Container(height: 50, color: complementaryColor),
            const SizedBox(
              height: 20,
            ),
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
            /* const Text('Random Palette:', style: TextStyle(fontSize: 18)),
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

  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
