import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NgoUserProfileScreenController extends GetxController{
  final size = Get.size;
  XFile? imageFile = XFile("");
  RxString selectedGenderValue = "Male".obs;

  var nameController = TextEditingController();

}