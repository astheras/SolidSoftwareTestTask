import 'package:flutter/material.dart';
import 'dart:math';

//generate random color
Color generateRandomColor() {
  final _random = new Random();

  return Color((_random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

//random range
double randomRange(double min, double max, [bool isInt = true]) {
  final _random = new Random();
  if (isInt)
    return min + _random.nextInt(max.toInt() - min.toInt());
  else
    return min + _random.nextDouble() * max;
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
