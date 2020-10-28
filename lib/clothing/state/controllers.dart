import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';

class ClothingListController extends GetxController {
  final Box clothingBox;

  RxList<Clothing> clothing = List<Clothing>().obs;

  ClothingListController(this.clothingBox);

  @override
  void onInit() {

    clothing = clothingBox.values.map((json) => Clothing.fromJson(json)).toList();

    super.onInit();
  }
}
