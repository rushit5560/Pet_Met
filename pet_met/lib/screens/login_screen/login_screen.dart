import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_passfield.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/login_controller.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  final themeProvider = Provider.of<DarkThemeProvider>(Get.context!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? "assets/images/path_top_right_dark.png"
                  : "assets/images/path_top_right_light.png"),
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

                    CustomLightTextField(
                      fieldController: controller.mailController,
                      height: controller.size.height * 0.065,
                      width: double.infinity,
                      hintText: "Email Address",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      validator: (val) => Validations().validateEmail(val!),
                    ),
                    SizedBox(height: 2.h),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRouteNames.forgotPassRoute);
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
                    SizedBox(height: 20),
                    Divider(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.55)
                          : AppColors.blackTextColor.withOpacity(0.55),
                      // height: 1,
                      thickness: 0.5,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Login With Gmail or Facebook",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor.withOpacity(0.75)
                                : AppColors.blackTextColor.withOpacity(0.7),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // SizedBox(height: controller.size.height * 0.1),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // controller.signInWithGoogleFunction();
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
                        ),
                        SizedBox(width: 15),
                        Expanded(
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
                    // SizedBox(height: controller.size.height * 0.12),
                    Spacer(),
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
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRouteNames.registerRoute);
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
            )
          ],
        ),
      ),
    );
  }
}
