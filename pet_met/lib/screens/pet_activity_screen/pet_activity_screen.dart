import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_activity_controller.dart';
import 'package:pet_met/controllers/pet_trainers_details_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

import '../../utils/common_widgets/background_widgets.dart';
import 'pet_activity_screen_widgets.dart';

class PetActivityScreen extends StatelessWidget {
  PetActivityScreen({Key? key}) : super(key: key);
  final controller = Get.put(PetActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.38,
              leftPad: -controller.size.width * 0.15,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.tealBackgroundImg),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/pets_playing.png",
                          width: controller.size.width * 0.85,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Pet Activity",
                          style: TextStyle(
                            color: AppColors.accentTextColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),

                        Container(
                          width: double.infinity,
                          height: controller.size.height * 0.35,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeBoxColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: const [
                              PetTrackingDetailsCheckModule(
                                titleText: "Daily Distance Travel By Pet : ",
                                detailsText: "10Kms",
                              ),
                              PetTrackingDetailsCheckModule(
                                titleText: "Step Count",
                                detailsText: "5000 steps",
                              ),
                            ],
                          ),
                        )

                        // PetTrainerBannerImageModule(),
                        // SizedBox(height: controller.size.height * 0.005.w),
                        // PetTrainerNameAndSocialMediaButtonModule(),
                        // SizedBox(height: controller.size.height * 0.005.w),
                        // PetTrainerPlaceTimePaymentModule(),
                        // SizedBox(height: controller.size.height * 0.005.w),
                        // PetTrainerOverViewModule(),
                      ],
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

class PetTrackingDetailsCheckModule extends StatelessWidget {
  const PetTrackingDetailsCheckModule({
    Key? key,
    this.titleText,
    this.detailsText,
  }) : super(key: key);

  final titleText;
  final detailsText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18,
            width: 18,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.accentTextColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.whiteColor,
              size: 12,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                detailsText,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
