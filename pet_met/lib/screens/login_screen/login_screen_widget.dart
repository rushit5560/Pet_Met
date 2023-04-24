import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/login_controller.dart';
import 'package:pet_met/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:pet_met/screens/register_screen/register_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import 'dart:io' show Platform;

// ignore: must_be_immutable
class BackgroundImage extends StatelessWidget {
  BackgroundImage({Key? key}) : super(key: key);

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(themeProvider.darkTheme
          ? AppImages.backgroundImgDark
          : AppImages.backgroundImgLight),
    );
  }
}

class PetMetLogoModule extends StatelessWidget {
  PetMetLogoModule({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: controller.size.height * 0.03,
      left: controller.size.width * 0.1,
      child: Image.asset(
        AppImages.petMetLogoImg,
        width: controller.size.width * 0.25,
      ),
    );
  }
}

class LoginModule extends StatelessWidget {
  LoginModule({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: controller.size.width * 0.07,
        vertical: controller.size.height * 0.01,
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            SizedBox(height: controller.size.height * 0.2),

            Row(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.accentTextColor,
                    fontSize: 22.sp,
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
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor.withOpacity(0.75)
                        : AppColors.greyTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            // CustomLightTextField(
            //   fieldController: controller.mailController,
            //   height: controller.size.height * 0.065,
            //   width: double.infinity,
            //   hintText: "Email Address",
            //   textInputAction: TextInputAction.next,
            //   textInputType: TextInputType.emailAddress,
            //   validator: (val) => Validations().validateEmail(val!),
            // ),
            emailTextFieldModule(),

            SizedBox(height: 2.h),
            passwordTextFieldModule(),
            // CustomLightPassField(
            //   fieldController: controller.passController,
            //   height: controller.size.height * 0.065,
            //   width: double.infinity,
            //   hintText: "Password",
            //   textInputAction: TextInputAction.done,
            //   validator: (val) => Validations().validatePassword(val!),
            // ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ForgotPasswordScreen(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.75)
                          : AppColors.blackTextColor.withOpacity(0.7),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            // Divider(
            //   color: themeProvider.darkTheme
            //       ? AppColors.whiteColor.withOpacity(0.55)
            //       : AppColors.blackTextColor.withOpacity(0.55),
            //   // height: 1,
            //   thickness: 0.5,
            // ),
            // SizedBox(height: 20),
            // Row(
            //   children: [
            //     Text(
            //       "Login With Gmail or Facebook",
            //       style: TextStyle(
            //         color: themeProvider.darkTheme
            //             ? AppColors.whiteColor.withOpacity(0.75)
            //             : AppColors.blackTextColor.withOpacity(0.7),
            //         fontSize: 11.sp,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 45),
            // SizedBox(height: controller.size.height * 0.1),
            // Spacer(),

            Platform.isAndroid
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.signInWithGoogleFunction();
                            // Fluttertoast.showToast(msg: 'This feature is coming soon');
                          },
                          child: Container(
                            height: controller.size.height * 0.065,
                            decoration: BoxDecoration(
                              color: themeProvider.darkTheme
                                  ? AppColors.darkThemeColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: themeProvider.darkTheme
                                      ? AppColors.blackColor.withOpacity(0.25)
                                      : AppColors.greyTextColor
                                          .withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.googleImg,
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
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            // await controller.facebookLogin();
                            Fluttertoast.showToast(msg: 'Coming soon');
                          },
                          child: Container(
                            height: controller.size.height * 0.065,
                            decoration: BoxDecoration(
                              color: themeProvider.darkTheme
                                  ? AppColors.darkThemeColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: themeProvider.darkTheme
                                      ? AppColors.blackColor.withOpacity(0.25)
                                      : AppColors.greyTextColor
                                          .withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.facebookImg,
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
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await controller.signInWithGoogleFunction();
                          // Fluttertoast.showToast(msg: 'This feature is coming soon');
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: themeProvider.darkTheme
                                    ? AppColors.blackColor.withOpacity(0.25)
                                    : AppColors.greyTextColor.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppImages.googleImg,
                            height: 25,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () async {
                          await controller.signInWithAppleFunction();

                          // Fluttertoast.showToast(msg: 'This feature is coming soon');
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: themeProvider.darkTheme
                                    ? AppColors.blackColor.withOpacity(0.25)
                                    : AppColors.greyTextColor.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(AppImages.appleImg,
                              height: 25,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.darkThemeColor),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () async {
                          Fluttertoast.showToast(msg: 'Coming soon');

                          // Fluttertoast.showToast(msg: 'This feature is coming soon');
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: themeProvider.darkTheme
                                    ? AppColors.blackColor.withOpacity(0.25)
                                    : AppColors.greyTextColor.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppImages.facebookImg,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
            // SizedBox(height: controller.size.height * 0.12),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have An Account yet? ",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor.withOpacity(0.75)
                        : AppColors.greyTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegisterScreen(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 500));
                    controller.mailController.clear();
                    controller.passController.clear();
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),

            Obx(
              () => controller.isLoading.value
                  ? SizedBox(
                      // width: double.infinity,
                      height: 60,
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.accentTextColor,
                        size: 40,
                      ),
                    )
                  : GestureDetector(
                      onTap: () async {
                        await controller.submitLoginForm();
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
            ),
            SizedBox(height: 2.5.h),
          ],
        ),
      ),
    );
  }

  Widget emailTextFieldModule() {
    return Stack(
      children: [
        Container(
          height: controller.size.height * 0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.05)
                    : AppColors.greyTextColor.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0.1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: controller.mailController,
          validator: (val) => Validations().validateEmail(val!),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          cursorColor: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.accentTextColor,
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            fillColor: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            hintText: "Email Address",
            hintStyle: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordTextFieldModule() {
    return Obx(
      () => Stack(
        children: [
          Container(
            height: controller.size.height * 0.05,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor.withOpacity(0.05)
                      : AppColors.greyTextColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: controller.passController,
            validator: (val) => Validations().validatePassword(val!),
            obscureText: controller.isPasswordVisible.value,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.accentTextColor,
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
                fillColor: themeProvider.darkTheme
                    ? AppColors.darkThemeBoxColor
                    : AppColors.whiteColor,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.greyTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                    child: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 20,
                        color: Colors.grey),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
