import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_list_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';

import 'pet_meeting_list_screen_widgets.dart';

class PetMeetingListScreen extends StatelessWidget {
  PetMeetingListScreen({Key? key}) : super(key: key);
  final petMeetingListScreenController =
      Get.put(PetMeetingListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            BackGroundLeftShadow(
              height: petMeetingListScreenController.size.height * 0.3,
              width: petMeetingListScreenController.size.height * 0.3,
              topPad: petMeetingListScreenController.size.height * 0.28,
              leftPad: -petMeetingListScreenController.size.width * 0.15,
            ),
            Column(
              children: [
                // AppBar
                CustomAppBar(
                    title: "Pets",
                    appBarOption: AppBarOption.singleBackButtonOption),

                // Body
                Obx(() => petMeetingListScreenController.isLoading.value
                    ? const CustomAnimationLoader()
                    : Expanded(child: PetMeetingListModule())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
