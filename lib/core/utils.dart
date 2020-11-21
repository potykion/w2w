
String abgr2argb(String pixelColor) {
  return "${pixelColor.substring(0, 2)}${pixelColor.substring(6, 8)}${pixelColor.substring(4, 6)}${pixelColor.substring(2, 4)}";
}
