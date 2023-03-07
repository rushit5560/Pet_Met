import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/register_controller.dart';
import 'package:pet_met/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:pet_met/screens/register_screen/register_screen_widgets.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import 'dart:io' show Platform;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());

  final themeProvider = Provider.of<DarkThemeProvider>(Get.context!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.whiteColor,
      body: GestureDetector(
        onTap: () => hideKeyboard(),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(themeProvider.darkTheme
                    ? AppImages.backgroundImgDark
                    : AppImages.backgroundImgLight),
              ),
              BackGroundLeftShadow(
                height: controller.size.height * 0.3,
                width: controller.size.height * 0.3,
                topPad: controller.size.height * 0.28,
                leftPad: -controller.size.width * 0.15,
              ),
              Positioned(
                top: controller.size.height * 0.03,
                left: controller.size.width * 0.1,
                child: Image.asset(
                  AppImages.petMetLogoImg,
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
                      SizedBox(height: controller.size.height * 0.2),
                      Row(
                        children: [
                          Text(
                            "Register",
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
                            "Create a Account to start Using",
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
                      SizedBox(height: 5.h),
                      // CustomLightTextField(
                      //   fieldController: controller.mailController,
                      //   height: controller.size.height * 0.065,
                      //   width: double.infinity,
                      //   hintText: "Email Address",
                      //   textInputAction: TextInputAction.next,
                      //   textInputType: TextInputType.emailAddress,
                      //   validator: (val) => Validations().validateEmail(val!),
                      // ),
                      EmailTextFieldModule(),
                      SizedBox(height: 2.h),
                      NameTextFieldModule(),
                      // CustomLightTextField(
                      //   fieldController: controller.nameController,
                      //   height: controller.size.height * 0.065,
                      //   width: double.infinity,
                      //   hintText: "Name",
                      //   textInputAction: TextInputAction.next,
                      //   textInputType: TextInputType.emailAddress,
                      //   validator: (val) =>
                      //       Validations().validateUserName(val!),
                      // ),
                      SizedBox(height: 2.h),
                      PasswordTextFieldModule(),
                      // CustomLightPassField(
                      //   fieldController: controller.passController,
                      //   height: controller.size.height * 0.065,
                      //   width: double.infinity,
                      //   hintText: "Password",
                      //   textInputAction: TextInputAction.done,
                      //   validator: (val) =>
                      //       Validations().validatePassword(val!),
                      // ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => SizedBox(
                              height: 40,
                              width: 40,
                              child: Checkbox(
                                checkColor: themeProvider.darkTheme
                                    ? AppColors.blackTextColor
                                    : AppColors.whiteColor,
                                activeColor: AppColors.whiteColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    // if (states
                                    //     .contains(MaterialState.selected)) {
                                    //   return AppColors.greyColor;
                                    //   // the default value.
                                    // }
                                    return AppColors.accentColor;
                                  },
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                value: controller.selectedTerms.value,
                                onChanged: (val) {
                                  controller.selectedTerms.value =
                                      !controller.selectedTerms.value;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "By Signing up i Agree to the ",
                                style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor.withOpacity(0.75)
                                      : AppColors.greyTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "terms and Conditions",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                                .withOpacity(0.75)
                                            : AppColors.greyTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " & ",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                              .withOpacity(0.75)
                                          : AppColors.greyTextColor,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => PrivacyPolicyScreen(),
                                          transition: Transition.native,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    },
                                    child: Text(
                                      "privacy Policy",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                                .withOpacity(0.75)
                                            : AppColors.greyTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          /*Container(
                            width: controller.size.width * 0.65,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor.withOpacity(0.75)
                                      : AppColors.greyTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                text: "By Signing up i Agree to the ",
                                children: [
                                  TextSpan(
                                    text: "term and Condition & privacy Policy",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor
                                              .withOpacity(0.8),
                                      fontSize: 11.sp,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                        ],
                      ),
                      // SizedBox(height: controller.size.height * 0.1),
                      const Spacer(),

                      Platform.isAndroid
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      await controller
                                          .signInWithGoogleFunction();
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
                                                ? AppColors.blackColor
                                                    .withOpacity(0.25)
                                                : AppColors.greyTextColor
                                                    .withOpacity(0.25),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: const Offset(4, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                const SizedBox(width: 15),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // await controller.signInWithFacebookFunction();
                                      Fluttertoast.showToast(
                                          msg: 'Coming soon');
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
                                                ? AppColors.blackColor
                                                    .withOpacity(0.25)
                                                : AppColors.greyTextColor
                                                    .withOpacity(0.25),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                          : Container(),
                      const SizedBox(height: 15),
                      // Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor.withOpacity(0.75)
                                  : AppColors.greyTextColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
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
                      ),
                      SizedBox(height: 2.5.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
