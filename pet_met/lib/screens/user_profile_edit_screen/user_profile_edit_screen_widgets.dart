import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_profile_edit_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

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

class UploadImageModule extends StatelessWidget {
  UploadImageModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.loadFileRoute);
        // showModalBottomSheet<void>(
        //   context: context,
        //   constraints: null,
        //   builder: (BuildContext context) {
        //     return Container(
        //       height: controller.size.height * 0.15,
        //       child: Column(
        //         children: [
        //           ListTile(
        //             onTap: getFromCamera,
        //             contentPadding: EdgeInsets.only(
        //                 left:
        //                     controller.size.width * 0.1),
        //             title: Text(
        //               "Select Image From Camera",
        //               style: TextStyle(
        //                 color: AppColors.blackTextColor
        //                     .withOpacity(0.7),
        //                 fontSize: 13.sp,
        //                 fontWeight: FontWeight.w600,
        //               ),
        //             ),
        //           ),
        //           ListTile(
        //             contentPadding: EdgeInsets.only(
        //                 left:
        //                     controller.size.width * 0.1),
        //             onTap: getFromGallery,
        //             title: Text(
        //               "Select Image From Gallery",
        //               style: TextStyle(
        //                 color: AppColors.blackTextColor
        //                     .withOpacity(0.7),
        //                 fontSize: 13.sp,
        //                 fontWeight: FontWeight.w600,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // );
      },
      child: Container(
        //height: controller.size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
            image: FileImage(
              File(controller.imageFile!.path),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyTextColor.withOpacity(0.3),
              blurRadius: 35,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: controller.imageFile!.path.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        themeProvider.darkTheme
                            ? AppImages.cameraPlaceHolderImgDark
                            : AppImages.cameraPlaceHolderImglight,
                        height: 65,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Upload Image",
                        style: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}

class TextFieldSection extends StatelessWidget {
  //const TextFieldSection({Key? key}) : super(key: key);

  String? fieldName;
  String? fieldHinttext;
  TextFieldSection({this.fieldName, this.fieldHinttext});

  final controller = Get.find<UserProfileEditController>();

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
                color: AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          fieldController: controller.nameController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: fieldHinttext,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class GenderDropDownModule extends StatefulWidget {
  GenderDropDownModule({Key? key}) : super(key: key);

  @override
  State<GenderDropDownModule> createState() => _GenderDropDownModuleState();
}

class _GenderDropDownModuleState extends State<GenderDropDownModule> {
  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Gender",
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
        const SizedBox(height: 8),
        Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyTextColor.withOpacity(0.3),
                blurRadius: 35,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
              ),
              value: controller.selectedGenderValue.value,
              isDense: true,
              isExpanded: true,
              items: controller.dropdownGenderItems,
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedGenderValue.value = val!;
                });
              },
            ),
          ),
        )
      ],
    );
  }
}

class BirthDateModule extends StatelessWidget {
  BirthDateModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Birthdate",
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
        const SizedBox(height: 8),
        Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.05)
                    : AppColors.greyTextColor.withOpacity(0.05),
                blurRadius: 15,
                spreadRadius: 0.1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: DropdownDatePicker(
            boxDecoration: BoxDecoration(
              // border: Border.,
              borderRadius: BorderRadius.circular(5),
            ), // optional
            dayFlex: 2,
            monthFlex: 3,
            yearFlex: 2,
            textStyle: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.greyTextColor
                  : AppColors.greyTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.greyTextColor,
            ),
            isDropdownHideUnderline: true, // optional
            isFormValidator: true, // optional
            startYear: 1900, // optional
            endYear: 2020, // optional
            width: 10,

            selectedDay: 14, // optional
            selectedMonth: 10, // optional
            selectedYear: 1993, // optional
            onChangedDay: (value) => print('onChangedDay: $value'),
            onChangedMonth: (value) => print('onChangedMonth: $value'),
            onChangedYear: (value) => print('onChangedYear: $value'),
            // showDay: false,// optional
            // dayFlex: 2,// optional
            // locale: "zh_CN",// optional
          ),
        )
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.submitLoginForm();
      },
      child: Container(
        width: double.infinity,
        height: 50,
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
