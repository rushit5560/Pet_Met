import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/metting_address_info_controller.dart';
import 'package:pet_met/controllers/pet_tracker_pricing_controller.dart';

import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
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
                const CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          // const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Pet Tracker Pricing",
                                style: TextStyle(
                                  color: AppColors.accentTextColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: controller.size.height * 0.25),
                          Container(
                            height: controller.size.height * 0.435,
                            width: double.infinity,
                            child:
                                PetTrackerPriceModule(controller: controller),
                          ),
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

class PetTrackerPriceModule extends StatelessWidget {
  const PetTrackerPriceModule({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PetTrackerPricingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.38,
          width: controller.size.width * 0.75,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: controller.size.height * 0.05),
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
                      "Premium",
                      style: TextStyle(
                        color: AppColors.accentTextColor,
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
                SizedBox(height: 12),
                Column(
                  children: [
                    PetTrackingDetailsCheckModule(),
                    PetTrackingDetailsCheckModule(),
                    PetTrackingDetailsCheckModule(),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.accentColor,
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
                            color: AppColors.whiteColor,
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
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
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
                    left: 6,
                    top: 25,
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
                      "1599",
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
