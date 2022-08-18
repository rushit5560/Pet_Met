// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:pet_met/controllers/pet_care_info_controller.dart';
import 'package:pet_met/controllers/register_controller.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/common_widgets/custom_light_passfield.dart';
import '../../utils/common_widgets/custom_light_textfield.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';
import 'pet_care_info_screen_widgets.dart';

class PetCareInfoScreen extends StatelessWidget {
  PetCareInfoScreen({Key? key}) : super(key: key);

  final controller = Get.put(PetCareInfoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.25,
            ),
            BackGroundRightShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.45,
              rightPad: -controller.size.width * 0.25,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Pet Care",
                ),

                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 15),
                              child: SizedBox(
                                height: 86.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 1.h),
                                    // Text(
                                    //   "Pet Care",
                                    //   style: TextStyle(
                                    //     color: AppColors.accentTextColor,
                                    //     fontSize: 20.sp,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    SizedBox(height: 1.h),
                                    Expanded(child: PetCareListModule()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),

                // const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
