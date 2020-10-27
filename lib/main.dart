import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/theme.dart';

import 'clothing/dependencies/api_clients.dart';
import 'clothing/domain/use_cases.dart';
import 'clothing/ui/pages/add.dart';
import 'clothing/ui/pages/form.dart';
import 'clothing/ui/pages/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: theme,
        routes: {
          "/": (_) => ClothingListPage(),
          "/add-clothing-choice": (_) => AddClothingChoicePage(),
          "/clothing-form": (_) => ClothingFormPage(),
        },
        initialRoute: "/",
        initialBinding: BindingsBuilder(() {
          Get.put<LamodaParseApiClient>(FakeLamodaParseApiClient());
          Get.create(
              () => LoadLamodaClothing(Get.find<LamodaParseApiClient>()));
        }),
      );
}
