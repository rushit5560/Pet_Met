import 'dart:async';

import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class SplashController extends GetxController {
  final size = Get.size;

  @override
  void onInit() {
    super.onInit();
    redirectNextScreen();
  }

  redirectNextScreen() {
    return Timer(
      const Duration(milliseconds: 2500),
      () {
        Get.offNamed(AppRouteNames.onboardingRoute);
      },
    );
  }
}
