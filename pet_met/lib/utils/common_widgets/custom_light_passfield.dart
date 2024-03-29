import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';


class CustomLightPassField extends StatefulWidget {
  const CustomLightPassField({
    Key? key,
    this.fieldController,
    this.height,
    this.width,
    this.hintText,
    this.textInputAction,
    this.validator,
    this.textInputType,
  }) : super(key: key);

  final TextEditingController? fieldController;
  final double? height;
  final double? width;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  @override
  State<CustomLightPassField> createState() => _CustomLightPassFieldState();
}

class _CustomLightPassFieldState extends State<CustomLightPassField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Stack(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.05)
                    : AppColors.greyTextColor.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 0.1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: widget.fieldController,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          cursorColor: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.accentTextColor,
          keyboardType: widget.textInputType,
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
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: widget.height! * 0.25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            // enabledBorder: InputBorder.none,
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.greyTextColor,
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
      ],
    );
  }
}
