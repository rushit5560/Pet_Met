import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
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
        image: const DecorationImage(
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


class VetAndNgoNameAndSocialMediaButtonModule extends StatelessWidget {
  VetAndNgoNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

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
                fontSize: 18.sp
            ),
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
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppIcons.locationImg),
                ),
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),

            const Expanded(
              child: Text(
                  "Shop No-10, Besides Decent Hotel, Jay Complex, Anand Mahal Road, surat 395006"
              ),
            ),
          ],
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Shop Time Module
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppIcons.locationImg),
                ),
              ),
            ),
            SizedBox(width: screenController.size.width * 0.008.w),

            const Expanded(
              child: Text(
                  "Open Closes 6PM"
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
              fontSize: 12.sp
          ),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),
        const Text(
            "Established in the year 2015, Firstdog Pet Shop in Katargam, Surat is a top player in the category Pet Food Dealers in the Surat. This well-known establishment acts as a one-stop destination servicing customers both local and from other parts of Surat."
                "Over the course of its journey, this business has established a firm foothold in it’s industry. The belief that customer satisfaction is as important as their products and services, have helped this establishment garner a vast base of customers, which continues to grow by the day."
                "This business employs individuals that are dedicated towards their respective roles and put in a lot of effort to achieve the common vision and larger goals of the company. In the near future, this business aims to expand its line of products and services and cater to a larger client base. In Surat, this establishment occupies a prominent location in Katargam. It is an effortless task in commuting to this establishment as there are various modes of transport readily available. It is at Behind Lake Garden, Opposite Jain Derasar."
                "which makes it easy for first-time visitors in locating this establishment. It is known to provide top service in the following categories: Pet Shops, Pet Shops For Dog, Pet Shops For Labrador Dog, Pet Shops For German Shepherd Dog, Pet Shops For Pug Dog, Pet Food Dealers, Pet Grooming Services, Dog Food Retailers."
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

