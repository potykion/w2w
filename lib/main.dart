import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:w2w/clothing/dependencies/repositories.dart';
import 'package:w2w/routes.dart';
import 'package:w2w/theme.dart';

import 'clothing/dependencies/api_clients.dart';
import 'clothing/domain/use_cases.dart';
import 'clothing/state/controllers.dart';
import 'clothing/ui/pages/add.dart';
import 'clothing/ui/pages/form.dart';
import 'clothing/ui/pages/list.dart';

void main() async {
  await Hive.initFlutter();

  await Get.putAsync<Box>(() => Hive.openBox("clothing"), tag: "clothingBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: theme,
        getPages: [
          GetPage(
              name: Routes.clothingList,
              page: () => ClothingListPage(),
              binding: BindingsBuilder(() {
                Get.put(ClothingRepo(Get.find(tag: "clothingBox")));
                Get.put(ClothingListController(Get.find<ClothingRepo>()));
              })),
          GetPage(
              name: Routes.addClothingChoice,
              page: () => AddClothingChoicePage(),
              binding: BindingsBuilder(() {
                Get.put<LamodaParseApiClient>(FakeLamodaParseApiClient());
                Get.put<LoadLamodaClothing>(LoadLamodaClothing(Get.find<LamodaParseApiClient>()));
              })),
          GetPage(
            name: Routes.clothingForm,
            page: () => ClothingFormPage(),
          ),
        ],
        initialRoute: Routes.clothingList,
      );
}
