import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    required this.activePlan,
  }) : super(key: key);

  //final PetPricingController controller;
  final int index;

  final String overviewText;
  final String planDays;
  final String petPriceText;
  final String planType;
  final String activePlan;

  final controller = Get.find<PetPricingController>();

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onTap: () {
        Get.to(
              () => PetTrackerPricingScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500),
          arguments: [
            controller.planData[index].id,
          controller.planData[index].palnactive
          ],
        );
      },
      child: Stack(
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

                          controller.selectedPlanId = controller.planData[index].id;
                          controller.selectedPlanPrice = controller.planData[index].rs;
                          controller.selectedPlanOverview = controller.planData[index].overview;
                          controller.selectedPlanName = controller.planData[index].name;
                          /*log('selectedPlanId : ${controller.selectedPlanId}');
                          log('selectedPlanPrice : ${controller.selectedPlanPrice}');
                          log('selectedPlanOverview : ${controller.selectedPlanOverview}');
                          log('selectedPlanName : ${controller.selectedPlanName}');*/

                          if(controller.planData[index].palnactive == "true") {
                            Fluttertoast.showToast(msg: 'Selected plan already activated.');
                          } else {
                            controller.openCheckout();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.accentColor,
                          fixedSize: Size(Get.size.width * 0.32, 35),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            controller.planData[index].palnactive == "true"
                                ? "Activated"
                                : "Buy",
                            /*controller.planData[index].isActive
                                    .toString()
                                    .contains("0")
                                ? "Buy"
                                : "Purchased",*/
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.accentColor
                                  : AppColors.whiteColor,
                              fontSize: 12.sp,
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
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15, top: 20),
                    //     child: Text(
                    //       "₹",
                    //       style: TextStyle(
                    //         color: AppColors.whiteColor,
                    //         fontSize: 13.sp,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "₹ " + petPriceText.toString(),
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          // fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
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
      ),
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
