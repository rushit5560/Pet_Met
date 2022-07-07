import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/index_screen/index_screen.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';
import 'package:pet_met/screens/register_screen/register_screen.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/screens/user_profile_edit_screen/user_profile_edit_screen.dart';

import 'package:pet_met/utils/app_route_names.dart';

import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/user_profile_screen/user_profile_screen.dart';

class AppRoutes {
  final routes = [
    GetPage(
      name: AppRouteNames.splashRoute,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.onboardingRoute,
      page: () => OnboardingScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.loginRoute,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.registerRoute,
      page: () => RegisterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.indexScreenRoute,
      page: () => IndexScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.homeScreenRoute,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.userProfileRoute,
      page: () => UserProfileScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.userProfileEditRoute,
      page: () => UserProfileEditScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRouteNames.uploadPetRoute,
      page: () => UploadPetScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
