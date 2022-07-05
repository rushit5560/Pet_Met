import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pet_met/utils/app_route_names.dart';

import '../screens/onboarding/onboarding_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  final routes = [
    GetPage(
      name: AppRouteNames.splashRoute,
      page: () => SplashScreen(),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: AppRouteNames.onboardingRoute,
      page: () => OnboardingScreen(),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
