import 'dart:async';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';

class FaqController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  var drawerController = ZoomDrawerController();

  List questionsList = [
    "How They Work, and Why They’re Important",
    "What are the costs and benefits of pet microchips",
    "ind out the details and why you should consider getting one for your dog.",
    "What’s the best thing you can do for your cat who might wander off?",
    "How Does a Pet Microchip Work?",
    "Do I Need a Microchip?",
    "The needle is a little bigger, but the pain is minimal and the process is usually quick.",
    "Anesthesia is not needed, so this can be done at your vet’s office.",
  ];

  @override
  void onInit() {
    super.onInit();
  }
}

class AddressModel {
  final String? title;
  final String? address;
  final bool? isChecked;

  AddressModel({
    this.title,
    this.address,
    this.isChecked,
  });

  // NOTE: implementing functionality here in the next step!
}
