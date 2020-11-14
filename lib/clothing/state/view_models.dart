import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/state/controllers.dart';
import 'package:w2w/routes.dart';
import '../dependencies/repositories.dart';

class ClothingFormVM {
  int id;
  String title;
  String type;
  String color;
  List<dynamic> images;

  ClothingFormVM({
    this.id,
    this.title = "",
    this.type = "",
    this.color = "ffffff",
    this.images = const [],
  });

  factory ClothingFormVM.fromClothing(Clothing clothing) => ClothingFormVM(
        // todo
        //  id: clothing.id,
        title: clothing.title,
        type: clothing.type,
        color: clothing.color,
        images: clothing.images,
      );

  save() async {
    var clothing = await Get.find<ClothingServer>().create(this);
    Get.find<ClothingListController>().addClothing(clothing);
    Get.toNamed(Routes.clothingList);
  }
}
