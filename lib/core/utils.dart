import 'package:flutter/material.dart';

String abgr2argb(String pixelColor) {
  return "${pixelColor.substring(0, 2)}${pixelColor.substring(6, 8)}${pixelColor.substring(4, 6)}${pixelColor.substring(2, 4)}";
}

extension ColorExt on Color {
  String toRGBHex() => this.value.toRadixString(16).substring(2);
}
