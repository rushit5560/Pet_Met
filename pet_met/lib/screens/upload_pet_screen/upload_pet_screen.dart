import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/upload_pet_controller.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen_widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_route_names.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/common_widgets/custom_light_textfield.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class UploadPetScreen extends StatefulWidget {
  UploadPetScreen({Key? key}) : super(key: key);

  @override
  State<UploadPetScreen> createState() => _UploadPetScreenState();
}

class _UploadPetScreenState extends State<UploadPetScreen> {
  final controller = Get.put(UploadPetController());

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

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
            BackgroundImage(),

            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Upload Pet",
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 8),
                          // Text(
                          //   "Upload Pet",
                          //   style: TextStyle(
                          //     color: AppColors.accentTextColor,
                          //     fontSize: 20.sp,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          UploadImageModule(),
                          // GestureDetector(
                          //   onTap: () {
                          //     showModalBottomSheet<void>(
                          //       context: context,
                          //       constraints: null,
                          //       builder: (BuildContext context) {
                          //         return Container(
                          //           height: controller.size.height * 0.15,
                          //           child: Column(
                          //             children: [
                          //               ListTile(
                          //                 onTap: getFromCamera,
                          //                 contentPadding: EdgeInsets.only(
                          //                     left:
                          //                         controller.size.width * 0.1),
                          //                 title: Text(
                          //                   "Select Image From Camera",
                          //                   style: TextStyle(
                          //                     color: AppColors.blackTextColor
                          //                         .withOpacity(0.7),
                          //                     fontSize: 13.sp,
                          //                     fontWeight: FontWeight.w600,
                          //                   ),
                          //                 ),
                          //               ),
                          //               ListTile(
                          //                 contentPadding: EdgeInsets.only(
                          //                     left:
                          //                         controller.size.width * 0.1),
                          //                 onTap: getFromGallery,
                          //                 title: Text(
                          //                   "Select Image From Gallery",
                          //                   style: TextStyle(
                          //                     color: AppColors.blackTextColor
                          //                         .withOpacity(0.7),
                          //                     fontSize: 13.sp,
                          //                     fontWeight: FontWeight.w600,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          //   child: Container(
                          //     height: controller.size.height * 0.2,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       color: themeProvider.darkTheme
                          //           ? AppColors.darkThemeColor
                          //           : AppColors.whiteColor,
                          //       borderRadius: const BorderRadius.all(
                          //         Radius.circular(15),
                          //       ),
                          //       image: DecorationImage(
                          //         image: FileImage(
                          //           File(controller.imageFile!.path),
                          //         ),
                          //       ),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: AppColors.greyTextColor
                          //               .withOpacity(0.3),
                          //           blurRadius: 35,
                          //           spreadRadius: 1,
                          //           offset: const Offset(0, 5),
                          //         ),
                          //       ],
                          //     ),
                          //     child: controller.imageFile!.path.isEmpty
                          //         ? Center(
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               children: [
                          //                 Image.asset(
                          //                   themeProvider.darkTheme
                          //                       ? "assets/images/camera_placeholder_dark.png"
                          //                       : "assets/images/camera_placeholder_light.png",
                          //                   height: 65,
                          //                 ),
                          //                 const SizedBox(height: 20),
                          //                 Text(
                          //                   "Upload Image",
                          //                   style: TextStyle(
                          //                     color: themeProvider.darkTheme
                          //                         ? AppColors.whiteColor
                          //                         : AppColors.blackTextColor,
                          //                     fontSize: 15.sp,
                          //                     fontWeight: FontWeight.w500,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           )
                          //         : const SizedBox(),
                          //   ),
                          // ),
                          const SizedBox(height: 30),
                          // TextFieldSection(
                          //   fieldController: controller.mailController,
                          //   fieldName: "Pet Name",
                          //   fieldHinttext: "Your Pet Title",
                          // ),
                          PetNameTextFieldModule(),

                          const SizedBox(height: 15),
                          TypesOfPetDropDownModule(),

                          const SizedBox(height: 15),

                          PetSubCategoryDropDownModule(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Types Of Pet",
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.whiteColor
                          //             : AppColors.blackTextColor
                          //                 .withOpacity(0.7),
                          //         fontSize: 11.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // Container(
                          //   height: controller.size.height * 0.06,
                          //   width: double.infinity,
                          //   padding: const EdgeInsets.only(left: 15, right: 15),
                          //   decoration: BoxDecoration(
                          //     color: themeProvider.darkTheme
                          //         ? AppColors.darkThemeColor
                          //         : AppColors.whiteColor,
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(15),
                          //     ),
                          //   ),
                          //   child: Center(
                          //     child: DropdownButton<String>(
                          //       icon: const Icon(
                          //         Icons.keyboard_arrow_down_rounded,
                          //         color: AppColors.greyTextColor,
                          //       ),
                          //       value: controller.selectedPetTypeValue.value,
                          //       isDense: true,
                          //       isExpanded: true,
                          //       items: controller.dropdownPetTypeItems,
                          //       underline: const SizedBox(),
                          //       borderRadius: const BorderRadius.all(
                          //           const Radius.circular(15)),
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.darkThemeColor
                          //             : AppColors.whiteColor,
                          //         fontSize: 15.sp,
                          //       ),
                          //       onChanged: (val) {
                          //         setState(() {
                          //           controller.selectedPetTypeValue.value =
                          //               val!;
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          MeetingAvailabilityDropDown(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Meeting Availability",
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.whiteColor
                          //             : AppColors.blackTextColor
                          //                 .withOpacity(0.7),
                          //         fontSize: 11.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // Container(
                          //   height: controller.size.height * 0.06,
                          //   width: double.infinity,
                          //   padding: const EdgeInsets.only(left: 15, right: 15),
                          //   decoration: BoxDecoration(
                          //     color: themeProvider.darkTheme
                          //         ? AppColors.darkThemeColor
                          //         : AppColors.whiteColor,
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(15),
                          //     ),
                          //   ),
                          //   child: Center(
                          //     child: DropdownButton<String>(
                          //       icon: const Icon(
                          //         Icons.keyboard_arrow_down_rounded,
                          //         color: AppColors.greyTextColor,
                          //       ),
                          //       value:
                          //           controller.selectedAvailabilityValue.value,
                          //       isDense: true,
                          //       isExpanded: true,
                          //       items: controller.dropdownAvailabilityItems,
                          //       underline: const SizedBox(),
                          //       borderRadius: const BorderRadius.all(
                          //           const Radius.circular(15)),
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.darkThemeColor
                          //             : AppColors.whiteColor,
                          //         fontSize: 15.sp,
                          //       ),
                          //       onChanged: (val) {
                          //         setState(() {
                          //           controller.selectedAvailabilityValue.value =
                          //               val!;
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          GenderDropDown(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Gender",
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.whiteColor
                          //             : AppColors.blackTextColor
                          //                 .withOpacity(0.7),
                          //         fontSize: 11.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // Container(
                          //   height: controller.size.height * 0.06,
                          //   width: double.infinity,
                          //   padding: const EdgeInsets.only(left: 15, right: 15),
                          //   decoration: BoxDecoration(
                          //     color: themeProvider.darkTheme
                          //         ? AppColors.darkThemeColor
                          //         : AppColors.whiteColor,
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(15),
                          //     ),
                          //   ),
                          //   child: Center(
                          //     child: DropdownButton<String>(
                          //       icon: const Icon(
                          //         Icons.keyboard_arrow_down_rounded,
                          //         color: AppColors.greyTextColor,
                          //       ),
                          //       value: controller.selectedPetGenderValue.value,
                          //       isDense: true,
                          //       isExpanded: true,
                          //       items: controller.dropdownPetGenderItems,
                          //       underline: const SizedBox(),
                          //       borderRadius:
                          //           const BorderRadius.all(Radius.circular(15)),
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.darkThemeColor
                          //             : AppColors.whiteColor,
                          //         fontSize: 15.sp,
                          //       ),
                          //       onChanged: (val) {
                          //         setState(() {
                          //           controller.selectedPetGenderValue.value =
                          //               val!;
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          BirthDateDropDown(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Birthdate",
                          //       style: TextStyle(
                          //         color: themeProvider.darkTheme
                          //             ? AppColors.whiteColor
                          //             : AppColors.blackTextColor
                          //                 .withOpacity(0.7),
                          //         fontSize: 11.sp,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          // Container(
                          //   height: controller.size.height * 0.06,
                          //   width: double.infinity,
                          //   padding: const EdgeInsets.only(left: 15, right: 15),
                          //   decoration: BoxDecoration(
                          //     color: themeProvider.darkTheme
                          //         ? AppColors.darkThemeColor
                          //         : AppColors.whiteColor,
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(15),
                          //     ),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color:
                          //             AppColors.greyTextColor.withOpacity(0.3),
                          //         blurRadius: 35,
                          //         spreadRadius: 1,
                          //         offset: const Offset(0, 5),
                          //       ),
                          //     ],
                          //   ),
                          //   child: DropdownDatePicker(
                          //     boxDecoration: BoxDecoration(
                          //       // border: Border.,
                          //       borderRadius: BorderRadius.circular(5),
                          //     ), // optional
                          //     dayFlex: 2,
                          //     monthFlex: 3,
                          //     yearFlex: 2,
                          //     textStyle: TextStyle(
                          //       color:
                          //           AppColors.blackTextColor.withOpacity(0.6),
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     icon: const Icon(
                          //       Icons.keyboard_arrow_down_rounded,
                          //       color: AppColors.greyTextColor,
                          //     ),
                          //     isDropdownHideUnderline: true, // optional
                          //     isFormValidator: true, // optional
                          //     startYear: 1900, // optional
                          //     endYear: 2020, // optional
                          //     width: 10,

                          //     selectedDay: 14, // optional
                          //     selectedMonth: 10, // optional
                          //     selectedYear: 1993, // optional
                          //     onChangedDay: (value) =>
                          //         print('onChangedDay: $value'),
                          //     onChangedMonth: (value) =>
                          //         print('onChangedMonth: $value'),
                          //     onChangedYear: (value) =>
                          //         print('onChangedYear: $value'),
                          //     // showDay: false,// optional
                          //     // dayFlex: 2,// optional
                          //     // locale: "zh_CN",// optional
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          // TextFieldSection(
                          //   fieldName: "Weight",
                          //   fieldHinttext: "Enter Weight",
                          // ),

                          WeightTextFieldModule(),
                          /*CustomLightTextField(
                            fieldController: controller.petNameController,
                            height: controller.size.height * 0.065,
                            width: double.infinity,
                            hintText: "Weight",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            validator: (val) => Validations().validateEmail(val!),
                          ),*/
                          const SizedBox(height: 30),
                          PetSubmitButton(),
                          // GestureDetector(
                          //   onTap: () {
                          //     // controller.submitLoginForm();
                          //   },
                          //   child: Container(
                          //     width: double.infinity,
                          //     height: 50,
                          //     decoration: const BoxDecoration(
                          //       color: AppColors.accentColor,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(12),
                          //       ),
                          //     ),
                          //     child: Center(
                          //       child: Text(
                          //         "Submit",
                          //         style: TextStyle(
                          //           color: themeProvider.darkTheme
                          //               ? AppColors.darkThemeColor
                          //               : AppColors.whiteColor,
                          //           fontSize: 15.sp,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
}
