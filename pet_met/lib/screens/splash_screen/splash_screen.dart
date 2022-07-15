import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/splash_controller.dart';
import '../../services/providers/dark_theme_provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final controller = Get.put(SplashController());
  @override
  final themeProvider = Provider.of<DarkThemeProvider>(Get.context!);
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // color: AppColors.accentColor.withOpacity(0.15),
              width: controller.size.width,
              height: controller.size.height,
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Image.asset(
                    AppImages.splashLogoImg,
                    fit: BoxFit.cover,
                    width: 95.w,
                  ),
                  // Spacer(),
                  SizedBox(height: 8.h),
                  Image.asset(
                    AppImages.petMetLogoImg,
                    fit: BoxFit.cover,
                    width: 38.w,
                  ),
                  const SizedBox(height: 15),
                  Image.asset(
                    AppImages.petMateTextImg,
                    fit: BoxFit.cover,
                    width: 25.w,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "``Your Personal pet Companion.,,",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppImages.cubeImg,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                  const Spacer(flex: 2),
                  Text(
                    "Adopt and sell pet on a smartphone. Easily to use and\ncute interface",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.4)
                          : AppColors.blackTextColor,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            backgroundWaveShape(controller),
          ],
        ),
      ),
    );
  }

  backgroundWaveShape(controller) {
    return Positioned(
      bottom: 0,
      child: Opacity(
        opacity: 0.07,
        child: Container(
          width: controller.size.width + 16,
          // height: controller.size.height * 0.5,
          child: themeProvider.darkTheme
              ? darkThemeBottomShapes()
              : lightThemeBottomShapes(),
        ),
      ),
    );
  }

  lightThemeBottomShapes() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/Group-4-light.png",
            ),
            Image.asset(
              "assets/images/Group-2-light.png",
            ),
            Image.asset(
              "assets/images/Group-3-light.png",
            ),
            Image.asset(
              "assets/images/Group-1-light.png",
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/Group-4-light.png",
            ),
            Image.asset(
              "assets/images/Group-2-light.png",
            ),
            Image.asset(
              "assets/images/Group-3-light.png",
            ),
            Image.asset(
              "assets/images/Group-1-light.png",
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/Group-4-light.png",
            ),
            Image.asset(
              "assets/images/Group-2-light.png",
            ),
            Image.asset(
              "assets/images/Group-3-light.png",
            ),
            Image.asset(
              "assets/images/Group-1-light.png",
            ),
          ],
        ),
      ],
    );
  }

  darkThemeBottomShapes() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppImages.darkWave4Img,
            ),
            Image.asset(
              AppImages.darkWave2Img,
            ),
            Image.asset(
              AppImages.darkWave3Img,
            ),
            Image.asset(
              AppImages.darkWave1Img,
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              AppImages.darkWave4Img,
            ),
            Image.asset(
              AppImages.darkWave2Img,
            ),
            Image.asset(
              AppImages.darkWave3Img,
            ),
            Image.asset(
              AppImages.darkWave1Img,
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              AppImages.darkWave4Img,
            ),
            Image.asset(
              AppImages.darkWave2Img,
            ),
            Image.asset(
              AppImages.darkWave3Img,
            ),
            Image.asset(
              AppImages.darkWave1Img,
            ),
          ],
        ),
      ],
    );
  }
}
