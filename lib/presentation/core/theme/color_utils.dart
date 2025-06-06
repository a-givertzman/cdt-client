import 'package:flutter/material.dart';
///
/// Возвращает тот же цвет, 
///   но темнее если 0 < shift < 1.0,
///   или светлее если shift > 1.0,
Color colorShiftLightness(Color color, double factor) {
  assert(factor >= 0);
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness * factor;
  if (lightness < 0) return hslColor.withLightness(0).toColor();
  if (lightness > 1) return hslColor.withLightness(1).toColor();
  return hslColor.withLightness(lightness).toColor();
}
///
/// Returns inverted [color]
Color colorInvert(Color color) {
  return Color.fromARGB(
    (255.0 * color.a).round(),
    (255.0 - color.r).round(),
    (255.0 - color.g).round(),
    (255.0 - color.b).round(),
  );
}
