import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/metting_address_info_controller.dart';
import 'package:pet_met/controllers/pet_tracker_pricing_controller.dart';

import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';

class PetTrackerPricingScreen extends StatelessWidget {
  PetTrackerPricingScreen({Key? key}) : super(key: key);
  final controller = Get.put(PetTrackerPricingController());

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
                  title: "Pet Tracker Pricing",
                ),
                Obx(
                  () => Expanded(
                    child: controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: controller.size.height * 0.25),
                                  Container(
                                    height: controller.size.height * 0.45,
                                    width: double.infinity,
                                    child: PetTrackerPriceModule(
                                      controller: controller,
                                      planTypeText:
                                          controller.planDetailsData.name!,
                                    ),
                                  ),
                                ],
                              ),
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

class PetTrackerPriceModule extends StatelessWidget {
  const PetTrackerPriceModule({
    Key? key,
    required this.controller,
    required this.planTypeText,
  }) : super(key: key);

  final PetTrackerPricingController controller;
  final String planTypeText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.4,
          width: controller.size.width * 0.8,
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: controller.size.height * 0.09),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      planTypeText.toUpperCase(),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 20,
                      color: AppColors.blackColor,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    PetTrackingDetailsCheckModule(
                      detailsText: controller.planDetailsData.overview,
                    ),
                    PetTrackingDetailsCheckModule(
                      detailsText:
                          "valid for ${controller.planDetailsData.overview} days",
                    ),
                    const PetTrackingDetailsCheckModule(),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentColor,
                        fixedSize: const Size(100, 35),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.accentColor
                                : AppColors.whiteColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: controller.size.height * 0.12,
            width: controller.size.height * 0.12,
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 12,
                    top: 25,
                    child: Text(
                      "₹",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, top: 8),
                      child: Text(
                        controller.planDetailsData.rs.toString(),
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PetTrackingDetailsCheckModule extends StatelessWidget {
  const PetTrackingDetailsCheckModule({
    Key? key,
    this.detailsText,
  }) : super(key: key);

  final String? detailsText;

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
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
              Container(
                width: size.width * 0.58,
                child: Text(
                  detailsText == null
                      ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                      : detailsText!,
                  style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontSize: 8.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
