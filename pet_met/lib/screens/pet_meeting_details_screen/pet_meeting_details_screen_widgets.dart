import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_details_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

class PetMeetingDetailsBannerImageModule extends StatelessWidget {
  PetMeetingDetailsBannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenController.size.width,
      height: screenController.size.height * 0.038.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.shopDetailsImg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
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
            "People For Animals",
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
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PetPlaceTimePaymentModule extends StatelessWidget {
  PetPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pet Address Module
        const Text(
            "Besides Kantilal Jewellers, Sargam Shopping Center, U 11-12, Anmol Complex surat 395006"),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Pet Location Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Near by:"),
            SizedBox(width: screenController.size.width * 0.008.w),
            const Expanded(
              child: Text(
                "2PM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        // Pet Age Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Age:"),
            SizedBox(width: screenController.size.width * 0.008.w),
            const Expanded(
              child: Text(
                "8 Months",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        // Pet Meet Up Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Meet Up:"),
            SizedBox(width: screenController.size.width * 0.008.w),
            const Expanded(
              child: Text(
                "Available",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
    return Text(
      "Call Us For Meet up  at (+91) 90912 45678",
      style: TextStyle(
          color: AppColors.accentTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PetMeetingOverViewModule extends StatelessWidget {
  PetMeetingOverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingDetailsScreenController>();

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
        const Text(
            "Established in the year 2015, Firstdog Pet Shop in Katargam, Surat is a top player in the category Pet Food Dealers in the Surat. This well-known establishment acts as a one-stop destination servicing customers both local and from other parts of Surat."
            "Over the course of its journey, this business has established a firm foothold in it’s industry. The belief that customer satisfaction is as important as their products and services, have helped this establishment garner a vast base of customers, which continues to grow by the day."
            "This business employs individuals that are dedicated towards their respective roles and put in a lot of effort to achieve the common vision and larger goals of the company. In the near future, this business aims to expand its line of products and services and cater to a larger client base. In Surat, this establishment occupies a prominent location in Katargam. It is an effortless task in commuting to this establishment as there are various modes of transport readily available. It is at Behind Lake Garden, Opposite Jain Derasar."
            "which makes it easy for first-time visitors in locating this establishment. It is known to provide top service in the following categories: Pet Shops, Pet Shops For Dog, Pet Shops For Labrador Dog, Pet Shops For German Shepherd Dog, Pet Shops For Pug Dog, Pet Food Dealers, Pet Grooming Services, Dog Food Retailers."),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}
