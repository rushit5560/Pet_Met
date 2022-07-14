import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(AppImages.tealBackgroundImg),
    );
  }
}

class AboutUsModule extends StatelessWidget {
  const AboutUsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.darkTheme
            ? AppColors.darkThemeColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
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
          ],
        ),
      ),
    );
  }
}
