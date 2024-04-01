import 'package:launch_buddy/src/features/controllers/appController.dart';

import '../../global/controller/connection_controller.dart';
import '../../global/services/barrel.dart';
import 'package:get/get.dart';

class AppDependency {
  static init() async {
    await Get.putAsync(() async {
      final noteService = NoteService();
      await noteService.open();
      return noteService;
    });
    Get.put(MyPrefService());
    Get.put(DioApiService());
    await Get.putAsync(() async {
      final connectTivity = ConnectionController();
      await connectTivity.init();
      return connectTivity;
    });
    await Get.putAsync(() async {
      final appService = AppService();
      await appService.initUserConfig();
      return appService;
    });

    //repos

    //controllers
    await Get.putAsync(() async {
      final appController = AppController();
      await appController.init();
      return appController;
    });
  }
}
