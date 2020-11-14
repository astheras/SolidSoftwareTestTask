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
