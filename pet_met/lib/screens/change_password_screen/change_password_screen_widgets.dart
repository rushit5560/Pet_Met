import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/change_password_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
          themeProvider.darkTheme ?
          AppImages.backgroundImgDark : AppImages.backgroundImgLight
      ),
    );
  }
}

/*class TextFieldSection extends StatelessWidget {
  //TextFieldSection({Key? key}) : super(key: key);

  final screenController = Get.find<ChangePasswordScreenController>();

  String? fieldName;
  String? fieldHinttext;
  final TextEditingController? fieldController;
  final String? Function(String?)? validator;

  TextFieldSection({
    this.fieldName,
    this.fieldHinttext,
    this.fieldController,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              fieldName!,
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        CustomLightTextField(
          fieldController: fieldController,

          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: fieldHinttext,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: validator,
        ),
      ],
    );
  }
}*/

class CurrentPasswordTextField extends StatelessWidget {
  CurrentPasswordTextField({Key? key}) : super(key: key);

  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Current Password",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Obx(()=>
           Stack(
            children: [
              Container(
                height: screenController.size.height * 0.05,
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
                controller: screenController.currentPasswordController,
                validator: (val) => Validations().validatePassword(val!),
                obscureText: screenController.isPasswordVisible.value,
                textInputAction: TextInputAction.next,
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
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  hintText: "Current Password",
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
                        screenController.isPasswordVisible.value =
                        !screenController.isPasswordVisible.value;
                      },
                      child: Icon(
                          screenController.isPasswordVisible.value
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 20,
                          color: Colors.grey),
                    ),
                  )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NewPasswordTextField extends StatelessWidget {
  NewPasswordTextField({Key? key}) : super(key: key);

  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "New Password",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Obx(()=>
           Stack(
            children: [
              Container(
                height: screenController.size.height * 0.05,
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
                controller: screenController.newPasswordController,
                obscureText: screenController.isNewPasswordVisible.value,
                validator: (val) => Validations().validateNewPassword(val!),
                textInputAction: TextInputAction.next,
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
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  hintText: "New Password",
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
                          screenController.isNewPasswordVisible.value =
                          !screenController.isNewPasswordVisible.value;
                        },
                        child: Icon(
                            screenController.isNewPasswordVisible.value
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: Colors.grey),
                      ),
                    )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  ConfirmPasswordTextField({Key? key}) : super(key: key);

  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Confirm Password",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Obx(()=>
           Stack(
            children: [
              Container(
                height: screenController.size.height * 0.05,
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
                controller: screenController.confirmPasswordController,
                obscureText: screenController.isConfirmPasswordVisible.value,
                validator: (val) => Validations().validateConfirmPassword(val!, screenController.newPasswordController.text),
                textInputAction: TextInputAction.next,
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
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  hintText: "Confirm Password",
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
                          screenController.isConfirmPasswordVisible.value =
                          !screenController.isConfirmPasswordVisible.value;
                        },
                        child: Icon(
                            screenController.isConfirmPasswordVisible.value
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: Colors.grey),
                      ),
                    )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class SaveButton extends StatelessWidget {
  SaveButton({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();


  @override
  Widget build(BuildContext context) {
    return
    // screenController.isLoading.value ?
    // SizedBox(
    //   // width: double.infinity,
    //   height: 60,
    //   child: LoadingAnimationWidget.staggeredDotsWave(
    //     color: AppColors.accentTextColor,
    //     size: 40,
    //   ),
    // ):
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: GestureDetector(
          onTap: () {
            // controller.submitLoginForm();
            if(screenController.formKey.currentState!.validate()){
              screenController.changePasswordFunction();
            }

          },
          child: Container(
            width: double.infinity,
            height: 60,
            //margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
    );
  }
}