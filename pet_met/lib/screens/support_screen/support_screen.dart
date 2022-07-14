import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/register_controller.dart';
import 'package:pet_met/controllers/support_controller.dart';
import 'package:pet_met/utils/app_images.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/common_widgets/custom_light_passfield.dart';
import '../../utils/common_widgets/custom_light_textfield.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);

  final controller = Get.put(SupportController());

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
              child: Image.asset(AppImages.tealBackgroundImg),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 20, left: 20, right: 20, bottom: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Image.asset(
                //           "assets/icons/left_back_arrow.png",
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       const SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 4.h),
                          Image.asset(
                            themeProvider.darkTheme
                                ? "assets/images/women_objects_dark.png"
                                : "assets/images/women_objects_light.png",
                            width: 80.w,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Support",
                            style: TextStyle(
                              color: AppColors.accentTextColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          contactInfoRow(
                            imageAsset: "assets/icons/email_icon.png",
                            textdata: "Support@petomate.com",
                          ),
                          SizedBox(height: 2.4.h),
                          contactInfoRow(
                            imageAsset: "assets/icons/call_icon.png",
                            textdata: "+91 98725 25571",
                          ),
                          SizedBox(height: 2.4.h),
                          contactInfoRow(
                            imageAsset: "assets/icons/whatsapp_icon.png",
                            textdata: "+91 98725 12345",
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

  Widget contactInfoRow({
    final imageAsset,
    final textdata,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageAsset,
          height: 20,
          color: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.blackTextColor,
        ),
        SizedBox(width: 15),
        Text(
          textdata,
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
