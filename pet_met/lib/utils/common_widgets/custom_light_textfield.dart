import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomLightTextField extends StatelessWidget {
  const CustomLightTextField({
    Key? key,
    this.fieldController,
    this.height,
    this.width,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? fieldController;
  final double? height;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
      child: Center(
        child: TextFormField(
          controller: fieldController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
