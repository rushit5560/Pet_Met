import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class HomeController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  var drawerController = ZoomDrawerController();

  List dogsTopList = [
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
    "assets/icons/dog1.png",
  ];

  // toggleMenu([bool end = false]) {
  //   if (end) {
  //     final _state = endSideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   } else {
  //     final _state = sideMenuKey.currentState!;
  //     if (_state.isOpened) {
  //       _state.closeSideMenu();
  //     } else {
  //       _state.openSideMenu();
  //     }
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }
}
