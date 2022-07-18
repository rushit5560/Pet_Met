import 'dart:async';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/pet_meeting_and_breading_screen/pet_meeting_and_breading_screen.dart';
import 'package:pet_met/screens/pet_trainers_screen/pet_trainers_screen.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_screen/pet_vets_and_ngo_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';

class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;

  var drawerController = ZoomDrawerController();

  List screenPages = [
    ShopAndGroomingScreen(),
    PetTrainersScreen(),
    HomeScreen(),
    PetMeetingAndBreadingScreen(),
    PetVetsAndNgoScreen(),
  ];

  userLogOutFunction() async {

  }

}
