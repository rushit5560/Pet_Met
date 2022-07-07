import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

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
  }) : super(key: key);

  final TextEditingController? fieldController;
  final double? height;
  final double? width;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: AppColors.greyTextColor.withOpacity(0.25),
                blurRadius: 35,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: fieldController,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
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
              color: AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
