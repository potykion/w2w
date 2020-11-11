import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'clothing/dependencies/api_clients.dart';
import 'clothing/dependencies/repositories.dart';
import 'clothing/domain/use_cases.dart';
import 'clothing/state/controllers.dart';
import 'clothing/ui/pages/add-image.dart';
import 'clothing/ui/pages/add.dart';
import 'clothing/ui/pages/form.dart';
import 'clothing/ui/pages/list.dart';

abstract class Routes {
  static const clothingList = "/clothing-list";
  static const addClothingChoice = "/add-clothing-choice";
  static const clothingForm = "/clothing-form";
  static const clothingAddImageChoice = "/clothing/add-image-choice";
}

var pages = [
  GetPage(
      name: Routes.clothingList,
      page: () => ClothingListPage(),
      binding: BindingsBuilder(() {
        Get.put(ClothingRepo(Get.find(tag: "clothingBox")));
        Get.put(ClothingListController(Get.find<ClothingRepo>()));

        Get.put(Dio());
        Get.put(RestClient(Get.find<Dio>()));

        Get.put(ClothingFormController());
      })),
  GetPage(
      name: Routes.addClothingChoice,
      page: () => AddClothingChoicePage(),
      binding: BindingsBuilder(() {
        Get.put<LamodaParseApiClient>(FakeLamodaParseApiClient());
        Get.put<LoadLamodaClothing>(
            LoadLamodaClothing(Get.find<LamodaParseApiClient>()));
      })),
  GetPage(
    name: Routes.clothingForm,
    page: () => ClothingFormPage(),
  ),
  GetPage(
    name: Routes.clothingAddImageChoice,
    page: () => AddImageChoicePage(),
  )
];
