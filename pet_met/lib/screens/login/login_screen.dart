import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/common_widgets/custom_light_passfield.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());
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
          Positioned(
            top: controller.size.height * 0.06,
            left: controller.size.width * 0.08,
            child: Image.asset(
              "assets/images/petmet_logo.png",
              width: controller.size.width * 0.25,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: controller.size.width * 0.08,
              vertical: controller.size.height * 0.01,
            ),
            child: Column(
              children: [
                SizedBox(height: controller.size.height * 0.25),
                Row(
                  children: [
                    Text(
                      "Login",
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
                      "Login With Your Account To continue",
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomLightTextField(
                  fieldController: controller.mailController,
                  height: controller.size.height * 0.065,
                  width: double.infinity,
                  hintText: "Email Address",
                ),
                const SizedBox(height: 15),
                CustomLightPassField(
                  fieldController: controller.passController,
                  height: controller.size.height * 0.065,
                  width: double.infinity,
                  hintText: "Password",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed();
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: AppColors.blackTextColor.withOpacity(0.7),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: controller.size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: controller.size.height * 0.065,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyTextColor.withOpacity(0.2),
                              spreadRadius: 15,
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/gmailicon.png",
                              height: 25,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "Gmail",
                              style: TextStyle(
                                color: AppColors.accentTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: controller.size.height * 0.065,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyTextColor.withOpacity(0.2),
                              spreadRadius: 15,
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/fbicon.png",
                              height: 25,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                color: AppColors.accentTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: controller.size.height * 0.12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have An Account yet? ",
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {},
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
                        "Login",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
