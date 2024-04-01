import 'package:flutter/material.dart';
import 'package:launch_buddy/src/features/controllers/appController.dart';
import 'package:launch_buddy/src/features/views/common/home_header.dart';
import 'package:get/get.dart';

import '../../app/app_barrel.dart';
import '../../global/ui/ui_barrel.dart';
import '../../global/ui/widgets/others/containers.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({this.isOld = false, super.key});
  final bool isOld;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Map<String, int> results = {};
  final controller = Get.find<AppController>();
  RxBool isLoading = true.obs;

  @override
  void initState() {
    initres();
    super.initState();
  }

  initres() async {
    isLoading.value = true;
    results = await controller.viewResult(isOld: widget.isOld);
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTextColor,
      body: Ui.padding(
        child: Column(
          children: [
            Ui.boxHeight(24),
            ResultHeader(
              title: widget.isOld ? "Previous Results" : "Current Results",
            ),
            Ui.boxHeight(16),
            Expanded(child: Obx(() {
              return isLoading.value
                  ? Center(
                      child: Text("Loading..."),
                    )
                  : ListView.builder(
                      itemCount: results.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              CurvedContainer(
                                color: AppColors.primaryColor,
                                padding: EdgeInsets.all(16),
                                child: AppText(
                                  (index + 1).toString(),
                                  fontSize: 16,
                                ),
                              ),
                              Ui.boxWidth(16),
                              Expanded(
                                child: CurvedContainer(
                                  color: AppColors.primaryColor,
                                  padding: EdgeInsets.all(16),
                                  child: AppText(
                                    results.keys.toList()[index],
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Ui.boxWidth(16),
                              CurvedContainer(
                                color: AppColors.primaryColor,
                                padding: EdgeInsets.all(16),
                                child: AppText.bold(
                                  results[results.keys.toList()[index]]
                                      .toString(),
                                  color: AppColors.darkTextColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
            })),
            Ui.boxHeight(12),
          ],
        ),
      ),
    );
  }
}
