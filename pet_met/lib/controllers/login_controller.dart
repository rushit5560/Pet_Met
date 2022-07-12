import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_route_names.dart';

class LoginController extends GetxController {
  final size = Get.size;

  var mailController = TextEditingController(text: "test@gmail.com");
  var passController = TextEditingController(text: "Admin@123");
  var selectedPageIndex = 0.obs;

  final formKey = GlobalKey<FormState>();

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

  submitLoginForm() {
    if (formKey.currentState!.validate()) {
      try {
        // ScaffoldMessenger.of(Get.context!).showSnackBar(
        //   SnackBar(
        //     content: Text("Form Submitted"),
        //     duration: Duration(seconds: 3),
        //   ),
        // );
        Get.toNamed(AppRouteNames.indexScreenRoute);
      } catch (e) {
        throw e;
      }
    }
  }
}

class OnBoardingInfo {
  final imageAsset;
  final title;
  final description;

  OnBoardingInfo({this.imageAsset, this.title, this.description});
}
