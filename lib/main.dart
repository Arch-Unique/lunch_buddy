import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:launch_buddy/src/features/controllers/appController.dart';
import 'package:launch_buddy/src/features/views/common/loading_overlay.dart';
import 'package:launch_buddy/src/src_barrel.dart';

import 'src/features/views/homepage.dart';
import 'src/global/services/barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await GetStorage.init();
  await AppDependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<AppController>();
    return GetMaterialApp(
      title: 'Lunch Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: Assets.appFontFamily,
      ),
      home: HomePage(),
      // home: Obx(() {
      //   return LoadingOverlay(
      //       isLoading: controller.isLoading.value, child: HomePage());
      // }),
    );
  }
}
