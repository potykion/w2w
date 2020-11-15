import 'dart:io';

import 'package:w2w/clothing/domain/models.dart';

abstract class BaseClothingRepo {
  Future<List<Clothing>> listClothing();

  Future<Clothing> createClothing(CreateClothingDTO dto);
}

class CreateClothingDTO {
  String title;
  String type;
  String color;
  List<String> imageUrls;
  List<File> imageFiles;

  CreateClothingDTO({
    this.title,
    this.type,
    this.color,
    this.imageUrls,
    this.imageFiles,
  });
}
