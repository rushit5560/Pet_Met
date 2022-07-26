import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/theme_preferences.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: -20,
              child: Image.asset(
                themeProvider.darkTheme
                    ? AppImages.onboardBackImgImgDark
                    : AppImages.onboardBackImgImglight,
                width: controller.size.width,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                themeProvider.darkTheme
                    ? AppImages.onboardPathImgDark
                    : AppImages.onboardPathImglight,
                color: themeProvider.darkTheme
                    ? AppColors.darkThemeColor
                    : AppColors.whiteColor,
                // width: controller.size.width,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.selectedPageIndex,
                      itemCount: controller.onBoardingPages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // SizedBox(height: 5.h),
                              // Spacer(),
                              Image.asset(
                                controller.onBoardingPages[index].imageAsset,
                                height: 40.h,
                              ).commonSymmetricPadding(horizontal: 30),
                              // SizedBox(height: 35.h),
                              SizedBox(height: 9.h),
                              Row(
                                children: [
                                  Image.asset(
                                    controller.onBoardingPages[index].logo,
                                    width: 25.w,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: controller.size.width * 0.6,
                                    child: Text(
                                      controller.onBoardingPages[index].title,
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.5.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: controller.size.width * 0.6,
                                    child: Text(
                                      controller
                                          .onBoardingPages[index].description,
                                      //textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.greyTextColor,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 15),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: List.generate(
                      controller.onBoardingPages.length,
                      (index) => Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: controller.selectedPageIndex.value == index
                                ? AppColors.accentColor.withOpacity(0.4)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? AppColors.accentColor
                                  : themeProvider.darkTheme
                                      ? AppColors.whiteColor.withOpacity(0.2)
                                      : Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Next Button
                  GestureDetector(
                    onTap: controller.forwardAction,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Obx(
                        () => Center(
                          child: Text(
                            controller.isLastPage ? "Start" : "Next",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 15),
            ),
          ],
        ),
      ),
    );
  }
}
