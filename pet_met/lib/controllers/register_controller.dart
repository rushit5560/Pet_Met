import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class RegisterController extends GetxController {
  final size = Get.size;

  @override
  void onInit() {
    super.onInit();
    redirectNextScreen();
  }

  redirectNextScreen() {
    return Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Get.toNamed(AppRouteNames.onboardingRoute);
      },
    );
  }
}
