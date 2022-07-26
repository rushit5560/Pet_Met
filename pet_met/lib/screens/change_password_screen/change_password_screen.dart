import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/change_password_screen_controller.dart';
import 'package:pet_met/screens/change_password_screen/change_password_screen_widgets.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

import '../../utils/common_widgets/loader.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final controller = Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Column(
            children: [
              CustomAppBar(
                appBarOption: AppBarOption.singleBackButtonOption,
                title: "Change Password",
              ),
              Expanded(
                child: Obx(
                  () => controller.isLoading.value
                      ? const CustomAnimationLoader()
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  // TextFieldSection(
                                  //   fieldController: controller.currentPasswordController,
                                  //   fieldName: "Current Password",
                                  //   fieldHinttext: "Current Password",
                                  //   validator: (val) => Validations().validatePassword(val!),
                                  // ),
                                  CurrentPasswordTextField(),
                                  SizedBox(height: 2.h),

                                  NewPasswordTextField(),
                                  // TextFieldSection(
                                  //   fieldController: controller.newPasswordController,
                                  //   fieldName: "New Password",
                                  //   fieldHinttext: "New Password",
                                  //   validator: (val) => Validations().validateNewPassword(val!),
                                  // ),

                                  SizedBox(height: 2.h),

                                  ConfirmPasswordTextField(),
                                  // TextFieldSection(
                                  //   fieldController: controller.confirmPasswordController,
                                  //   fieldName: "Confirm Password",
                                  //   fieldHinttext: "Confirm Password",
                                  //   validator: (val) => Validations().validateConfirmPassword(val!, controller.newPasswordController.text),
                                  // ),

                                  // SizedBox(height: 3.h),
                                  //
                                  // SaveButton(),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              SaveButton(),
              SizedBox(height: 1.h),
            ],
          )
        ],
      ),
    ));
  }
}
