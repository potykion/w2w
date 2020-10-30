import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';

class ClothingRepo {
  final Box box;

  ClothingRepo(this.box);

  addClothing(Clothing clothing) => box.add(clothing.toJson());

  listClothing() => box.values.map((json) => Clothing.fromJson(json)).toList();
}