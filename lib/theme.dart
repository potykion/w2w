import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Color(0xff2ec4b6),
  canvasColor: Colors.white,
  cursorColor: Color(0xff2ec4b6),
  textSelectionHandleColor: Color(0xff2ec4b6),
  textTheme: TextTheme(
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color(0xff12130f),
      ),
      button: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
);
