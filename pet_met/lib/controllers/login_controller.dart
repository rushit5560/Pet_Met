import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final size = Get.size;

  var mailController = TextEditingController();
  var passController = TextEditingController();
  var selectedPageIndex = 0.obs;

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      imageAsset: "assets/images/splash_peoples2.png",
      title: 'Find the Pet you love on around you easily',
      description:
          'You can buy a pet easily with this app. This app is connected to million people',
    ),
    OnBoardingInfo(
      imageAsset: "assets/images/splash_dogs1.png",
      title: 'Sell Your Pet on your smartphone.',
      description:
          'Sell your pet in one smartphone. Message and call with buyer with safety order',
    ),
    OnBoardingInfo(
      imageAsset: "assets/images/splash_peoples3.png",
      title: 'Get Started to Find your lovely friends',
      description: 'meet your pet and get the happy daya of the day',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}

class OnBoardingInfo {
  final imageAsset;
  final title;
  final description;

  OnBoardingInfo({this.imageAsset, this.title, this.description});
}
