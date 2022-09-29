import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import 'pet_meeting_details_screen_widgets.dart';

class PetMeetingDetailsScreen extends StatelessWidget {
  PetMeetingDetailsScreen({Key? key}) : super(key: key);
  final petMeetingDetailsScreenController =
      Get.put(PetMeetingDetailsScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

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
              height: petMeetingDetailsScreenController.size.height * 0.3,
              width: petMeetingDetailsScreenController.size.height * 0.3,
              topPad: petMeetingDetailsScreenController.size.height * 0.28,
              leftPad: -petMeetingDetailsScreenController.size.width * 0.15,
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: 'Pet Details',
                ),
                Expanded(
                  child: Obx(
                    () => petMeetingDetailsScreenController.isLoading.value
                        ? CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PetMeetingDetailsBannerImageModule(),
                                SizedBox(
                                    height: petMeetingDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                PetNameAndSocialMediaButtonModule(),
                                SizedBox(
                                    height: petMeetingDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                PetPlaceTimePaymentModule(),
                                SizedBox(
                                    height: petMeetingDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                // CallUsForMeetupModule(),
                                /*SizedBox(
                                    height: petMeetingDetailsScreenController
                                            .size.height *
                                        0.005.w),*/
                                PetMeetingOverViewModule(),
                                SizedBox(
                                    height: petMeetingDetailsScreenController
                                            .size.height *
                                        0.005.w),
                              ],
                            ),
                          ),
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
