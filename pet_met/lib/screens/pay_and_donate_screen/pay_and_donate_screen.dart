import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pay_and_donate_screen_controller.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';

import 'pay_and_donate_screen_widgets.dart';

class PayAndDonateReportScreen extends StatelessWidget {
  PayAndDonateReportScreen({Key? key}) : super(key: key);
  final payAndDonateReportScreenController =
  Get.put(PayAndDonateReportScreenController());

  DarkThemeProvider themeProvider =
  Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(themeProvider.darkTheme
                ? AppImages.backgroundImgDark
                : AppImages.backgroundImgLight),
          ),
          BackGroundLeftShadow(
            height: payAndDonateReportScreenController.size.height * 0.3,
            width: payAndDonateReportScreenController.size.height * 0.3,
            topPad: payAndDonateReportScreenController.size.height * 0.28,
            leftPad: -payAndDonateReportScreenController.size.width * 0.15,
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  title: "Pay/Donate Report",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Obx(
                        () => payAndDonateReportScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : PayAndDonateOrderListModule(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
