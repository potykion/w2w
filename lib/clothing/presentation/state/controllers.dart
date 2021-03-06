import 'dart:io';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/repos.dart';

import 'view_models.dart';

class ClothingController extends GetxController {
  final BaseClothingRepo repo;

  RxList<Clothing> clothingList = List<Clothing>().obs;

  Map<String, List<Clothing>> get groupedClothing =>
      groupBy(clothingList, (Clothing clothing) => clothing.type);

  ClothingController(this.repo);

  @override
  void onInit() {
    list();
    super.onInit();
  }

  list() async {
    clothingList.value = await repo.listClothing();
  }

  create(ClothingWriteVM vm) async {
    var clothing = await repo.createClothing(
      CreateClothingDTO(
          title: vm.title,
          type: vm.type,
          color: vm.color,
          imageUrls: List.castFrom<dynamic, String>(vm.images.where((image) => image is String).toList()),
          // imageUrls: vm.images.where((image) => image is String).toList(),
          imageFiles: List.castFrom<dynamic, File>(vm.images.where((image) => image is File).toList())),
    );

    clothingList.add(clothing);
  }
}
