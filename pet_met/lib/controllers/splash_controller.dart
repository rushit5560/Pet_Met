import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/onboarding_screen/onboarding_screen.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final size = Get.size;

  UserPreference userPreference = UserPreference();
  UserDetails userDetails = UserDetails();

  @override
  void onInit() {
    super.onInit();
    redirectNextScreen();
  }

  redirectNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingValue = prefs.getBool('onboarding') ?? false;

    /// Set User value in Local from Prefs
    UserDetails.roleId = prefs.getInt(userPreference.roleIdKey) ?? 0;
    UserDetails.isUserLoggedIn =
        prefs.getBool(userPreference.isUserLoggedInKey) ?? false;
    UserDetails.selfId = prefs.getString(userPreference.selfIdKey) ?? "";
    UserDetails.userId = prefs.getString(userPreference.userIdKey) ?? "";
    UserDetails.userName = prefs.getString(userPreference.userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userPreference.userEmailKey) ?? "";
    UserDetails.userProfileImage =
        prefs.getString(userPreference.userProfileImageKey) ?? "";
    UserDetails.userToken = prefs.getString(userPreference.userTokenKey) ?? "";
    UserDetails.categoryId = prefs.getString(userPreference.roleId1Key) ?? "";
    UserDetails.shopName = prefs.getString(userPreference.shopNameKey) ?? "";
    UserDetails.shopProfile = prefs.getString(userPreference.shopProfileImageKey) ?? "";
    log('UserDetails.roleId: ${UserDetails.roleId}');
    log('UserDetails.categoryId: ${UserDetails.categoryId}');
    log('UserDetails.shopName: ${UserDetails.shopName}');

    return Timer(
      const Duration(milliseconds: 2500),
      () {
        if (onboardingValue == false) {
          Get.off(()=> OnboardingScreen(),
              transition: Transition.native,
              duration: const Duration(milliseconds: 500));
        }
        else if (UserDetails.isUserLoggedIn == true) {
          Get.off(() => IndexScreen(),
              transition: Transition.native,
              duration: const Duration(milliseconds: 500));
          // Get.off(() => IndexScreen(),
          //   transition: Transition.native,
          //   duration: const Duration(milliseconds: 500),
          // );

        }
        else if (UserDetails.isUserLoggedIn == false) {
          //Get.offNamed(AppRouteNames.loginRoute);
          Get.off(() => const UserCategoriesScreen(),
              transition: Transition.native,
              duration: const Duration(milliseconds: 500));
          // Get.off(() => LoginScreen(),
          //   transition: Transition.native,
          //   duration: const Duration(milliseconds: 500),
          // );

        }
      },
    );
  }
}
