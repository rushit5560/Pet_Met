import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/login_screen/login_screen.dart';
import '../services/providers/dark_theme_provider.dart';



class OnboardingController extends GetxController {
  final size = Get.size;

  var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
      setOnBoardingValue();
      //Get.off(() => LoginScreen());
      Get.off(() => const UserCategoriesScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500)
      );
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  List<OnBoardingInfo> onBoardingPages = [];

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

    onBoardingPages = [
      OnBoardingInfo(
        // logo: "assets/images/petmet_logo.png",
        logo: "Peto'Mate",
        imageAsset: themeProvider.darkTheme
            ? "assets/images/splash_peoples2_dark.png"
            : "assets/images/splash_peoples2_light.png",
        title: 'Meet other pet parents online',
        description:
            'Login from your location and communicate with other pet parents locally & globally',
      ),
      OnBoardingInfo(
        // logo: "assets/images/petmet_logo.png",
        logo: "Peto'Mate",
        imageAsset: themeProvider.darkTheme
            ? "assets/images/splash_dogs1_dark1.png"
            : "assets/images/splash_dogs1_dark1.png",
        title: 'Find pet shops, doctors, ngos & trainers on a single tap',
        description:
            'Easy to access and locate essential daily needs of pets nearby!!',
      ),
      OnBoardingInfo(
        // logo: "assets/images/petmet_logo.png",
        logo: "Peto'Mate",
        imageAsset: themeProvider.darkTheme
            ? "assets/images/splash_peoples3_dark.png"
            : "assets/images/splash_peoples3_light.png",
        title: 'Learn pet parenting a better way!!',
        description: 'An easy solution for new pet parents to understand their pets a better way.',
      ),
    ];
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
