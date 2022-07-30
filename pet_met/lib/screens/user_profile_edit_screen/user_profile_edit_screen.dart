import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/user_profile_edit_controller.dart';
import 'package:pet_met/screens/user_profile_edit_screen/user_profile_edit_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_route_names.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class UserProfileEditScreen extends StatefulWidget {
  UserProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileEditScreen> createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<UserProfileEditScreen> {
  final controller = Get.put(UserProfileEditController());

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
                  child: Obx(()=>
                  controller.isLoading.value ?
                      CustomAnimationLoader():
                     SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 25),
                              UploadImageModule(),
                              const SizedBox(height: 30),
                              // TextFieldSection(
                              //   fieldName: "Name",
                              //   fieldHinttext: "Your Pet Title",
                              // ),
                              NameTextFieldModule(),

                              const SizedBox(height: 15),
                              // TextFieldSection(
                              //   fieldName: "Mobile Number",
                              //   fieldHinttext: "**** ** ***",
                              // ),
                              MobileNumberTextFieldModule(),
                              const SizedBox(height: 15),

                              LocationTextFieldModule(),
                              // TextFieldSection(
                              //   fieldName: "Location",
                              //   fieldHinttext: "**** ** ***",
                              // ),
                              const SizedBox(height: 15),
                              GenderDropDownModule(),
                              SizedBox(height: 15),
                              BirthDateModule(),
                              const SizedBox(height: 30),
                              SubmitButton(),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
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
