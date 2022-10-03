import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class MettingAddressInfoController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }
}
