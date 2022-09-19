import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../user_profile_screen/user_profile_screen.dart';

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

class PetNameAndSocialMediaButtonModule extends StatefulWidget {
  PetNameAndSocialMediaButtonModule({Key? key}) : super(key: key);

  @override
  State<PetNameAndSocialMediaButtonModule> createState() =>
      _PetNameAndSocialMediaButtonModuleState();
}

class _PetNameAndSocialMediaButtonModuleState
    extends State<PetNameAndSocialMediaButtonModule> {
  final screenController = Get.find<PetMeetingDetailsScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenController.razorpay = Razorpay();
    screenController.razorpay
        .on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    screenController.razorpay
        .on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    screenController.razorpay
        .on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // log('Success Response: ${response.orderId}');
    await screenController.petAddOrderFunction(
        orderId: response.orderId,
        paymentId: response.paymentId!,
        signature: response.signature);

    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
    Fluttertoast.showToast(msg: 'Payment processing cancelled by user');
    //alertDialog();
    // log(response.message.toString());
    // log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

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
        // GestureDetector(
        //   onTap: () {
        //     if (screenController.meetingStatus.value == true) {
        //       _makingPhoneCall(screenController.phoneNo);
        //     } else if (screenController.meetingStatus.value == false) {
        //       screenController.openCheckout();
        //     }
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.phoneCallImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        GestureDetector(
          onTap: () {
            //Get.toNamed(AppRouteNames.petMeetingDetailsScreenRoute, arguments: homeController.petTopList[index].id);
            // log('Follow Userid: ${homeController.petTopList[i].data.userid}');
            // log('Follow Category id: ${homeController.petTopList[i].data.categoryId}');
            Get.to(
              () => UserProfileScreen(),
              transition: Transition.native,
              duration: const Duration(milliseconds: 500),
              arguments: [
                screenController.petUserId,
                screenController.petUserCatId,
                screenController.petId,
              ],
            );
          },
          child: Row(
            children: [
              Text(
                screenController.petOwnerUserName,
                style: const TextStyle(
                  color: AppColors.accentTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  // color: AppColors.greyColor,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.accentTextColor,
                    width: 0.5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    ApiUrl.apiImagePath +
                        "asset/uploads/product/" +
                        screenController.image,
                    errorBuilder: (context, st, ob) {
                      return Image.asset(
                        AppImages.petMetLogoImg,
                        fit: BoxFit.fitWidth,
                      );
                    },
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  alertDialog() {
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor.withOpacity(0.3)
          : AppColors.accentColor.withOpacity(0.3),
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          height: screenController.size.height * 0.35,
          width: screenController.size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Are sure you want to cancel payment?",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.2,
                ),
              ),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Fluttertoast.showToast(
                          msg: 'Payment processing cancelled by user');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.accentColor,
                      minimumSize: Size(
                        screenController.size.width * 0.25,
                        30,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenController.size.width * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor.withOpacity(0.3),
                      minimumSize: Size(screenController.size.width * 0.25, 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.darkThemeBoxColor
                              : AppColors.blackTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
