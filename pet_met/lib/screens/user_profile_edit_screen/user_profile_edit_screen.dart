import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_profile_edit_controller.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_route_names.dart';
import '../../utils/validations.dart';
import '../user_profile_screen/widgets/user_profile_screen_widgets.dart';

class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({Key? key}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/icons/left_back_arrow.png",
                          width: controller.size.width * 0.07,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Container(
                            height: controller.size.height * 0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
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
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          textfieldSection(
                            fieldName: "Name",
                            fieldHinttext: "Your Pet Title",
                          ),
                          const SizedBox(height: 8),
                          textfieldSection(
                            fieldName: "Mobile Number",
                            fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 8),
                          textfieldSection(
                            fieldName: "Location",
                            fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 20),
                          Container(
                            child: DropdownButton<String>(
                              value: controller.selectedGenderValue.value,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 12.sp,
                              ),
                              onChanged: null,
                              items: controller.dropdownGenderItems,
                            ),
                          )
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
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
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
