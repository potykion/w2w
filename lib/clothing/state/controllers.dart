import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/dependencies/repositories.dart';
import 'package:w2w/clothing/domain/models.dart';

class ClothingListController extends GetxController {
  final ClothingRepo repo;

  RxList<Clothing> clothingList = List<Clothing>().obs;

  Map<String, List<Clothing>> get groupedClothing =>
      groupBy(clothingList, (Clothing clothing) => clothing.type);

  ClothingListController(this.repo);

  @override
  void onInit() {
    clothingList.value = repo.listClothing();

    super.onInit();
  }

  addClothing(Clothing clothing) {
    repo.addClothing(clothing);
    clothingList.add(clothing);
  }

  updateClothing(Clothing clothing, int clothingId) {
    repo.updateClothing(clothing, clothingId);
    clothingList[clothingId] = clothing;
  }
}

class ClothingFormController extends GetxController {
  static int unsetIndex = -1;

  Rx<Clothing> clothing = Clothing().obs;
  RxInt clothingId = unsetIndex.obs;

  setClothing(Clothing clothing) {
    this.clothing.value = clothing;
  }

  setClothingId(int clothingId) {
    this.clothingId.value = clothingId;
  }

  reset() {
    this.clothing.value = Clothing();
    this.clothingId.value = unsetIndex;
  }
}
