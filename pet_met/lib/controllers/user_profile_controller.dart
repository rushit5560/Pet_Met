import 'dart:async';

import 'package:get/get.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';

class UserProfileController extends GetxController {
  final size = Get.size;

  List dogsTopList = [
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
