import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class UserProfileEditController extends GetxController {
  final size = Get.size;

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var locationController = TextEditingController();

  RxString selectedGenderValue = "Male".obs;

  List<DropdownMenuItem<String>> get dropdownGenderItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Male"), value: "Male"),
      const DropdownMenuItem(child: Text("Female"), value: "Female"),
      const DropdownMenuItem(child: Text("Other"), value: "Other"),
    ];
    return menuItems;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
