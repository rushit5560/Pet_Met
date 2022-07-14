import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/metting_address_info_controller.dart';
import 'package:pet_met/controllers/pet_pricing_controller.dart';
import 'package:pet_met/controllers/pet_tracker_pricing_controller.dart';
import 'package:pet_met/screens/pet_pricing_screen/pet_pricing_screen_widgets.dart';

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
                                  index: 0,
                                ),
                                const SizedBox(width: 15),
                                PetTrackerPriceModule(
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
