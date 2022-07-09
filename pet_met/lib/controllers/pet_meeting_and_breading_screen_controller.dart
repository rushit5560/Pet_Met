import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetMeetingAndBreadingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  TextEditingController searchFieldController = TextEditingController();

  RxBool checkBoxValue = false.obs;



}