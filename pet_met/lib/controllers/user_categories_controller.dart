import 'dart:async';

import 'package:get/get.dart';
import 'package:pet_met/screens/login_screen/login_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_preference.dart';

class UserCategoriesController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;

  UserPreference userPreference = UserPreference();

  RxBool individualPetBool = false.obs;
  RxBool petShoopsGroomingBool = false.obs;
  RxBool petvetsandNgoBool = false.obs;
  RxBool petTrainerAndBreederBool = false.obs;

  int roleId = 0;

  // Set Role Id in Prefs
  Future<void> setRoleIdInPrefs() async {
    await userPreference.setRoleId(roleId);
    //Get.offNamed(AppRouteNames.loginRoute);
    Get.to(() => LoginScreen(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 500)
    );
  }

  var boolsList = [];

  List userTypeCategories = [
    "Pet Parents",
    "Pet Shops, Cafe & Grooming",
    "Pet Vets & Ngo",
    "Pet Trainers & Breeders",
  ];

  @override
  void onInit() {
    super.onInit();

    boolsList = [
      individualPetBool,
      petShoopsGroomingBool,
      petvetsandNgoBool,
      petTrainerAndBreederBool
    ];
  }
}
