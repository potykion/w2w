import 'package:flutter/material.dart';
import 'package:w2w/pages.dart';
import 'package:w2w/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        routes: {
          "/": (_) => MyHomePage(),
          "/add-clothing-choice": (_) => AddClothingChoicePage(),
          "/add-clothing": (_) => AddClothingPage(),
        },
        initialRoute: "/",
      );
}
