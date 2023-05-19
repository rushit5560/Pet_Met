import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/service/notification_service.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/splash_controller.dart';
import '../../services/providers/dark_theme_provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(SplashController());
  @override
  void initState() {
    LocalNotificationService.initilize();
    // trminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        setState(() {
          message.notification!.hashCode;
          message.notification!.title;
          message.notification!.body;
        });
      }
    });
//forground state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (Platform.isIOS) {
        LocalNotificationService.forgroundMessage(message);
        // setState(() {
        //   message.notification!.hashCode;
        //   message.notification!.title;
        //   message.notification!.body;
        // });
      } else if (Platform.isAndroid) {
        LocalNotificationService.showNotificationOnForeground(message);
        setState(() {
          message.notification!.hashCode;
          message.notification!.title;
          message.notification!.body;
        });
      }
    });

    //background state
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      setState(() {
        message.notification!.hashCode;
        message.notification!.title;
        message.notification!.body;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // backgroundColor: const Color(0xFFFFFFFF),
      /* body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // color: AppColors.accentColor.withOpacity(0.15),
              width: controller.size.width,
              height: controller.size.height,
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Image.asset(
                    themeProvider.darkTheme
                        ? AppImages.splashLogoImgDark
                        : AppImages.splashLogoImgLight,
                    fit: BoxFit.cover,
                    width: 95.w,
                  ),
                  // Spacer(),
                  SizedBox(height: 8.h),
                  Image.asset(
                    AppImages.petMetLogoImg,
                    fit: BoxFit.cover,
                    width: 38.w,
                  ),
                  const SizedBox(height: 15),
                  Image.asset(
                    AppImages.petMateTextImg,
                    fit: BoxFit.cover,
                    width: 25.w,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "``Your Personal pet Companion.,,",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppImages.cubeImg,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                  const Spacer(flex: 2),
                  Text(
                    "Adopt and sell pet on a smartphone. Easily to use and\ncute interface",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.4)
                          : AppColors.blackTextColor,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            backgroundWaveShape(controller),
          ],
        ),
      ),*/
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.petMetLogoImg,
                      height: 5.0.h,
                      width: 20.w,
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 15),
                SizedBox(height: 8.h),
                SizedBox(
                  height: Get.size.width * 0.80,
                  child: Obx(
                    () => AnimatedContainer(
                      width: controller.width1.value,
                      height: controller.height1.value,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        themeProvider.darkTheme
                            ? AppImages.splashLogoImgDark
                            : AppImages.splashLogoImgLight,
                        // fit: BoxFit.contain,
                        // width: Get.width/1.5,
                        height: controller.imageHeight.value,
                      ),
                    ),
                  ),
                ),
                /*SizedBox(height: 8.h),
                Image.asset(
                  AppImages.petMetLogoImg,
                  fit: BoxFit.cover,
                  width: 30.w,
                ),*/
                const SizedBox(height: 15),
                Text(
                  "PETO'MATE",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.accentTextColor
                        : AppColors.accentTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TTWellingtons-Bold",
                    height: 1.2,
                  ),
                ),
                /*Image.asset(
                  AppImages.petMateTextImg,
                  fit: BoxFit.cover,
                  width: 25.w,
                ),*/
                const SizedBox(height: 20),
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      // "Connecting Pet Lovers 💕",
                      "Connecting Pet Lovers 🤍",
                      speed: const Duration(milliseconds: 100),
                      textStyle: TextStyle(
                        fontSize: 11.sp,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.greyTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                /*RichText(
                text: TextSpan(
                  text: "Connecting Pet Lovers!! ",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: "💕",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: themeProvider.darkTheme
                            ? AppColors.redColor
                            : AppColors.redColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                ),*/
                /*Text(
                  "Connecting Pet Lovers!! 💕",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),*/
                const SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: backgroundWaveShape(controller, context),
            )

            //backgroundWaveShape(controller),
          ],
        ),
      ),
    );
  }

  backgroundWaveShape(controller, context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Opacity(
                opacity: 0.10,
                child: Container(
                  //width: controller.size.width + 16,
                  // height: controller.size.height * 0.5,
                  child: themeProvider.darkTheme
                      ? darkThemeBottomShapes()
                      : lightThemeBottomShapes(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AppImages.cubeImg,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(height: 10),
        Text(
          "Your personal pet community, Easy to use and cute interface",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            color: themeProvider.darkTheme
                ? AppColors.whiteColor.withOpacity(0.4)
                : AppColors.blackTextColor,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  lightThemeBottomShapes() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset(
                "assets/images/Group-4-light.png",
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-2-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-3-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-1-light.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                "assets/images/Group-4-light.png",
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-2-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-3-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-1-light.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                "assets/images/Group-4-light.png",
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-2-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-3-light.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/Group-1-light.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  darkThemeBottomShapes() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset(
                AppImages.darkWave4Img,
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave2Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave3Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave1Img,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                AppImages.darkWave4Img,
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave2Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave3Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave1Img,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                AppImages.darkWave4Img,
                fit: BoxFit.fill,
                height: 75,
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave2Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave3Img,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.darkWave1Img,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
