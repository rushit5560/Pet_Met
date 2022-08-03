import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/providers/dark_theme_provider.dart';

class BannerImageModule extends StatelessWidget {
  BannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenController.size.width,
      height: screenController.size.height * 0.030.h,
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: NetworkImage(ApiUrl.apiImagePath + screenController.shopDetails.showimg),
      //   fit: BoxFit.cover,
      // ),
      // borderRadius: BorderRadius.circular(15),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          ApiUrl.apiImagePath + screenController.shopData.showimg!,
          fit: BoxFit.cover,
          errorBuilder: (context, er, ob) {
            return Image.asset(AppImages.petMetLogoImg);
          },
        ),
      ),
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
          style: TextStyle(color: AppColors.accentTextColor),
        ),
        SizedBox(height: screenController.size.height * 0.0005.h),
        SizedBox(
          height: screenController.size.width * 0.18,
          child: screenController.shopData.offersimages!.isEmpty ?
              const Center(child: Text("Empty Offers")):
          ListView.builder(
            itemCount: screenController.shopData.offersimages!.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _offerListTile(i, context);
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _offerListTile(int i, BuildContext context) {
    return GestureDetector(
      onTap: (){
        imageAlertDialog(context, i);
      },
      child: SizedBox(
        height: screenController.size.width * 0.18,
        width: screenController.size.width * 0.18,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
              ApiUrl.apiImagePath + screenController.shopData.offersimages![i],
              fit: BoxFit.cover, errorBuilder: (context, er, da) {
            return Image.asset(AppImages.petMetLogoImg);
          }),
        ),
      ).commonSymmetricPadding(horizontal: 5),
    );
  }

  imageAlertDialog(BuildContext context, int i){
    Widget cancelButton = TextButton(
      child: Text("No, cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes, delete it"),
      onPressed: () async {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Image.network(
          ApiUrl.apiImagePath + screenController.shopData.offersimages![i],
          fit: BoxFit.cover, errorBuilder: (context, er, da) {
        return Image.asset(AppImages.petMetLogoImg);
      }),
      // content: Text(
      //     "If you change timing slot duration your all schedule slot should been deleted you won't be able to recover this again!"),
      // actions: [
      //   continueButton,
      //   cancelButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            screenController.shopData.shopename!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.accentTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
        GestureDetector(
          onTap: (){
            _makingInstagramApp();
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.instaImg,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: (){
            var fbUrl =
                "fb://facewebmodal/f?href="  "https://facebook.com/AliForDigitalIsrael/";
            launchFacebook(fbUrl, "https://facebook.com/AliForDigitalIsrael/");
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.fbImg,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: (){
            launchWhatsApp(context);
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.whatsappImg,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: (){
            _makingPhoneCall();
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

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp(BuildContext context)
  {
    FocusManager.instance.primaryFocus?.unfocus();

    var whatsappUrl =
        "whatsapp://send?phone= 91 + 9876543213"
            "&text=${Uri.encodeComponent("Hello")}";
    try {
      launch(whatsappUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Unable to open whatsapp"),
        ),
      );
      Fluttertoast.showToast(msg: "Unable to open whatsapp");
    }
  }

  Future<void> launchFacebook(String fbUrl,String fbWebUrl)
  async {
    try {
      bool launched = await launch(fbUrl, forceSafariVC: false);
      print("Launched Native app $launched");

      if (!launched) {
        await launch(fbWebUrl, forceSafariVC: false);
        print("Launched browser $launched");
      }
    } catch (e) {
      await launch(fbWebUrl, forceSafariVC: false);
      print("Inside catch");
    }
  }

  _makingInstagramApp() async {
    var url = 'https://www.instagram.com/<INSTAGRAM_PROFILE>/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }
}

class ShopPlaceTimePaymentModule extends StatelessWidget {
  ShopPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

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
                screenController.shopData.address!,
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
              child: Row(
                children: [
                  Text(
                    "Open:" + screenController.shopData.shopopen!,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Close:" + screenController.shopData.shopclose!,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Payment Module
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
                "Cash, Cash on Delivery, Cheque, Debit Card, Credit Card, UPI, BHIM, Visa Card, Master Card, RuPay Card, G Pay, PhonePe, NEFT, RTGS, IMPS, Paytm.",
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
              fontSize: 12.sp),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),
        SizedBox(
          height: screenController.size.width * 0.15,
          child: screenController.shopData.meetingimages!.length == 0 ?
              const Text("Empty Meeting"):
          ListView.builder(
            itemCount: screenController.shopData.meetingimages!.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              log('Meeting image: ${screenController.shopData.meetingimages!.length}');
              String imgUrl = ApiUrl.apiImagePath +
                  screenController.shopData.meetingimages![i];
              return _meetingAvailabilityListTile(imgUrl);
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _meetingAvailabilityListTile(String imgUrl) {
    return SizedBox(
      height: screenController.size.width * 0.15,
      width: screenController.size.width * 0.15,
      // decoration: const BoxDecoration(
      //   // image: DecorationImage(
      //   //     image: AssetImage(
      //   //       AppImages.shopDetailsImg,
      //   //     ),
      //   //     fit: BoxFit.cover),
      //   color: AppColors.greyTextColor,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(8),
      //   ),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imgUrl, fit: BoxFit.fill,
            errorBuilder: (context, er, data) {
          return Image.asset(AppImages.petMetLogoImg);
        }),
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
              fontSize: 12.sp),
        ),
        SizedBox(height: screenController.size.height * 0.002.h),
        Html(
            data: screenController.shopData.fullText!,
          style: {
            "body": Style(
              fontSize: FontSize(18.0),
              fontWeight: FontWeight.bold,
              color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
            ),
          },
        ),
        SizedBox(height: screenController.size.height * 0.003.h),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}
