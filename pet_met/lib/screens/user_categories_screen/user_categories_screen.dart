import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_categories_controller.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class UserCategoriesScreen extends StatefulWidget {
  const UserCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<UserCategoriesScreen> createState() => _UserCategoriesScreenState();
}

class _UserCategoriesScreenState extends State<UserCategoriesScreen> {
  final controller = Get.put(UserCategoriesController());

  final themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.25,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? "assets/images/path_top_right_dark.png"
                  : "assets/images/path_top_right_light.png"),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        CustomAppBar(title: "User Categories"),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 20, left: 20, right: 20, bottom: 15),
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
                                  horizontal: 25, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "User Categories",
                                  //       style: TextStyle(
                                  //         color: AppColors.accentTextColor,
                                  //         fontSize: 24.sp,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(height: 3.h),
                                  Container(
                                    height: controller.size.height * 0.35,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 55,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  value: controller.boolsList[index].value,
                                                  checkColor: AppColors.whiteColor,
                                                  activeColor: AppColors.greyTextColor,
                                                  fillColor: MaterialStateProperty.all(
                                                    AppColors.greyTextColor),
                                                  focusColor: AppColors.greyTextColor,
                                                  // overlayColor:
                                                  //     MaterialStateProperty.all(
                                                  //   AppColors.greyTextColor,
                                                  // ),
                                                  onChanged: (val) {
                                                    controller.isLoading(true);

                                                    if (index == 0) {
                                                      controller.individualPetBool(true);
                                                      controller.petShoopsGroomingBool(false);
                                                      controller.petvetsandNgoBool(false);
                                                      controller.petTrainerAndBreederBool(false);
                                                      controller.roleId = 1;
                                                    } else if (index == 1) {
                                                      controller.individualPetBool(false);
                                                      controller.petShoopsGroomingBool(true);
                                                      controller.petvetsandNgoBool(false);
                                                      controller.petTrainerAndBreederBool(false);
                                                      controller.roleId = 2;
                                                    } else if (index == 2) {
                                                      controller.individualPetBool(false);
                                                      controller.petShoopsGroomingBool(false);
                                                      controller.petvetsandNgoBool(true);
                                                      controller.petTrainerAndBreederBool(false);
                                                      controller.roleId = 3;
                                                    } else if (index == 3) {
                                                      controller.individualPetBool(false);
                                                      controller.petShoopsGroomingBool(false);
                                                      controller.petvetsandNgoBool(false);
                                                      controller.petTrainerAndBreederBool(true);
                                                      controller.roleId = 4;
                                                    }

                                                    controller.isLoading(false);
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                controller.userTypeCategories[index],
                                                style: TextStyle(
                                                  color:
                                                      AppColors.blackTextColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (ctx, ind) {
                                        return const SizedBox(height: 20);
                                      },
                                      itemCount: 4,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          if(controller.individualPetBool.value == false
                                          && controller.petShoopsGroomingBool.value == false
                                          && controller.petvetsandNgoBool.value == false
                                          && controller.petTrainerAndBreederBool.value == false) {
                                           Fluttertoast.showToast(msg: "Please select category!");
                                          } else {
                                            await controller.setRoleIdInPrefs();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.accentColor,
                                          fixedSize: const Size(100, 45),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
