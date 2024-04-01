import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:launch_buddy/src/features/controllers/appController.dart';
import 'package:launch_buddy/src/features/views/common/home_header.dart';
import 'package:launch_buddy/src/features/views/common/rank_selector.dart';
import 'package:launch_buddy/src/features/views/result_page.dart';
import 'package:launch_buddy/src/global/ui/ui_barrel.dart';
import 'package:launch_buddy/src/global/ui/widgets/others/containers.dart';
import 'package:launch_buddy/src/src_barrel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<AppController>();

  List<String> selectedEateries = ["", "", "", "", ""];
  RxBool isLoading = true.obs;

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  checkUser() async {
    isLoading.value = true;
    await controller.getAllEateries();
    // final hasUser = await controller.checkIfUservoted();
    // if (hasUser) {
    //   if (controller.uservotes.value < 2) {
    //     Get.to(ResultPage());
    //   }
    // }
    Ui.showInfo("Done");
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTextColor,
      body: Ui.padding(
          padding: 16,
          child: Column(
            children: [
              Ui.boxHeight(24),
              HeaderWidget(),
              Ui.boxHeight(16),
              Expanded(child: Obx(() {
                return isLoading.value
                    ? Center(
                        child: Text("Loading..."),
                      )
                    : ListView.builder(
                        itemCount: controller.eateries.length,
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
                                      controller.eateries[index],
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Ui.boxWidth(16),
                                CurvedContainer(
                                  color: AppColors.primaryColor,
                                  padding: EdgeInsets.all(16),
                                  onPressed: () {
                                    selecteatery(index);
                                  },
                                  child: AppText.bold(
                                    (selectedEateries.contains(
                                                controller.eateries[index])
                                            ? 5 -
                                                selectedEateries.indexOf(
                                                    controller.eateries[index])
                                            : 0)
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppIconButton(
                    Iconsax.graph_outline,
                    () async {
                      Get.to(ResultPage(
                        isOld: true,
                      ));
                    },
                    color: AppColors.borderColor,
                  ),
                  AppIconButton(
                    Iconsax.save_add_outline,
                    () async {
                      if (selectedEateries.contains("")) {
                        Ui.showError("Please rank 5 eateries");
                      } else {
                        Ui.showInfo("Saving");
                        await controller.submitResult(selectedEateries);
                        Ui.showInfo("Done");
                        Get.to(ResultPage());
                      }
                    },
                    color: AppColors.green,
                  ),
                  AppIconButton(
                    Iconsax.stacks_stx_outline,
                    () async {
                      Get.to(ResultPage());
                    },
                    color: AppColors.borderColor,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  selecteatery(int i) {
    Get.bottomSheet(RankSelector(
      onPressed: (j) {
        Get.back();
        setState(() {
          if (selectedEateries.contains(controller.eateries[i])) {
            final k = selectedEateries.indexOf(controller.eateries[i]);
            selectedEateries[k] = "";
          }
          selectedEateries[j] = controller.eateries[i];
        });
      },
    ),
        backgroundColor: AppColors.primaryColorBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))));
  }
}
