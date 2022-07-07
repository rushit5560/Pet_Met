import 'dart:async';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';

class AddressController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  var drawerController = ZoomDrawerController();

  List<AddressModel> addressList = [
    AddressModel(
      title: "Honduras",
      address: "1691 Vetug Boulevard",
      isChecked: true,
    ),
    AddressModel(
      title: "Mavlohige",
      address: "272 Wecdo Heights",
      isChecked: false,
    ),
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
