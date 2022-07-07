import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:sizer/sizer.dart';

class UserProfileEditController extends GetxController {
  final size = Get.size;

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var locationController = TextEditingController();

  XFile? imageFile = XFile("");

  RxString selectedGenderValue = "Male".obs;

  List<DropdownMenuItem<String>> get dropdownGenderItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Male",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Male",
      ),
      DropdownMenuItem(
        child: Text(
          "Female",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Female",
      ),
      DropdownMenuItem(
        child: Text(
          "Other",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Other",
      ),
    ];
    return menuItems;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
