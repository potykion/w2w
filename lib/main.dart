import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:w2w/routes.dart';
import 'package:w2w/theme.dart';

void main() async {
  await Hive.initFlutter();

  await Get.putAsync<Box>(() => Hive.openBox("clothing"), tag: "clothingBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: theme,
        getPages: pages,
        initialRoute: Routes.clothingList,
      );
}
