import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        // margin: EdgeInsets.only(left: 20, right: 20),

        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteColor,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/onboardbgshape.png",
                width: controller.size.width,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/images/onboardtopright.png",
                // width: controller.size.width,
              ),
            ),
            SafeArea(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.h),
                        // Spacer(),
                        Image.asset(
                          controller.onBoardingPages[index].imageAsset,
                          height: 40.h,
                        ),
                        // SizedBox(height: 35.h),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Image.asset(
                              controller.onBoardingPages[index].logo,
                              width: 25.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              width: controller.size.width * 0.7,
                              child: Text(
                                controller.onBoardingPages[index].title,
                                style: TextStyle(
                                  color: AppColors.blackTextColor,
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
                            Container(
                              width: controller.size.width * 0.8,
                              child: Text(
                                controller.onBoardingPages[index].description,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20.h),
                  // Dot Indicator
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
                            margin: const EdgeInsets.all(5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? AppColors.accentColor
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.5.h),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
