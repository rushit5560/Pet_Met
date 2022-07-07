import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/register_controller.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_light_passfield.dart';
import '../../utils/common_widgets/custom_light_textfield.dart';
import '../../utils/validations.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/logintopright.png"),
          ),
          BackGroundLeftShadow(
            height: controller.size.height * 0.3,
            width: controller.size.height * 0.3,
            topPad: controller.size.height * 0.28,
            leftPad: -controller.size.width * 0.15,
          ),
          Positioned(
            top: controller.size.height * 0.06,
            left: controller.size.width * 0.12,
            child: Image.asset(
              "assets/images/petmet_logo.png",
              width: controller.size.width * 0.25,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: controller.size.width * 0.07,
              vertical: controller.size.height * 0.01,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: controller.size.height * 0.24),
                  Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          color: AppColors.accentTextColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Create a Account to start Using",
                        style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomLightTextField(
                    fieldController: controller.mailController,
                    height: controller.size.height * 0.065,
                    width: double.infinity,
                    hintText: "Email Address",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: (val) => Validations().validateEmail(val!),
                  ),
                  const SizedBox(height: 20),
                  CustomLightTextField(
                    fieldController: controller.nameController,
                    height: controller.size.height * 0.065,
                    width: double.infinity,
                    hintText: "Name",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: (val) => Validations().validateUserName(val!),
                  ),
                  const SizedBox(height: 20),
                  CustomLightPassField(
                    fieldController: controller.passController,
                    height: controller.size.height * 0.065,
                    width: double.infinity,
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    validator: (val) => Validations().validatePassword(val!),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Container(
                          height: 40,
                          width: 40,
                          child: Checkbox(
                            checkColor: AppColors.blackTextColor,
                            activeColor: AppColors.blackColor,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected))
                                  return AppColors.whiteColor;
                                return AppColors
                                    .greyTextColor; // Use the default value.
                              },
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            value: controller.selectedTerms.value,
                            onChanged: (val) {
                              controller.selectedTerms.value =
                                  !controller.selectedTerms.value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: controller.size.width * 0.65,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            text: "By Signing up i Agree to the ",
                            children: [
                              TextSpan(
                                text: "term and Condition & privacy Police",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.8),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: controller.size.height * 0.1),
                  Spacer(),

                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.accentTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      controller.submitRegisterForm();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
