import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class ShopUserProfileScreenController extends GetxController{
  final size = Get.size;
  XFile? imageFile = XFile("");
  RxString selectedGenderValue = "Male".obs;

  var nameController = TextEditingController();

}