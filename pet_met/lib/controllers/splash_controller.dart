import 'dart:async';

import 'package:get/get.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';
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
    userDetails.roleId = prefs.getInt(userPreference.roleIdKey) ?? 1001;
    userDetails.isUserLoggedIn = prefs.getBool(userPreference.isUserLoggedInKey) ?? false;
    userDetails.userId = prefs.getInt(userPreference.userIdKey) ?? 0;
    userDetails.userName = prefs.getString(userPreference.userNameKey) ?? "";
    userDetails.userEmail = prefs.getString(userPreference.userEmailKey) ?? "";
    userDetails.userProfileImage = prefs.getString(userPreference.userProfileImageKey) ?? "";


    return Timer(
      const Duration(milliseconds: 2500),
      () {
        if(onboardingValue == false) {
          Get.offNamed(AppRouteNames.onBoardingRoute);
        } else if(userDetails.isUserLoggedIn == true) {
          Get.offNamed(AppRouteNames.indexScreenRoute);
          // Get.off(() => IndexScreen(),
          //   transition: Transition.native,
          //   duration: const Duration(milliseconds: 500),
          // );

        } else if(userDetails.isUserLoggedIn == false) {
          Get.offNamed(AppRouteNames.loginRoute);
          // Get.off(() => LoginScreen(),
          //   transition: Transition.native,
          //   duration: const Duration(milliseconds: 500),
          // );

        }
      },
    );
  }
}
