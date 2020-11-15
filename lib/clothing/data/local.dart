import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';

class ClothingLocalStorage {
  final Box box;

  ClothingLocalStorage(this.box);

  addClothing(Clothing clothing) => box.add(clothing.toJson());

  listClothing() => box.values.map((json) => Clothing.fromJson(json)).toList();

  // updateClothing(Clothing clothing, int clothingId) =>
  //     box.putAt(clothingId, clothing.toJson());

  findTypeByPattern(String typePattern) => box.values
      .map((clothingJson) => clothingJson["type"] as String)
      .where((type) => type.toLowerCase().contains(typePattern.toLowerCase()))
      .toList();
}
