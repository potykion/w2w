import 'package:flutter/material.dart';
import 'package:w2w/theme.dart';

import 'clothing/ui/pages/add.dart';
import 'clothing/ui/pages/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        routes: {
          "/": (_) => ClothingListPage(),
          "/add-clothing-choice": (_) => AddClothingChoicePage(),
          "/add-clothing": (_) => AddClothingPage(),
        },
        initialRoute: "/",
      );
}
