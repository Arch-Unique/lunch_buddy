import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:launch_buddy/src/features/controllers/appController.dart';
import 'package:launch_buddy/src/features/views/common/home_header.dart';
import 'package:launch_buddy/src/features/views/result_page.dart';
import 'package:launch_buddy/src/global/ui/widgets/fields/custom_textfield.dart';

import '../../global/ui/ui_barrel.dart';
import '../../global/ui/widgets/others/containers.dart';
import '../../src_barrel.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = Get.find<AppController>();
  final tectec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkTextColor,
        body: Ui.padding(
          child: Column(
            children: [
              Ui.boxHeight(24),
              ResultHeader(
                title: "Settings",
              ),
              Ui.boxHeight(16),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
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
                              IconButton(
                                  onPressed: () async {
                                    Ui.showInfo("Removing item...");
                                    await controller.removeEatery(
                                        [controller.eateries[index]]);
                                    Ui.showInfo("Done");
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.red,
                                  )),
                            ],
                          ),
                        );
                      });
                }),
              ),
              Ui.boxHeight(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: CustomTextField(
                    "Eatery",
                    tectec,
                    hasBottomPadding: false,
                  )),
                  Ui.boxWidth(16),
                  AppIconButton(Iconsax.add_circle_outline, () async {
                    Ui.showInfo("Adding");
                    await controller.addNewEatery([tectec.text]);
                    tectec.clear();
                    Ui.showInfo("Done");
                  }),
                ],
              )
            ],
          ),
        ));
  }
}
