import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/add_new_payment_screen_controller.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

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

class CardNumberTextField extends StatelessWidget {
  CardNumberTextField({Key? key}) : super(key: key);

  final screenController = Get.find<AddNewPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Card Number",
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
            Stack(
              children: [
                Container(
                  height: screenController.size.height * 0.05,
                  //width: double.infinity,
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
                  controller: screenController.cardNumberController,
                  validator: (val) => Validations().validatePassword(val!),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
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
                      hintText: "Card Number",
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
            ),
      ],
    );
  }
}

class NameOnCardTextField extends StatelessWidget {
  NameOnCardTextField({Key? key}) : super(key: key);

  final screenController = Get.find<AddNewPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Name On Card",
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
        Stack(
          children: [
            Container(
              height: screenController.size.height * 0.05,
              //width: double.infinity,
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
              controller: screenController.nameOnCardController,
              validator: (val) => Validations().validatePassword(val!),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
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
                hintText: "Name On Card",
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
        ),
      ],
    );
  }
}

class ExpiryDateTextField extends StatelessWidget {
  ExpiryDateTextField({Key? key}) : super(key: key);

  final screenController = Get.find<AddNewPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Expiry Date",
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
        Stack(
          children: [
            Container(
              height: screenController.size.height * 0.05,
              //width: double.infinity,
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
              controller: screenController.expiryDateController,
              //validator: (val) => Validations().validatePassword(val!),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
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
                hintText: "Expiry Date",
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
        ),
      ],
    );
  }
}

class CvvTextField extends StatelessWidget {
  CvvTextField({Key? key}) : super(key: key);

  final screenController = Get.find<AddNewPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "CVV",
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
        Stack(
          children: [
            Container(
              height: screenController.size.height * 0.05,
              //width: double.infinity,
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
              controller: screenController.cvvTextFieldController,
              //validator: (val) => Validations().validatePassword(val!),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
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
                hintText: "CVV",
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
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewPaymentScreenController>();


  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    screenController.isLoading.value ?
    SizedBox(
      // width: double.infinity,
      height: 60,
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColors.accentTextColor,
        size: 40,
      ),
    ):
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          // controller.submitLoginForm();
          if(screenController.formKey.currentState!.validate()){
            screenController.addNewPaymentFunction();
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
    ),
    );
  }
}