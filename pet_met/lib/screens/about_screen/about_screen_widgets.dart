import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/about_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(themeProvider.darkTheme
          ? AppImages.backgroundImgDark
          : AppImages.backgroundImgLight),
    );
  }
}

class AboutUsModule extends StatelessWidget {
  AboutUsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AboutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.darkTheme
            ? AppColors.darkThemeColor
            : AppColors.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(
                color: AppColors.accentTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Html(
              data: screenController.description,
              // style: {
              //   "body": Style(
              //     textDecorationColor: themeProvider.darkTheme
              //         ? AppColors.whiteColor
              //         : AppColors.blackTextColor,
              //     // color: themeProvider.darkTheme
              //     //     ? AppColors.whiteColor
              //     //     : AppColors.blackTextColor,
              //     // textDecorationColor: themeProvider.darkTheme
              //     //     ? AppColors.whiteColor
              //     //     : AppColors.blackTextColor,
              //   ),
              // },
              style: {
                "p": Style(
                  fontSize: FontSize(18.0),
                  color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                ),
                "body": Style(
                  fontSize: FontSize(18.0),
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              },
            ),
            /*Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 1.5.h),
            Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
