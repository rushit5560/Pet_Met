import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomLightPassField extends StatefulWidget {
  const CustomLightPassField({
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
  State<CustomLightPassField> createState() => _CustomLightPassFieldState();
}

class _CustomLightPassFieldState extends State<CustomLightPassField> {
  var obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
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
          obscureText: obscureText,
          controller: widget.fieldController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: widget.height! * 0.25,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye_rounded,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
