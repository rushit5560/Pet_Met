import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

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
        ApiUrl.apiImagePath + "asset/uploads/product/" +screenController.vetsNgoDetailsData.image!,
        errorBuilder: (context, st, ob){
          return Image.asset(AppImages.petMetLogoImg);
        },
        fit: BoxFit.cover,),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class NgoAchivementPictureListModule extends StatelessWidget {
  NgoAchivementPictureListModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: Row(
            children: [
              Text(
                "Trainer Picture",
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        /*SizedBox(
          height: 10.h,
          child: screenController.trainerDetails.meetingimages!.isEmpty ?
          const Center(child: Text("Empty Trainer Picture")):
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: screenController.trainerDetails.meetingimages!.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            itemBuilder: (context, i) {
              String imgUrl = ApiUrl.apiImagePath +
                  screenController.trainerDetails.meetingimages![i];
              return Stack(
                children: [
                  GestureDetector(
                    onTap:(){
                      imageAlertDialog(context, i);
                    },
                    child: Container(
                      height: 10.h,
                      width: 10.h,

                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                          // color: AppColors.greyTextColor,
                          errorBuilder: (context, er, ob) {
                            return Image.asset(AppImages.petMetLogoImg);
                          },
                        ),
                      ),
                      *//*decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgUrl),
                            onError: (context, er){
                              Image.asset(AppImages.petMetLogoImg);
                            },
                            fit: BoxFit.cover),
                        color: AppColors.greyTextColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),*//*
                    ),
                  ),
                  // i == 0
                  //     ? Positioned(
                  //         right: 0,
                  //         bottom: 0,
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Get.toNamed(AppRouteNames.uploadPetRoute);
                  //           },
                  //           child: Container(
                  //             height: 15,
                  //             width: 15,
                  //             decoration: const BoxDecoration(
                  //                 color: Colors.green, shape: BoxShape.circle),
                  //             child: const Icon(
                  //               Icons.add,
                  //               color: AppColors.whiteColor,
                  //               size: 12,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : const SizedBox()
                ],
              );
            },
          ),
        ),*/
      ],
    );
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
    var url = Uri.parse("tel: ${screenController.vetsNgoDetailsData.phone}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    var whatsappUrl =
        "whatsapp://send?phone= ${screenController.vetsNgoDetailsData.phone}"
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

  Future<void> launchFacebook(String fbUrl,String fbWebUrl) async {
    try {
      bool launched = await launch(fbUrl, forceSafariVC: false);
      log("Launched Native app $launched");

      if (!launched) {
        await launch(fbWebUrl, forceSafariVC: false);
        log("Launched browser $launched");
      }
    } catch (e) {
      await launch(fbWebUrl, forceSafariVC: false);
      log("Inside catch");
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
                "Open: " + screenController.vetsNgoDetailsData.open!  + "  "
    "Close:" + screenController.vetsNgoDetailsData.close!,
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

class DonateForPetLoversButtonModule extends StatelessWidget {
  DonateForPetLoversButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetVetsAndNgoDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //screenController.openCheckout();
        alertDialogBox(context);
      },
      child: Container(
        width: Get.width/1.5,
        height: 35,
        decoration: const BoxDecoration(
          color: AppColors.accentTextColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "Click donate for Pet Lovers",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ).commonSymmetricPadding(horizontal: 25);
  }

  alertDialogBox(BuildContext context){
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor
          .withOpacity(0.3)
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
          child: Form(
            key: screenController.formKey,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //const SizedBox(height: 8),
                // CustomLightTextField(
                //   readOnly: false,
                //   fieldController: controller.passwordController,
                //   height: Get.height * 0.05,
                //   width: double.infinity,
                //   hintText: "Password",
                //   textInputAction: TextInputAction.next,
                //   textInputType: TextInputType.text,
                //   validator: (val) => Validations().validateName(val!),
                // ),

                    Stack(
                      children: [
                        Container(
                          height: screenController.size.height * 0.05,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor.withOpacity(0.05)
                                    : AppColors.greyTextColor.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 0.1,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: screenController.priceController,
                          validator: (val) => Validations().validatePrice(val!),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          cursorColor: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.accentTextColor,
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.blackTextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                          decoration: InputDecoration(
                              fillColor: themeProvider.darkTheme
                                  ? AppColors.darkThemeBoxColor
                                  : AppColors.whiteColor,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                              ),
                              hintText: "Price",
                              hintStyle: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                          ),
                        ),
                      ],
                    ),

                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: ()async {
                        //await screenController.userLoginFunction();
                        if(screenController.formKey.currentState!.validate()){

                          screenController.openCheckout();
                          screenController.priceController.clear();
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.accentColor,
                        minimumSize: Size(
                          screenController.size.width * 0.3,
                          30,
                        ),
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16),
                        shape:
                        const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                      screenController.size.width * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyTextColor
                            .withOpacity(0.3),
                        minimumSize: Size(
                            screenController.size.width * 0.3,
                            30),
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16),
                        shape:
                        const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            color: themeProvider
                                .darkTheme
                                ? AppColors
                                .darkThemeBoxColor
                                : AppColors
                                .blackTextColor,
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
      ),
    );
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
        SizedBox(height: 10),
        Html(
            data: screenController.vetsNgoDetailsData.fullText!,
          style: {
            "p": Style(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
               //fontSize: FontSize(15.0),
              // fontWeight: FontWeight.w500,
            ),
          },
        ),
        // Text(
        //   screenController.vetsNgoDetailsData.fullText!,
        //   style: TextStyle(
        //     color: themeProvider.darkTheme
        //         ? AppColors.whiteColor
        //         : AppColors.blackTextColor,
        //   ),
        // ),
        SizedBox(height: 2.h)
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 5);
  }
}
