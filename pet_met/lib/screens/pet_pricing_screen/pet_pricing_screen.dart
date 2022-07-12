import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/metting_address_info_controller.dart';
import 'package:pet_met/controllers/pet_pricing_controller.dart';
import 'package:pet_met/controllers/pet_tracker_pricing_controller.dart';

import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';

class PetPricingScreen extends StatelessWidget {
  PetPricingScreen({Key? key}) : super(key: key);
  final controller = Get.put(PetPricingController());

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
                  title: "Pet Tracker",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          // const SizedBox(height: 10),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Pet Tracker",
                          //       style: TextStyle(
                          //         color: AppColors.accentTextColor,
                          //         fontSize: 17.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: controller.size.height * 0.25),
                          Container(
                            height: controller.size.height * 0.4,
                            width: double.infinity,
                            child: Row(
                              children: [
                                PetTrackerPriceModule(
                                  controller: controller,
                                  index: 0,
                                ),
                                SizedBox(width: 15),
                                PetTrackerPriceModule(
                                  controller: controller,
                                  index: 1,
                                ),
                              ],
                            ),
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

// class PetTrackerPlanListModule extends StatelessWidget {
//   PetTrackerPlanListModule({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);
//   final PetPricingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: controller.size.height * 0.4,
//       width: double.infinity,
//       child: ListView.separated(
//         itemCount: controller.petTrackerList.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return PetTrackerPriceModule(
//             controller: controller,
//             index: index,
//           );
//         },
//         separatorBuilder: (ctx, ind) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
// }

class PetTrackerPriceModule extends StatelessWidget {
  const PetTrackerPriceModule({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final PetPricingController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.345,
          width: controller.size.width * 0.425,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
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
                    color: AppColors.greyTextColor,
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
