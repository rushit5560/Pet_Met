import 'dart:async';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';

class IndexScreenController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;

  var drawerController = ZoomDrawerController();

  List screenPages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
