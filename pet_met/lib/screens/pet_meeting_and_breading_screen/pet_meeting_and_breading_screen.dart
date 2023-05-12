import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import 'pet_meeting_and_breading_screen_widgets.dart';

class PetMeetingAndBreadingScreen extends StatelessWidget {
  PetMeetingAndBreadingScreen({Key? key}) : super(key: key);
  final petMeetingAndBreadingScreenController =
      Get.put(PetMeetingAndBreadingScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              height: petMeetingAndBreadingScreenController.size.height * 0.3,
              width: petMeetingAndBreadingScreenController.size.height * 0.3,
              topPad: petMeetingAndBreadingScreenController.size.height * 0.28,
              leftPad: -petMeetingAndBreadingScreenController.size.width * 0.15,
            ),
            Column(
              children: [
                CustomAppBar(title: "Pet Community"),

                // Body Part
                Expanded(
                  child: Obx(
                    () => petMeetingAndBreadingScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MeetingAndBreadingSearchFieldModule(),
                              SizedBox(
                                  height: petMeetingAndBreadingScreenController
                                          .size.height *
                                      0.002.h),
                              const PetCategoriesTextModule(),
                              SizedBox(
                                  height: petMeetingAndBreadingScreenController
                                          .size.height *
                                      0.002.h),
                              Expanded(
                                child: petMeetingAndBreadingScreenController
                                        .searchList.isNotEmpty
                                    ? PetCategoriesSearchListModule()
                                    : PetCategoriesListModule(),
                              ),
                              SizedBox(
                                  height: petMeetingAndBreadingScreenController
                                          .size.height *
                                      0.002.h),
                              MeetYourLovedOneButtonModule(),
                            ],
                          ).commonAllSidePadding(padding: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
