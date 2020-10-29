import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';

class ClothingListController extends GetxController {
  final Box clothingBox;

  RxList<Clothing> clothingList = List<Clothing>().obs;

  ClothingListController(this.clothingBox);

  @override
  void onInit() {
    clothingList.value =
        clothingBox.values.map((json) => Clothing.fromJson(json)).toList();

    super.onInit();
  }
}
