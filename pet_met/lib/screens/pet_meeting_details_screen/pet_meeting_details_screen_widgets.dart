import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/providers/dark_theme_provider.dart';

class PetMeetingDetailsBannerImageModule extends StatelessWidget {
  PetMeetingDetailsBannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    log("Image1212 : ${ApiUrl.apiImagePath + screenController.image}");
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
        ApiUrl.apiImagePath + screenController.image,
        errorBuilder: (context, st, ob) {
          return Image.asset(AppImages.petMetLogoImg);
        },
        fit: BoxFit.fill,
      ),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PetNameAndSocialMediaButtonModule extends StatelessWidget {
  PetNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            screenController.petName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.accentTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (screenController.meetingStatus.value == true) {
              _makingPhoneCall(screenController.phoneNo);
            } else if (screenController.meetingStatus.value == false) {
              screenController.openCheckout();
            }
          },
          child: Container(
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
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  _makingPhoneCall(String phoneNo) async {
    var url = Uri.parse("tel:$phoneNo");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PetPlaceTimePaymentModule extends StatelessWidget {
  PetPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pet Address Module
        Text(
          "Besides Kantilal Jewellers, Sargam Shopping Center, U 11-12, Anmol Complex surat 395006",
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
          ),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Pet Location Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Near by:",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                "2PM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),

        // Pet Age Module
        /*Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Age:",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                "8 Months",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),*/
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dob:",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                screenController.dob,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),

        // Pet Meet Up Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Meet Up:",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                screenController.mettingAvailability == "0"
                    ? "Available"
                    : "Unavailable",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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

class CallUsForMeetupModule extends StatelessWidget {
  CallUsForMeetupModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _makingPhoneCall(screenController.phoneNo);
      },
      child: Text(
        "Call Us For Meet up  at (+91) ${screenController.phoneNo}",
        style: TextStyle(
            color: AppColors.accentTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp),
      ).commonSymmetricPadding(horizontal: 15),
    );
  }

  _makingPhoneCall(String phoneNo) async {
    var url = Uri.parse("tel:$phoneNo");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PetMeetingOverViewModule extends StatelessWidget {
  PetMeetingOverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

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
        SizedBox(height: screenController.size.height * 0.001.h),
        // Text(
        //   screenController.details,
        //   style: TextStyle(
        //     color: themeProvider.darkTheme
        //         ? AppColors.whiteColor
        //         : AppColors.blackTextColor,
        //   ),
        // ),
        Html(
          data: screenController.details,
          style: {
            "body": Style(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              // fontSize: FontSize(15.0),
              // fontWeight: FontWeight.w500,
            ),
          },
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}
