import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class RegisterController extends GetxController {
  final size = Get.size;

  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool selectedTerms = false.obs;

  final formKey = GlobalKey<FormState>();

  submitRegisterForm() {
    if (formKey.currentState!.validate()) {
      try {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text("Form Submitted"),
            duration: Duration(seconds: 3),
          ),
        );
        Get.toNamed(AppRouteNames.indexScreenRoute);
      } catch (e) {
        throw e;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
