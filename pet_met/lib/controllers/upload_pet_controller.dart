import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';

class UploadPetController extends GetxController {
  final size = Get.size;

  var petNameController = TextEditingController();

  RxString selectedPetGenderValue = "Male".obs;
  RxString selectedPetTypeValue = "Grown".obs;
  RxString selectedAvailabilityValue = "Yes".obs;

  XFile? imageFile = XFile("");

  List<DropdownMenuItem<String>> get dropdownPetGenderItems {
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

  List<DropdownMenuItem<String>> get dropdownPetTypeItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Child",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Child",
      ),
      DropdownMenuItem(
        child: Text(
          "Adult",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Adult",
      ),
      DropdownMenuItem(
        child: Text(
          "Grown",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Grown",
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownAvailabilityItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Yes",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Yes",
      ),
      DropdownMenuItem(
        child: Text(
          "No",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "No",
      ),
    ];
    return menuItems;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
