import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/forgot_password_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';



class BackgroundCurve extends StatelessWidget {
  BackgroundCurve({Key? key}) : super(key: key);

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

class BackButtonModule extends StatelessWidget {
  BackButtonModule({Key? key}) : super(key: key);

  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        AppIcons.backButtonImg,
        width: controller.size.width * 0.07,
      ),
    );
  }
}

class ForgotPasswordModule extends StatelessWidget {
  ForgotPasswordModule({Key? key}) : super(key: key);

  final controller = Get.find<ForgotPasswordController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: SizedBox(
              height: 75.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Enter Your Email To reset Your Password",
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // const SizedBox(height: 15),

                  CustomLightTextField(
                    fieldController: controller.emailController,
                    readOnly: false,
                    height: controller.size.height * 0.05,
                    width: double.infinity,
                    hintText: "Email Address",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    validator: (val) => Validations().validateEmail(val!),
                  ),

                  SizedBox(height: 4.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Enter Your registered email and we will send you email contains link to reset your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.75)
                            : AppColors.greyTextColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(controller.formKey.currentState!.validate()) {
          await controller.forgotPasswordFunction();
        }
        // Fluttertoast.showToast(msg: "Coming soon!");
      },
      child: Container(
        width: double.infinity,
        height: 60,
        margin:const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
