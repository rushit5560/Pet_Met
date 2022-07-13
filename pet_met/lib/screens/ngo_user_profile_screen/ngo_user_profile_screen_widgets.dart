import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/ngo_user_profile_screen_controller.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
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
      child: Image.asset("assets/images/logintopright.png"),
    );
  }
}

class BackArrow extends StatelessWidget {
  BackArrow({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              width: screenController.size.width * 0.07,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}

class UploadImageModule extends StatelessWidget {
  UploadImageModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
        height: screenController.size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
            image: FileImage(
              File(screenController.imageFile!.path),
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
        child: screenController.imageFile!.path.isEmpty
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
    );
  }
}

class NameOfNgoListModule extends StatelessWidget {
  NameOfNgoListModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name of NGO/Vet picture:"),
        SizedBox(height: 8),

        Container(
          height: screenController.size.width * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: screenController.size.width * 0.16,
                    width: screenController.size.width * 0.16,
                    margin: const EdgeInsets.only(
                        bottom: 5, right: 5),
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //       controller.dogsTopList[index],
                      //     ),
                      //     fit: BoxFit.cover),
                      color: AppColors.greyTextColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 12,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NgoBankNameModule extends StatelessWidget {
  NgoBankNameModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ngo Bank Name:"),
        SizedBox(height: 8),

        Container(
          height: screenController.size.width * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: screenController.size.width * 0.16,
                    width: screenController.size.width * 0.16,
                    margin: const EdgeInsets.only(
                        bottom: 5, right: 5),
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //       controller.dogsTopList[index],
                      //     ),
                      //     fit: BoxFit.cover),
                      color: AppColors.greyTextColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 12,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}



class CommonTextFieldModule extends StatelessWidget {
  //CommonTextFieldModule({Key? key}) : super(key: key);
  String ? fieldName;
  String? fieldHinttext;

  CommonTextFieldModule({this.fieldName, this.fieldHinttext});

  final screenController = Get.find<NgoUserProfileScreenController>();


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
          fieldController: screenController.nameController,
          height: screenController.size.height * 0.05,
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

class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open shop time",
                style: TextStyle(
                  color:
                  AppColors.blackTextColor.withOpacity(0.7),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: screenController.size.height * 0.05,
                    //width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyTextColor.withOpacity(0.25),
                          blurRadius: 35,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    //controller: fieldController,
                    //validator: validator,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      //hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Close shop time",
                style: TextStyle(
                  color:
                  AppColors.blackTextColor.withOpacity(0.7),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: screenController.size.height * 0.05,
                    //width: width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyTextColor.withOpacity(0.25),
                          blurRadius: 35,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    //controller: fieldController,
                    //validator: validator,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      //hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  const SubmitButtonModule({Key? key}) : super(key: key);

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


