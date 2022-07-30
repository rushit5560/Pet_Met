import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

class BannerImageModule extends StatelessWidget {
  BannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenController.size.width,
      height: screenController.size.height * 0.038.h,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(AppImages.shopDetailsImg),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.network(
        ApiUrl.apiImagePath + screenController.vetsNgoDetailsData.showimg!,
        errorBuilder: (context, st, ob){
          return Image.asset(AppImages.petMetLogoImg);
        },
        fit: BoxFit.cover,),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class VetAndNgoNameAndSocialMediaButtonModule extends StatelessWidget {
  VetAndNgoNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            screenController.vetsNgoDetailsData.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.accentTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
        Container(
          height: screenController.size.width * 0.018.w,
          width: screenController.size.width * 0.018.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),
        Container(
          height: screenController.size.width * 0.018.w,
          width: screenController.size.width * 0.018.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),
        Container(
          height: screenController.size.width * 0.018.w,
          width: screenController.size.width * 0.018.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),
        Container(
          height: screenController.size.width * 0.018.w,
          width: screenController.size.width * 0.018.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class VetAndNgoPlaceTimePaymentModule extends StatelessWidget {
  VetAndNgoPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shop Address Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.locationImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                screenController.vetsNgoDetailsData.address!,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Shop Time Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.locationImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                "Open: " + screenController.vetsNgoDetailsData.openTime!  + "  "
    "Close:" + screenController.vetsNgoDetailsData.closeTime!,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class OverViewModule extends StatelessWidget {
  OverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Overview",
          style: TextStyle(
              color: AppColors.accentTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp),
        ),
        SizedBox(height: screenController.size.height * 0.003.h),
        Text(
          screenController.vetsNgoDetailsData.overview!,
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
          ),
        ),
        SizedBox(height: 2.h)
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 5);
  }
}
