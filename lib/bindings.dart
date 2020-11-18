import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'clothing/data/local.dart';
import 'clothing/data/remote.dart';
import 'clothing/data/repos.dart';
import 'clothing/domain/repos.dart';
import 'clothing/presentation/state/controllers.dart';

class ClothingBinding implements Bindings {
  const ClothingBinding();

  @override
  void dependencies() {
    Get.put(ClothingLocalStorage(Get.find(tag: "clothingBox")));

    Get.put(Dio());
    Get.put(ClothingRestClient(Get.find<Dio>()));

    Get.put<BaseClothingRepo>(
      ClothingRepo(
        clothingRestClient: Get.find<ClothingRestClient>(),
        clothingLocalStorage: Get.find<ClothingLocalStorage>(),
      ),
    );
    Get.put<BaseClothingImageFilePicker>(ClothingImageFilePicker());

    Get.put(ClothingController(Get.find<BaseClothingRepo>()));
  }
}
