import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/screens/shop_user_profile_screen/shop_user_profile_screen_widgets.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

class ShopUserProfileScreen extends StatelessWidget {
  ShopUserProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ShopUserProfileScreenController());

  String? fieldName;
  String? fieldHinttext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(),
            Column(
              children: [
                //BackArrow(),
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                 // title: "Profile Edit",
                  trailingWidget: GestureDetector(
                    onTap: () {
                      modelBottomSheet(context);
                    },
                    child: Image.asset(
                      AppImages.userProfileImg,
                      width: controller.size.width * 0.12,
                    ),
                  ),
                ),
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
                              AddShopOffersListModule(),
                              const SizedBox(height: 30),
                              MeetingAvailabilityModule(),
                              const SizedBox(height: 30),
                              //CommonTextFieldModule(fieldName: 'Shop Name'),
                              EmailTextFieldModule(),
                              const SizedBox(height: 15),
                              ShopNameTextFieldModule(),
                              const SizedBox(height: 15),
                              ContactNumberTextFieldModule(),
                              // CommonTextFieldModule(
                              //   fieldName: "Contact Number",
                              //   //fieldHinttext: "**** ** ***",
                              // ),
                              const SizedBox(height: 15),

                              AddressTextFieldModule(),
                              const SizedBox(height: 15),
                              DetailsTextFieldModule(),
                              const SizedBox(height: 15),
                              InstagramTextFieldModule(),
                              const SizedBox(height: 15),
                              FacebookLinkTextFieldModule(),
                              // CommonTextFieldModule(
                              //   fieldName: "Address",
                              //   //fieldHinttext: "**** ** ***",
                              // ),
                              const SizedBox(height: 15),
                              OpenAndCloseShopTimeModule(),
                              const SizedBox(height: 30),
                              SubmitButtonModule(),
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

  modelBottomSheet(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
          //height: controller.size.height * 0.15,
          child: Column(
            children: [
              GestureDetector(
                onTap: ()async{
                  await multipleAccountDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User", style: TextStyle(color: Colors.black),),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text("Email:", style: TextStyle(color: Colors.black),),
                              Text(controller.userEmail, style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Name:", style: TextStyle(color: Colors.black),),
                              Text(controller.userName.value, style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: ()async{
                  await multipleAccountDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shop", style: TextStyle(color: Colors.black),),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text("Email:", style: TextStyle(color: Colors.black),),
                              Text(controller.shopEmail.value, style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Name:", style: TextStyle(color: Colors.black),),
                              Text(controller.shopName.value, style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: ()async{
                  await multipleAccountDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vet & NGO", style: TextStyle(color: Colors.black),),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text("Email:", style: TextStyle(color: Colors.black),),
                              Text(controller.ngoEmail.value, style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Name:", style: TextStyle(color: Colors.black),),
                              Text(controller.ngoName.value, style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: ()async{
                  await multipleAccountDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trainer", style: TextStyle(color: Colors.black),),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text("Email:", style: TextStyle(color: Colors.black),),
                              Text(controller.trainerEmail.value, style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Name:", style: TextStyle(color: Colors.black),),
                              Text(controller.trainerName.value, style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  multipleAccountDialog(BuildContext context){
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor
          .withOpacity(0.3)
          : AppColors.accentColor.withOpacity(0.3),
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          height: controller.size.height * 0.35,
          width: controller.size.width * 0.8,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      color: AppColors.blackTextColor.withOpacity(0.7),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 8),
              // CustomLightTextField(
              //   readOnly: false,
              //   fieldController: controller.passwordController,
              //   height: Get.height * 0.05,
              //   width: double.infinity,
              //   hintText: "Password",
              //   textInputAction: TextInputAction.next,
              //   textInputType: TextInputType.text,
              //   validator: (val) => Validations().validateName(val!),
              // ),
              Obx(()=>
                  Stack(
                    children: [
                      Container(
                        height: controller.size.height * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor.withOpacity(0.05)
                                  : AppColors.greyTextColor.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 0.1,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        validator: (val) => Validations().validatePassword(val!),
                        obscureText: controller.isPasswordVisible.value,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentTextColor,
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
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: "Current Password",
                            hintStyle: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: Obx(
                                  () => GestureDetector(
                                onTap: () {
                                  controller.isPasswordVisible.value =
                                  !controller.isPasswordVisible.value;
                                },
                                child: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    size: 20,
                                    color: Colors.grey),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
              ),

              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: ()async {
                      await controller.userLoginFunction();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.accentColor,
                      minimumSize: Size(
                        controller.size.width * 0.3,
                        30,
                      ),
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 16),
                      shape:
                      const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:
                    controller.size.width * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor
                          .withOpacity(0.3),
                      minimumSize: Size(
                          controller.size.width * 0.3,
                          30),
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 16),
                      shape:
                      const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: themeProvider
                              .darkTheme
                              ? AppColors
                              .darkThemeBoxColor
                              : AppColors
                              .blackTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
