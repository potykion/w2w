import 'package:get/get.dart';
import '../../domain/models.dart';
import 'controllers.dart';
import '../../../routes.dart';

class ClothingWriteVM {
  int id;
  String title;
  String type;
  String color;
  List<dynamic> images;

  ClothingWriteVM({
    this.id,
    this.title = "",
    this.type = "",
    this.color = "ffffff",
    this.images = const [],
  });

  factory ClothingWriteVM.fromClothing(Clothing clothing) => ClothingWriteVM(
        title: clothing.title,
        type: clothing.type,
        color: clothing.color,
        images: clothing.images,
      );

  save() async {
    await Get.find<ClothingController>().createClothing(this);
    Get.toNamed(Routes.clothingList);
  }
}
