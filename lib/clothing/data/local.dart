import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/repos.dart';

class ClothingLocalStorage {
  final Box box;

  ClothingLocalStorage(this.box);

  addClothing(Clothing clothing) => box.add(clothing.toJson());

  listClothing() => box.values.map((json) => Clothing.fromJson(json)).toList();

  // updateClothing(Clothing clothing, int clothingId) =>
  //     box.putAt(clothingId, clothing.toJson());

  List<String> findTypeByPattern(String typePattern) => box.values
      .map((clothingJson) => clothingJson["type"] as String)
      .where((type) => type.toLowerCase().contains(typePattern.toLowerCase()))
      .toSet()
      .toList();
}

class ClothingImageFilePicker implements BaseClothingImageFilePicker {
  Future<File> call() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) {
      return null;
    }

    var imageFile = File(result.files.single.path);
    return imageFile;
  }
}
