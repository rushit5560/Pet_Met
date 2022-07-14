import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/add_address_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_images.dart';

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(AppImages.tealBackgroundImg),
    );
  }
}

class TextFieldSection extends StatelessWidget {
  //TextFieldSection({Key? key}) : super(key: key);

  final screenController = Get.find<AddAddressController>();

  String? fieldName;
  String? fieldHinttext;
  TextFieldSection({this.fieldName, this.fieldHinttext});

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
          // fieldController: controller.nameController,

          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: fieldHinttext,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          // validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class AddAddressByLocation extends StatelessWidget {
  const AddAddressByLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Add Address by Location",
              style: TextStyle(
                color: AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          height: 10.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/image_placeholder.png",
                height: 8.w,
              ),
              SizedBox(width: 5.w),
              Text(
                "Google Maps",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.greyTextColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.submitLoginForm();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
