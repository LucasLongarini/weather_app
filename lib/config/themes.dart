import 'package:flutter/material.dart';

class Themes {
  static TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 96.0, fontWeight: FontWeight.w300, height: 1),
    headline2: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w300, height: 1),
    headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, height: 1),
    headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, height: 1),
    headline5: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, height: 1),
  );

  static Color boldText = Color(0xff272727);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Palanquin',
    textTheme: _textTheme,
  );
}
