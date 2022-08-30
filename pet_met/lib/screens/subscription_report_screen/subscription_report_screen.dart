import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/subscription_report_screen_controller.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_images.dart';
import 'subscription_report_screen_widgets.dart';

class SubscriptionReportScreen extends StatelessWidget {
  SubscriptionReportScreen({Key? key}) : super(key: key);
  final subscriptionReportScreenController =
      Get.put(SubscriptionReportScreenController());

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
            height: subscriptionReportScreenController.size.height * 0.3,
            width: subscriptionReportScreenController.size.height * 0.3,
            topPad: subscriptionReportScreenController.size.height * 0.28,
            leftPad: -subscriptionReportScreenController.size.width * 0.15,
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  title: "Subscription Report",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Obx(
                    () => subscriptionReportScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SubscriptionOrderListModule(),
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
