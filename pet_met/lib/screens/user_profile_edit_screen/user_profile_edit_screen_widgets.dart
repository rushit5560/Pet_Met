import 'dart:developer';
import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/user_profile_edit_controller.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/enums.dart';
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
        //Get.toNamed(AppRouteNames.loadFileRoute);
        modelBottomSheet(context);
      },
      child: Container(
        height: controller.size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          // image: controller.imageFile != null ?
          //   DecorationImage(
          //       image: FileImage(
          //           File(themeProvider.darkTheme
          //           ? controller.imageFile!.path: controller.imageFile!.path))):
          // DecorationImage(
          //     image: NetworkImage(
          //       themeProvider.darkTheme
          //           ?
          //       controller.userProfile : controller.userProfile,
          //     )),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyTextColor.withOpacity(0.3),
              blurRadius: 35,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: controller.imageFile != null
            ? Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    themeProvider.darkTheme
                        ? controller.imageFile!
                        : controller.imageFile!,
                    width: double.infinity,
                    height: controller.size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : controller.userProfile.isNotEmpty
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        themeProvider.darkTheme
                            ? controller.userProfile
                            : controller.userProfile,
                        width: double.infinity,
                        height: controller.size.height * 0.2,
                        fit: BoxFit.cover,
                        errorBuilder: (context, er, bt) {
                          //return Image.asset(AppImages.petMetLogoImg, height: 65);
                          return Column(
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
                          );
                        },
                      ),
                    ),
                  )
                : Center(
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
                  ),
      ),
    );
  }

  modelBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
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
  }

  /// Get from gallery
  getFromGallery() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      log('Camera File Path : ${controller.imageFile}');
      log('Camera Image Path : ${controller.imageFile!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    controller.imageFile = File(pickedFile!.path);
    //setState(() {});
    Get.back();
  }

  /// Get from Camera
  getFromCamera() async {
    // XFile? pickedFile = await ImagePicker().pickImage(
    //   source: ImageSource.camera,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    // if (pickedFile != null) {
    //   setState(() {
    //     controller.imageFile = XFile(pickedFile.path);
    //   });
    // }
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      //setState(() {
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      log('Camera File Path : ${controller.imageFile}');
      log('Camera Image Path : ${controller.imageFile!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    controller.imageFile = File(pickedFile!.path);
    // setState(() {});
    Get.back();
  }
}

class UserPetListModule extends StatelessWidget {
  UserPetListModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(
        "Your pets:",
        style: TextStyle(color: themeProvider.darkTheme
            ? AppColors.whiteColor
            : AppColors.blackTextColor, fontWeight: FontWeight.bold, fontSize: 17),
      ),
      const SizedBox(height: 8),

      Row(
        children: [
          controller.petList.length == 5 ? Container() :
          Stack(
              children: [
            Container(
              height: 8.h,
              width: 8.h,
              margin: const EdgeInsets.only(bottom: 5, right: 5),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage(
                //       controller.dogsTopList[index],
                //     ),
                //     fit: BoxFit.cover),
                //color: AppColors.greyTextColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(AppImages.petMetLogoImg, fit: BoxFit.cover)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  // petOption == PetOption.addOption ?
                  // ""
                  //     : "";
                  //    // :

                  Get.to(() => UploadPetScreen(),
                      transition: Transition.native,
                      duration: const Duration(milliseconds: 500),
                      arguments: [PetOption.addOption, ""]);
                },
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                    size: 12,
                  ),
                ),
              ),
            )
          ]),
          controller.petList.length == 5 ? Container() : const SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 8.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.petList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log('Pet Id : ${controller.petList[index].id}');
                      Get.to(()=> UploadPetScreen(),
                          transition: Transition.native,
                          duration: const Duration(milliseconds: 500),
                          arguments: [
                            PetOption.updateOption,
                            controller.petList[index].id
                          ]);
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 8.h,
                          width: 7.h,
                          margin: const EdgeInsets.only(
                              bottom: 5, right: 5),
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       controller.dogsTopList[index],
                            //     ),
                            //     fit: BoxFit.cover),
                            //color: AppColors.greyTextColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                                ApiUrl.apiImagePath + controller.petList[index].image,
                                errorBuilder: (context, st, ob) {
                                  return Image.asset(AppImages.petMetLogoImg);
                                }, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          )
        ],
      )
    ]);
  }
}

/*class TextFieldSection extends StatelessWidget {
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
}*/

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor.withOpacity(0.7)
                      : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: controller.nameController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: "Name",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.7)
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: true,
          fieldController: controller.emailController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: "Email",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          //validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class MobileNumberTextFieldModule extends StatelessWidget {
  MobileNumberTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Mobile Number",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.7)
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: controller.mobileController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: "**** ** ***",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateMobile(val!),
        ),
      ],
    );
  }
}

class LocationTextFieldModule extends StatelessWidget {
  LocationTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.7)
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          fieldController: controller.locationController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: "**** ** ***",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateLocation(val!),
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
                    ? AppColors.whiteColor.withOpacity(0.7)
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Stack(
          children: [
            Container(
              height: controller.size.height * 0.06,
              width: double.infinity,
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
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 10),
                width: Get.width,
                //gives the width of the dropdown button
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //color: Colors.grey.shade200,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.grey.shade100,
                    buttonTheme: ButtonTheme.of(context).copyWith(
                      alignedDropdown: true,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedGenderValue.value,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: <String>[
                        'Male',
                        'Female',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor.withOpacity(0.7),
                              fontSize: 13.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) {
                        // controller.petCategoryDropDownValue = value!;
                        // controller.loadUI();

                        controller.isLoading(true);
                        controller.selectedGenderValue.value = value!;
                        // controller.areaList.clear();
                        // authScreenController.areaList.add(GetAreaList(areaName: 'Select Area'));

                        // print("cityDropDownValue : ${authScreenController.cityDropDownValue}");
                        controller.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
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
          height: controller.size.height * 0.08,
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
            ),
            // optional
            dayFlex: 2,
            monthFlex: 3,
            yearFlex: 2,
            textStyle: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.greyTextColor.withOpacity(0.7)
                  : AppColors.blackTextColor.withOpacity(0.7),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.greyTextColor,
            ),
            isDropdownHideUnderline: true,
            // optional
            isFormValidator: true,
            // optional
            // startYear: 1900, // optional
            // endYear: 2020, // optional
            // width: 10,

            selectedDay: int.parse(controller.day),
            selectedMonth: int.parse(controller.month),
            selectedYear: int.parse(controller.year),
            onChangedDay: (value) {
              controller.day = value!;
              log('onChangedDay: ${controller.day}');
            },
            onChangedMonth: (value) {
              controller.month = value!;
              log('onChangedMonth: ${controller.month}');
            },
            onChangedYear: (value) {
              controller.year = value!;
              log('onChangedYear: ${controller.year}');
            },
            // showDay: false,// optional
            // dayFlex: 2,// optional
            // locale: "zh_CN",// optional
          ),
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);

  final controller = Get.find<UserProfileEditController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (controller.formKey.currentState!.validate()) {
          await controller.updateUserProfileFunction();
        }
        //controller.submitLoginForm();
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
