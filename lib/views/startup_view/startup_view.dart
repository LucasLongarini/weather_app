import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/startup_controller.dart';
import '../home_view/home_view.dart';

class StartupView extends StatelessWidget {
  final StartupController controller = Get.put(StartupController());

  @override
  Widget build(BuildContext context) {
    controller.isInit.listen((value) {
      if (value) Get.to(() => HomeView());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            Text("Preparing App"),
          ],
        ),
      ),
    );
  }
}
