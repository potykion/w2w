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
}
