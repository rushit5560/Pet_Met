import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/trainers_and_users_screen_controller.dart';
import 'package:pet_met/screens/trainers_and_users_profile_screen/trainers_and_user_profile_screen_widgets.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/common_widgets/alert_dialog_module.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';

class TrainersAndUserProfileScreenController extends StatelessWidget {
  TrainersAndUserProfileScreenController({Key? key}) : super(key: key);

  final controller = Get.put(TrainersAndUsersScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  String? fieldName;
  String? fieldHinttext;

  AlertDialogModule alertDialogModule = AlertDialogModule();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(),
            Column(
              children: [
                // BackArrow(),
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Trainer Profile",
                  trailingWidget: GestureDetector(
                    onTap: () {
                      modelBottomSheet(context);
                    },
                    child: Icon(
                      Icons.person,
                      color: AppColors.accentColor,
                      size: 3.h,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    // const SizedBox(height: 25),
                                    /// Delete Account Button Hide
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            alertDialogModule.alertDialogBox(
                                                yesClick: () async {
                                              await controller
                                                  .deleteAccountFunction();
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 3.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    UploadImageModule(),
                                    const SizedBox(height: 30),

                                    TrainersAchievmentPictureListModule(),
                                    //const SizedBox(height: 30),
                                    //NgoBankNameModule(),
                                    const SizedBox(height: 30),
                                    //CommonTextFieldModule(fieldName: 'Trainers name'),

                                    EmailTextFieldModule(),
                                    const SizedBox(height: 15),

                                    TrainersNameTextFieldModule(),
                                    const SizedBox(height: 15),
                                    DisplayNameTextFieldModule(),
                                    const SizedBox(height: 15),

                                    // CommonTextFieldModule(
                                    //   fieldName: "Trainers Contact",
                                    //   //fieldHinttext: "**** ** ***",
                                    // ),
                                    TrainersContactNumberTextField(),
                                    const SizedBox(height: 15),
                                    // CommonTextFieldModule(
                                    //   fieldName: "Trainers Address",
                                    //   //fieldHinttext: "**** ** ***",
                                    // ),
                                    TrainersAddressTextFieldModule(),
                                    const SizedBox(height: 15),
                                    TrainersDetailsModule(),
                                    // const SizedBox(height: 15),
                                    // InstagramTextFieldModule(),
                                    // const SizedBox(height: 15),
                                    // FacebookLinkTextFieldModule(),
                                    // CommonTextFieldModule(
                                    //   fieldName: "Trainers Details",
                                    //   //fieldHinttext: "**** ** ***",
                                    // ),
                                    // const SizedBox(height: 15),
                                    // OpenAndCloseShopTimeModule(),
                                    const SizedBox(height: 15),
                                    IsActiveTextFieldModule(),
                                    const SizedBox(height: 15),
                                    // TrainerUpiTextFieldModule(),
                                    // const SizedBox(height: 15),
                                    OpenAndCloseShopTimeModule(),
                                    const SizedBox(height: 20),
                                    GetVerifiedInfo(),
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

  modelBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
          padding: const EdgeInsets.all(5.0),
          //height: controller.size.height * 0.15,

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.userProfileAvail == true
                    ? GestureDetector(
                        onTap: () async {
                          await multipleAccountDialog(
                              context, controller.userEmail.value, "1");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: themeProvider.darkTheme
                                  ? AppColors.blackTextColor
                                  : Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "User",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                      child: Divider(
                                    color: AppColors.greyColor,
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "User Name",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.userName.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            color: themeProvider.darkTheme
                                                ? AppColors.whiteColor
                                                : AppColors.blackTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.userEmail.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                controller.shopProfileAvail == true
                    ? GestureDetector(
                        onTap: () async {
                          await multipleAccountDialog(
                              context, controller.shopEmail.value, "1");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: themeProvider.darkTheme
                                  ? AppColors.blackTextColor
                                  : Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shop",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                      child: Divider(
                                    color: AppColors.greyColor,
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "Shop Name",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.shopName.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.shopEmail.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                controller.vetNgoProfileAvail == true
                    ? GestureDetector(
                        onTap: () async {
                          await multipleAccountDialog(
                              context, controller.ngoEmail.value, "3");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: themeProvider.darkTheme
                                  ? AppColors.blackTextColor
                                  : Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vet & NGO",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                      child: Divider(
                                    color: AppColors.greyColor,
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "Vet/Ngo Name",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.ngoName.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            color: themeProvider.darkTheme
                                                ? AppColors.whiteColor
                                                : AppColors.blackTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.ngoEmail.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                controller.trainerProfileAvail == true
                    ? GestureDetector(
                        onTap: () async {
                          if (UserDetails.userName ==
                              controller.trainerName.value) {
                            log("trainer storeed name is : " +
                                UserDetails.userName);
                            log("trainer name is : " +
                                controller.trainerName.value);
                          }

                          // await multipleAccountDialog(
                          //     context, controller.trainerEmail.value, "4");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: themeProvider.darkTheme
                                  ? AppColors.blackTextColor
                                  : Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trainer",
                                    style: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.blackTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                      child: Divider(
                                    color: AppColors.greyColor,
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "Trainer Name",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.trainerName.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 30,
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          flex: 70,
                                          child: Text(
                                            controller.trainerEmail.value,
                                            style: TextStyle(
                                              color: themeProvider.darkTheme
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackTextColor,
                                              fontSize: 10.sp,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                controller.userProfileAvail == false ||
                        controller.shopProfileAvail == false ||
                        controller.vetNgoProfileAvail == false ||
                        controller.trainerProfileAvail == false
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const UserCategoriesScreen());
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade400),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: const Icon(Icons.add, size: 30),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 7)
              ],
            ),
          ),
        );
      },
    );
  }

  multipleAccountDialog(BuildContext context, String email, String categoryId) {
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor.withOpacity(0.3)
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
            horizontal: 18,
            vertical: 20,
          ),
          height: controller.size.height * 0.25,
          width: controller.size.width * 0.85,
          child: Form(
            key: controller.loginPasswordForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
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

                Obx(
                  () => Stack(
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
                        validator: (val) =>
                            Validations().validatePassword(val!),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
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
                            )),
                      ),
                    ],
                  ),
                ),*/

                // const SizedBox(height: 20),
                Text(
                  "Are you sure want to switch the account ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (controller.loginPasswordForm.currentState!
                            .validate()) {
                          await controller.userMultipleAccountLoginFunction(
                              email: email, categoryId: categoryId);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 68, 185, 183),
                        minimumSize: Size(
                          controller.size.width * 0.3,
                          30,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
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
                      width: controller.size.width * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color.fromARGB(255, 190, 190, 190),
                        minimumSize: Size(controller.size.width * 0.3, 30),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.darkThemeBoxColor
                                : AppColors.blackTextColor,
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
      ),
    );
  }
}
