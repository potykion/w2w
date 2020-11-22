import 'dart:io';

import 'package:flutter/material.dart' show Color;
import 'package:get/get.dart';
import 'package:image/image.dart' show copyRotate, decodeImage, Image;
import 'package:image/src/image.dart';
import 'package:w2w/core/utils.dart';
import 'package:tuple/tuple.dart';

class PickPixelColor {
  final LoadFileImage loadImage;
  final NormalizeCoordinatesRegardingImage normalizeCoordinates;

  PickPixelColor({this.loadImage, this.normalizeCoordinates});

  call(String imagePath, double globalX, double globalY) async {
    var image = loadImage(imagePath);

    var normalizedCoords = normalizeCoordinates(globalX, globalY, image);

    var color = Color(
      int.parse(
        abgr2argb(
          image
              .getPixel(normalizedCoords.item1, normalizedCoords.item2)
              .toRadixString(16),
        ),
        radix: 16,
      ),
    );

    return color;
  }
}

class LoadFileImage {
  Image call(String imagePath) =>
      copyRotate(decodeImage(File(imagePath).readAsBytesSync()), 90);
}

class NormalizeCoordinatesRegardingImage {
  final double globalWidth;
  final double globalHeight;

  NormalizeCoordinatesRegardingImage({globalWidth, globalHeight})
      : globalWidth = globalWidth ?? Get.mediaQuery.size.width,
        globalHeight = globalHeight ?? Get.mediaQuery.size.height;

  Tuple2<int, int> call(double globalX, double globalY, Image image) => Tuple2(
        (globalX / globalWidth * image.width).toInt(),
        (globalY / globalHeight * image.height).toInt(),
      );
}
