import 'package:flutter/material.dart';
import 'views/home_view/home_view.dart';
import 'config/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      home: HomeView(),
    );
  }
}
