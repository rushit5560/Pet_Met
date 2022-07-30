import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_profile_controller.dart';
import 'package:pet_met/screens/user_profile_screen/widgets/user_profile_screen_widgets.dart';
import 'package:pet_met/utils/app_images.dart';

import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(UserProfileController());

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
                  title: "Profile",
                  trailingWidget: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouteNames.changePasswordRoute);
                    },
                    child: Icon(
                      Icons.edit_note_rounded,
                      color: AppColors.accentColor,
                      size: 7.w,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                //       GestureDetector(
                //         onTap: () {
                //           Get.toNamed(AppRouteNames.forgotPassRoute);
                //         },
                //         child: Icon(
                //           Icons.edit_note_rounded,
                //           color: AppColors.accentColor,
                //           size: 7.w,
                //         ),
                //       ),
                //       // SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Obx(()=>
                  controller.isLoading.value ?
                    const CustomAnimationLoader():
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            ProfileImage(),
                            const SizedBox(height: 30),
                            const ProfileDetailsModule(),
                            const GetPersonalInfoModule(),
                            const ContactInfoModule(),
                            DogOwnerListModule(),
                            const SizedBox(height: 20),
                            const AboutModule()
                          ],
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
}
