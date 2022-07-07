import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_details_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';



class BannerImageModule extends StatelessWidget {
  BannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenController.size.width,
      height: screenController.size.height * 0.030.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.shopDetailsImg),
          fit: BoxFit.cover,
        ),
      ),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}


class OffersModule extends StatelessWidget {
  OffersModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Offers:",
          style: TextStyle(
            color: AppColors.accentTextColor
          ),
        ),
        SizedBox(height: screenController.size.height * 0.0005.h),

        SizedBox(
          height: screenController.size.width * 0.18,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _offerListTile();
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _offerListTile() {
    return Container(
      height: screenController.size.width * 0.18,
      width: screenController.size.width * 0.18,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImages.shopDetailsImg,
            ),
            fit: BoxFit.cover),
        color: AppColors.greyTextColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }

}

class ShopNameAndSocialMediaButtonModule extends StatelessWidget {
  ShopNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Skylos The Pet Shop",
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
          height: screenController.size.width * 0.020.w,
          width: screenController.size.width * 0.020.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
              AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),

        Container(
          height: screenController.size.width * 0.020.w,
          width: screenController.size.width * 0.020.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),

        Container(
          height: screenController.size.width * 0.020.w,
          width: screenController.size.width * 0.020.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.accentColor,
          ),
          child: Image.asset(
            AppImages.phoneCallImg,
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(horizontal: 2),

        Container(
          height: screenController.size.width * 0.020.w,
          width: screenController.size.width * 0.020.w,
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

class ShopPlaceTimePaymentModule extends StatelessWidget {
  ShopPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

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
        SizedBox(height: screenController.size.height * 0.001.h),

        // Payment Module
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
                  "Cash, Cash on Delivery, Cheque, Debit Card, Credit Card, UPI, BHIM, Visa Card, Master Card, RuPay Card, G Pay, PhonePe, NEFT, RTGS, IMPS, Paytm."
              ),
            ),
          ],
        ),


      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class MeetingAvailabilityModule extends StatelessWidget {
  MeetingAvailabilityModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Meeting Availability",
          style: TextStyle(
              color: AppColors.accentTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp
          ),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        SizedBox(
          height: screenController.size.width * 0.15,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _meetingAvailabilityListTile();
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }


  Widget _meetingAvailabilityListTile() {
    return Container(
      height: screenController.size.width * 0.15,
      width: screenController.size.width * 0.15,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImages.shopDetailsImg,
            ),
            fit: BoxFit.cover),
        color: AppColors.greyTextColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }

}

class OverViewModule extends StatelessWidget {
  OverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

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


