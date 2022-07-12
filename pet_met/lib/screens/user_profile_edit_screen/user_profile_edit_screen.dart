import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/user_profile_edit_controller.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_route_names.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';
import '../user_profile_screen/widgets/user_profile_screen_widgets.dart';

class UserProfileEditScreen extends StatefulWidget {
  UserProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileEditScreen> createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<UserProfileEditScreen> {
  final controller = Get.put(UserProfileEditController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // BackGroundLeftShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.25,
            //   leftPad: -controller.size.width * 0.15,
            // ),
            // BackGroundRightShadow(
            //   height: controller.size.height * 0.3,
            //   width: controller.size.height * 0.3,
            //   topPad: controller.size.height * 0.45,
            //   rightPad: -controller.size.width * 0.15,
            // ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/logintopright.png"),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Profile Edit",
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Image.asset(
                //           "assets/icons/left_back_arrow.png",
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       const SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          GestureDetector(
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
                              height: controller.size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
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
                                    color: AppColors.greyTextColor
                                        .withOpacity(0.3),
                                    blurRadius: 35,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: controller.imageFile!.path.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/camera_placeholder.png",
                                            height: 65,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            "Upload Image",
                                            style: TextStyle(
                                              color: AppColors.blackTextColor,
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
                          const SizedBox(height: 30),
                          textfieldSection(
                            fieldName: "Name",
                            fieldHinttext: "Your Pet Title",
                          ),
                          const SizedBox(height: 15),
                          textfieldSection(
                            fieldName: "Mobile Number",
                            fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),
                          textfieldSection(
                            fieldName: "Location",
                            fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.7),
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
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.greyTextColor,
                                ),
                                value: controller.selectedGenderValue.value,
                                isDense: true,
                                isExpanded: true,
                                items: controller.dropdownGenderItems,
                                underline: SizedBox(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 15.sp,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    controller.selectedGenderValue.value = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Birthdate",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.7),
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
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.greyTextColor.withOpacity(0.3),
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
                                color:
                                    AppColors.blackTextColor.withOpacity(0.6),
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
                              onChangedDay: (value) =>
                                  print('onChangedDay: $value'),
                              onChangedMonth: (value) =>
                                  print('onChangedMonth: $value'),
                              onChangedYear: (value) =>
                                  print('onChangedYear: $value'),
                              // showDay: false,// optional
                              // dayFlex: 2,// optional
                              // locale: "zh_CN",// optional
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
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
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

  Widget textfieldSection({
    String? fieldName,
    String? fieldHinttext,
  }) {
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
