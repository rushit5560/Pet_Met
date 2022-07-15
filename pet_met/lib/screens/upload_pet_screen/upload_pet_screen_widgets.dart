import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/upload_pet_controller.dart';
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
      child: Image.asset(AppImages.tealBackgroundImg),
    );
  }
}

class UploadImageModule extends StatefulWidget {
  UploadImageModule({Key? key}) : super(key: key);

  @override
  State<UploadImageModule> createState() => _UploadImageModuleState();
}

class _UploadImageModuleState extends State<UploadImageModule> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          constraints: null,
          builder: (BuildContext context) {
            return Container(
              height: controller.size.height * 0.15,
              child: Column(
                children: [
                  ListTile(
                    onTap: getFromCamera,
                    contentPadding:
                        EdgeInsets.only(left: controller.size.width * 0.1),
                    title: Text(
                      "Select Image From Camera",
                      style: TextStyle(
                        color: AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.only(left: controller.size.width * 0.1),
                    onTap: getFromGallery,
                    title: Text(
                      "Select Image From Gallery",
                      style: TextStyle(
                        color: AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: controller.size.height * 0.2,
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
        child: controller.imageFile!.path.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.cameraPlaceHolderImg,
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
    );
  }

  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }
  }
}

class TextFieldSection extends StatelessWidget {
  //TextFieldSection({Key? key}) : super(key: key);

  String? fieldName;
  String? fieldHinttext;
  TextFieldSection({this.fieldName, this.fieldHinttext});

  final controller = Get.find<UploadPetController>();

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
        const SizedBox(height: 8),
        CustomLightTextField(
          // fieldController: controller.nameController,
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

class TypesOfPetDropDownModule extends StatefulWidget {
  const TypesOfPetDropDownModule({Key? key}) : super(key: key);

  @override
  State<TypesOfPetDropDownModule> createState() =>
      _TypesOfPetDropDownModuleState();
}

class _TypesOfPetDropDownModuleState extends State<TypesOfPetDropDownModule> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Types Of Pet",
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
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
              ),
              value: controller.selectedPetTypeValue.value,
              isDense: true,
              isExpanded: true,
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              items: controller.dropdownPetTypeItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedPetTypeValue.value = val!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MeetingAvailabilityDropDown extends StatefulWidget {
  const MeetingAvailabilityDropDown({Key? key}) : super(key: key);

  @override
  State<MeetingAvailabilityDropDown> createState() =>
      _MeetingAvailabilityDropDownState();
}

class _MeetingAvailabilityDropDownState
    extends State<MeetingAvailabilityDropDown> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Meeting Availability",
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
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.greyTextColor,
              ),
              value: controller.selectedAvailabilityValue.value,
              isDense: true,
              isExpanded: true,
              items: controller.dropdownAvailabilityItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedAvailabilityValue.value = val!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class BirthDateDropDown extends StatefulWidget {
  const BirthDateDropDown({Key? key}) : super(key: key);

  @override
  State<BirthDateDropDown> createState() => _BirthDateDropDownState();
}

class _BirthDateDropDownState extends State<BirthDateDropDown> {
  final controller = Get.find<UploadPetController>();

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
                color: AppColors.greyTextColor.withOpacity(0.3),
                blurRadius: 35,
                spreadRadius: 1,
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
              color: AppColors.blackTextColor.withOpacity(0.6),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.greyTextColor,
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
        ),
      ],
    );
  }
}

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({Key? key}) : super(key: key);

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  final controller = Get.find<UploadPetController>();

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
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.greyTextColor,
              ),
              value: controller.selectedPetGenderValue.value,
              isDense: true,
              isExpanded: true,
              items: controller.dropdownPetGenderItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.darkThemeColor
                    : AppColors.whiteColor,
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedPetGenderValue.value = val!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PetSubmitButton extends StatelessWidget {
  const PetSubmitButton({Key? key}) : super(key: key);

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
