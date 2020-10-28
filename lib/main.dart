import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:w2w/theme.dart';

import 'clothing/dependencies/api_clients.dart';
import 'clothing/domain/use_cases.dart';
import 'clothing/state/controllers.dart';
import 'clothing/ui/pages/add.dart';
import 'clothing/ui/pages/form.dart';
import 'clothing/ui/pages/list.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: theme,
        getPages: [
          GetPage(
            name: "/clothing-list",
            page: () => ClothingListPage(),
            binding: BindingsBuilder(() {
              Get.put(ClothingListController(Get.find(tag: "clothingBox")));
            })
          ),
          GetPage(
            name: "/add-clothing-choice",
            page: () => AddClothingChoicePage(),
          ),
          GetPage(name: "/clothing-form", page: () => ClothingFormPage()),
        ],
        initialRoute: "/clothing-list",
        initialBinding: BindingsBuilder(() {
          Get.put<LamodaParseApiClient>(FakeLamodaParseApiClient());
          Get.create(
              () => LoadLamodaClothing(Get.find<LamodaParseApiClient>()));
          Get.putAsync(() async => await Hive.openBox("clothing"), tag: "clothingBox");
        }),
      );
}
