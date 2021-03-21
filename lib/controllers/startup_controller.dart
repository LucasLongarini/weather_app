import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../services/db_service.dart';
import '../views/home_view/home_view.dart';

class StartupController extends GetxController {

  final _databaseService = GetIt.I.get<DBService>();
  var isInit = false.obs;

  @override
  void onInit() {
    _initalize();
    super.onInit();
  }

  void _initalize() async {
    //TODO load user preferences here
    await _databaseService.initalize();
    isInit.value = true;
  }

}