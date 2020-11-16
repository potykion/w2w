import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w2w/clothing/domain/models.dart';

part 'repos.freezed.dart';

abstract class BaseClothingRepo {
  Future<List<Clothing>> listClothing();

  Future<Clothing> createClothing(CreateClothingDTO dto);
}

@freezed
abstract class CreateClothingDTO with _$CreateClothingDTO {
  factory CreateClothingDTO({
    String title,
    String type,
    String color,
    List<String> imageUrls,
    List<File> imageFiles,
  }) = _CreateClothingDTO;
}
