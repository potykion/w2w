import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/routes.dart';

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

  save() {
    // todo отправить на серв
    Get.toNamed(Routes.clothingList);
  }
}
