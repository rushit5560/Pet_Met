import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_pricing_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:sizer/sizer.dart';

class PetTrackerPriceModule extends StatelessWidget {
  PetTrackerPriceModule({
    Key? key,
    //required this.controller,
    required this.index,
  }) : super(key: key);

  //final PetPricingController controller;
  final int index;

  final controller = Get.find<PetPricingController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.345,
          width: controller.size.width * 0.425,
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: controller.size.height * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 18,
                      width: 18,
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.petTrackerList[index].planType!.toUpperCase(),
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
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                Column(
                  children: [
                    PetTrackingDetailsCheckModule(),
                    PetTrackingDetailsCheckModule(),
                    PetTrackingDetailsCheckModule(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (index == 0) {
                          Get.toNamed(AppRouteNames.petMettingInfoRoute);
                        } else if (index == 1) {
                          Get.toNamed(AppRouteNames.petTrackerPricingRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentColor,
                        fixedSize: Size(100, 35),
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
            height: controller.size.height * 0.11,
            width: controller.size.height * 0.11,
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
                    top: 24,
                    child: Text(
                      "₹",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.petTrackerList[index].price
                          .toString()
                          .toUpperCase(),
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 12,
                    child: Text(
                      "/Year",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
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
    this.titleText,
    this.detailsText,
  }) : super(key: key);

  final titleText;
  final detailsText;

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
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
                width: size.width * 0.33,
                child: Text(
                  "With tens of thousands of satisfied clients ",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                    fontSize: 8.sp,
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
