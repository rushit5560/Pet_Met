import 'dart:async';

import 'package:get/get.dart';
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
    Get.offNamed(AppRouteNames.loginRoute);
  }

  var boolsList = [];

  List userTypeCategories = [
    "Individual pet categories",
    "Pet Shops & Grooming",
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
