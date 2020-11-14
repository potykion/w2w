import 'dart:io';

import 'package:hive/hive.dart';
import 'package:w2w/clothing/dependencies/api_clients.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/state/view_models.dart';

class ClothingStorage {
  final Box box;

  ClothingStorage(this.box);

  addClothing(Clothing clothing) => box.add(clothing.toJson());

  listClothing() => box.values.map((json) => Clothing.fromJson(json)).toList();

  updateClothing(Clothing clothing, int clothingId) =>
      box.putAt(clothingId, clothing.toJson());

  findTypeByPattern(String typePattern) => box.values
      .map((clothingJson) => clothingJson["type"] as String)
      .where((type) => type.toLowerCase().contains(typePattern.toLowerCase()))
      .toList();
}

/// Абстрагирует взаимодействие с сервом
class ClothingServer {
  final RestClient clothingRestClient;

  ClothingServer(this.clothingRestClient);

  /// Создает шмотку на серве
  Future<Clothing> create(ClothingFormVM vm) async =>
      await clothingRestClient.createClothing(
        vm.title,
        vm.type,
        vm.color,
        vm.images.where((image) => image is String).toList(),
        vm.images.where((image) => image is File).toList(),
      );
}
