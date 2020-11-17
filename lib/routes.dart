import 'package:get/get.dart';
import 'clothing/presentation/pages/add.dart';
import 'clothing/presentation/pages/form.dart';
import 'clothing/presentation/pages/list.dart';

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
  ),
  GetPage(
    name: Routes.addClothingChoice,
    page: () => AddClothingChoicePage(),
  ),
  GetPage(
    name: Routes.clothingForm,
    page: () => ClothingFormPage(),
  ),
];
