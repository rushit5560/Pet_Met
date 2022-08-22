import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_details_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/providers/dark_theme_provider.dart';

class PetTrainerBannerImageModule extends StatelessWidget {
  PetTrainerBannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenController.size.width,
      height: screenController.size.height * 0.038.h,
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage(AppImages.shopDetailsImg),
      //   fit: BoxFit.cover,
      // ),
      // borderRadius: BorderRadius.circular(15),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          ApiUrl.apiImagePath + screenController.trainerDetails[0].image!,
          fit: BoxFit.cover,
          errorBuilder: (context, er, ob) {
            return Image.asset(AppImages.petMetLogoImg);
          },
        ),
      ),
      // child: Image.asset(AppImages.shopDetailsImg,
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class PetTrainerPicturesModule extends StatelessWidget {
  PetTrainerPicturesModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15, right: 15
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Trainer Picture",
                  style: TextStyle(
                    color: AppColors.accentTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              screenController.isVerified == true
                  ? Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentTextColor,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              )
                  : Container(),

            ],
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.only(
              // top: 15,
              // bottom: 15,
              left: 15, right: 15
          ),
          child: SizedBox(
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
                        */
        /*decoration: BoxDecoration(
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
          ),
        ),*/
        //SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                    height: screenController.size.width * 0.18,
                    //width: screenController.size.width * 0.18,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            ApiUrl.apiImagePath + "asset/uploads/product/"
                                "${screenController.trainerDetails[0].image1}",
                            height: 40, width: 40,
                            errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                      ),
                    ),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: SizedBox(
                    height: screenController.size.width * 0.18,
                    //width: screenController.size.width * 0.18,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            ApiUrl.apiImagePath + "asset/uploads/product/"
                                "${screenController.trainerDetails[0].image2}",
                            height: 40, width: 40,
                            errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                      ),
                    ),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: SizedBox(
                    height: screenController.size.width * 0.18,
                    //width: screenController.size.width * 0.18,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            ApiUrl.apiImagePath + "asset/uploads/product/"
                                "${screenController.trainerDetails[0].image3}",
                            fit: BoxFit.cover,
                            height: 40, width: 40,
                            errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }),
                      ),
                    ),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: SizedBox(
                    height: screenController.size.width * 0.18,
                    //width: screenController.size.width * 0.18,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            ApiUrl.apiImagePath + "asset/uploads/product/"
                                "${screenController.trainerDetails[0].image4}",
                            fit: BoxFit.cover, errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        }),
                      ),
                    ),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: SizedBox(
                    height: screenController.size.width * 0.18,
                    //width: screenController.size.width * 0.18,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            ApiUrl.apiImagePath + "asset/uploads/product/"
                                "${screenController.trainerDetails[0].image5}",
                            fit: BoxFit.cover, errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        }),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
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
        ApiUrl.apiImagePath +
            screenController.trainerDetails[0].meetingimages![i],
        fit: BoxFit.cover,
        // color: AppColors.greyTextColor,
        errorBuilder: (context, er, ob) {
          return Image.asset(AppImages.petMetLogoImg);
        },
      ),
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

class PetTrainerNameAndSocialMediaButtonModule extends StatelessWidget {
  PetTrainerNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            screenController.trainerDetails[0].name!,
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
            String url = "${screenController.trainerDetails[0].instagram}";
            _makingInstagramApp(url);
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
            var fbUrl = "${screenController.trainerDetails[0].instagram}";
            launchFacebook(fbUrl, fbUrl);
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
            String number = "${screenController.trainerDetails[0].phone}";
            launchWhatsApp(context, number);
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
            String number = "${screenController.trainerDetails[0].phone}";
            _makingPhoneCall(number);
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

  _makingPhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp(BuildContext context, String number) {
    FocusManager.instance.primaryFocus?.unfocus();

    var whatsappUrl =
        "whatsapp://send?phone=$number"
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

  _makingInstagramApp(String url) async {
    // var url = 'https://www.instagram.com/<INSTAGRAM_PROFILE>/';

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

class PetTrainerPlaceTimePaymentModule extends StatelessWidget {
  PetTrainerPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
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
                screenController.trainerDetails[0].address!,
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
                    "Open: " + screenController.trainerDetails[0].open!,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Close: " + screenController.trainerDetails[0].close!,
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
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class CallUsTextModule extends StatelessWidget {
  CallUsTextModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Text("Call Us Today at " + "${screenController.trainerDetails[0].phone}" + " To Learn More!",
      style: const TextStyle(color: AppColors.accentTextColor, fontWeight: FontWeight.bold,)).commonSymmetricPadding(horizontal: 15);
  }
}


class PetTrainerOverViewModule extends StatelessWidget {
  PetTrainerOverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);

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
        // Html(
        //   data: screenController.trainerDetails.fullText,
        //   style: {
        //     "p": Style(
        //         color: themeProvider.darkTheme
        //             ? AppColors.whiteColor
        //             : AppColors.blackTextColor)
        //   },
        // ),
        Text(
          screenController.trainerDetails[0].fullText!,
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
          ),
        ),
        SizedBox(height: screenController.size.height * 0.003.h),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}
