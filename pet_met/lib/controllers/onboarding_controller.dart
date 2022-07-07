import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen/login_screen.dart';

class OnboardingController extends GetxController {
  final size = Get.size;

  var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
      setOnBoardingValue();
      Get.off(() => LoginScreen());
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      logo: "assets/images/petmet_logo.png",
      imageAsset: "assets/images/splash_peoples2.png",
      title: 'Find the Pet you love on around you easily',
      description:
          'You can buy a pet easily with this app. This app is connected to million people',
    ),
    OnBoardingInfo(
      logo: "assets/images/petmet_logo.png",
      imageAsset: "assets/images/splash_dogs1.png",
      title: 'Sell Your Pet on your smartphone.',
      description:
          'Sell your pet in one smartphone. Message and call with buyer with safety order',
    ),
    OnBoardingInfo(
      logo: "assets/images/petmet_logo.png",
      imageAsset: "assets/images/splash_peoples3.png",
      title: 'Get Started to Find your lovely friends',
      description: 'meet your pet and get the happy daya of the day',
    ),
  ];

  goToLoginScreen() => Get.offAll(() => LoginScreen());

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    prefs.getBool("onboarding");
    print('Set Value : ${prefs.getBool("onboarding")}');
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class OnBoardingInfo {
  final logo;
  final imageAsset;
  final title;
  final description;

  OnBoardingInfo({
    this.logo,
    this.imageAsset,
    this.title,
    this.description,
  });
}
