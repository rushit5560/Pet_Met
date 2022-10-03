import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/meeting_orders_screen_controller.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_images.dart';
import 'meeting_orders_screen_widgets.dart';



class MeetingOrdersScreen extends StatelessWidget {
  MeetingOrdersScreen({Key? key}) : super(key: key);
  final meetingOrdersScreenController =
      Get.put(MeetingOrdersScreenController());
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
            height: meetingOrdersScreenController.size.height * 0.3,
            width: meetingOrdersScreenController.size.height * 0.3,
            topPad: meetingOrdersScreenController.size.height * 0.28,
            leftPad: -meetingOrdersScreenController.size.width * 0.15,
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  title: "Meetings",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Obx(
                    () => meetingOrdersScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : MeetingOrderListModule(),
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
