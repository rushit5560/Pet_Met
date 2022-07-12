import 'dart:async';

import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class UserCategoriesController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;

  RxBool individualPetBool = false.obs;
  RxBool petShoopsGroomingBool = false.obs;
  RxBool petvetsandNgoBool = false.obs;
  RxBool petTrainerAndBreederBool = false.obs;

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
