import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/payment_failed_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/common_widgets/background_widgets.dart';



class PaymentFailedScreen extends StatelessWidget {
  PaymentFailedScreen({Key? key}) : super(key: key);

  final controller = Get.put(PaymentFailedController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
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
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.sadEmojiImg,
                    height: 15.h,
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Sorry, Payment failed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          height: 1.4),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Please try a different payment method.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
