import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_pricing_controller.dart';
import 'package:pet_met/screens/pet_tracker_pricing_screen/pet_tracker_pricing_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class PetTrackerPriceModule extends StatelessWidget {
  PetTrackerPriceModule({
    Key? key,
    //required this.controller,
    required this.index,
    required this.overviewText,
    required this.petPriceText,
    required this.planDays,
    required this.planType,
  }) : super(key: key);

  //final PetPricingController controller;
  final int index;

  final String overviewText;
  final String planDays;
  final String petPriceText;
  final String planType;

  final controller = Get.find<PetPricingController>();

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.44,
          width: controller.size.width * 0.55,
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: controller.size.height * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row(
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 5),
                //       height: 18,
                //       width: 18,
                //       child: const Center(
                //         child: Icon(
                //           Icons.check,
                //           color: AppColors.whiteColor,
                //           size: 12,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      planType,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
                const SizedBox(height: 8),
                SizedBox(
                  height: controller.size.height * 0.2,
                  width: controller.size.width * 0.5,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        PetTrackingDetailsCheckModule(
                            detailsText: overviewText),
                        PetTrackingDetailsCheckModule(
                          detailsText: "Valid for $planDays days",
                        ),
                        PetTrackingDetailsCheckModule(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        /*if (index == 0) {
                          Get.to(()=>
                          PetTrackerPricingScreen(),
                            transition: Transition.native,
                            duration: const Duration(milliseconds: 500),
                            arguments: controller.planData[index].id,
                          );
                        } else if (index == 1) {
                          Get.to(()=>
                            PetTrackerPricingScreen(),
                            transition: Transition.native,
                            duration: const Duration(milliseconds: 500),
                            arguments: controller.planData[index].id,
                          );
                        }*/
                        Get.to(
                          () => PetTrackerPricingScreen(),
                          transition: Transition.native,
                          duration: const Duration(milliseconds: 500),
                          arguments: controller.planData[index].id,
                        );
                      },
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
                          controller.status.value == false ?  "Buy" : "Purchased",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.accentColor
                                : AppColors.whiteColor,
                            fontSize: 13.sp,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "₹",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        petPriceText.toString().toUpperCase(),
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 10),
                  //     child: Text(
                  //       planDays == 30 ? "Monthly" : planDays,
                  //       style: TextStyle(
                  //         color: AppColors.whiteColor,
                  //         fontSize: 14.sp,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 15,
                  //   right: 12,
                  //   child: Text(
                  //     "/Year",
                  //     style: TextStyle(
                  //       color: AppColors.whiteColor,
                  //       fontSize: 8.sp,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
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
  PetTrackingDetailsCheckModule({
    Key? key,
    this.detailsText,
  }) : super(key: key);

  final detailsText;

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
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
          Container(
            width: size.width * 0.35,
            child: Text(
              detailsText == null
                  ? "With tens of thousands of satisfied clients "
                  : detailsText,
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 9.5.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
