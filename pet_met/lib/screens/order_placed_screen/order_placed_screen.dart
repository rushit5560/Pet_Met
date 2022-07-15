import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/order_placed_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:sizer/sizer.dart';

import '../../utils/common_widgets/background_widgets.dart';

class OrderPlacedScreen extends StatelessWidget {
  OrderPlacedScreen({Key? key}) : super(key: key);

  final controller = Get.put(OrderPlacedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.35,
              width: controller.size.height * 0.35,
              topPad: controller.size.height * 0.02,
              leftPad: -controller.size.width * 0.02,
            ),
            BackGroundLeftShadow(
              height: controller.size.height * 0.25,
              width: controller.size.height * 0.25,
              topPad: controller.size.height * 0.72,
              leftPad: -controller.size.width * 0.1,
            ),
            BackGroundRightShadow(
              height: controller.size.height * 0.25,
              width: controller.size.height * 0.25,
              topPad: controller.size.height * 0.45,
              rightPad: -controller.size.width * 0.15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 52.w),
                    Image.asset(
                      AppImages.heartImg,
                      height: 10.h,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Image.asset(
                      AppImages.dogSittingImg,
                      height: 28.h,
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Your Shopping Orders has Been Placed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        height: 1.4),
                  ),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Thank You for your Order. Your Order Has be proccess. You can check the proccess on the status order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        height: 1.4),
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
