import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class PetActivityController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }
}
