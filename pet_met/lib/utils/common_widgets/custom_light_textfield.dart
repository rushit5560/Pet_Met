import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class CustomLightTextField extends StatelessWidget {
  const CustomLightTextField({
    Key? key,
    this.fieldController,
    this.height,
    this.width,
    this.hintText,
    this.validator,
    this.textInputType,
    this.textInputAction,
    this.readOnly,
    this.maxLength
  }) : super(key: key);

  final TextEditingController? fieldController;
  final double? height;
  final double? width;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? readOnly;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Stack(
      children: [
        Container(
          height: Get.height * 0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.05)
                    : AppColors.greyTextColor.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0.5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        TextFormField(
          readOnly: readOnly!,
          controller: fieldController,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLength: maxLength,
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
              counterText: "",
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
          ),
        ),
        /*TextFormField(
          controller: fieldController,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: textInputType,
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
            hintText: hintText,
            hintStyle: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),*/
      ],
    );
  }
}
