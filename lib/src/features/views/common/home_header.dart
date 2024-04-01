import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:launch_buddy/src/features/controllers/appController.dart';
import 'package:launch_buddy/src/features/views/settings.dart';
import 'package:launch_buddy/src/global/ui/ui_barrel.dart';
import 'package:launch_buddy/src/src_barrel.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key});
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 3,
            child: AppText.bold("Rank your top 5 lunch spots",
                fontSize: 32, color: AppColors.primaryColor)),
        AppIconButton(Iconsax.setting_2_outline, () {
          //controller.saveNote();
          Get.to(SettingsPage());
        }),
        // AppIconButton(Iconsax.profile_circle_outline, () async {
        //   await controller.signIn();
        //   Ui.showInfo("Signed In Successfully");
        // }),
      ],
    );
  }
}

class ResultHeader extends StatelessWidget {
  const ResultHeader({this.title = "Results", super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 3,
            child: AppText.bold(title,
                fontSize: 32, color: AppColors.primaryColor)),
        AppIconButton(Iconsax.back_square_outline, () {
          //controller.saveNote();
          Get.back();
        }),
      ],
    );
  }
}
