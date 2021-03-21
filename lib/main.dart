import 'package:flutter/material.dart';
import 'views/startup_view/startup_view.dart';
import 'package:get/get.dart';

import 'services/locator.dart';
import 'config/themes.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      home: StartupView(),
    );
  }
}
