import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/user_profile_controller.dart';
import 'package:pet_met/screens/user_profile_screen/widgets/user_profile_screen_widgets.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';

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
                      SizedBox(),
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
                          SizedBox(height: 25),
                          Image.asset(
                            "assets/images/image_placeholder.png",
                            height: controller.size.width * 0.45,
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 90,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Monika A",
                                  style: TextStyle(
                                    color: AppColors.accentTextColor,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // const SizedBox(width: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/locate_home.png",
                                      height: 15,
                                    ),
                                    const SizedBox(width: 10),
                                    RichText(
                                      text: TextSpan(
                                        text: "California, Walk suite (",
                                        style: TextStyle(
                                          color: AppColors.greyTextColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "2 km",
                                            style: TextStyle(
                                              color: AppColors.accentTextColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ")",
                                            style: TextStyle(
                                              color: AppColors.greyTextColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRouteNames.userProfileEditRoute);
                                  },
                                  child: Text(
                                    "Get Personal Info",
                                    style: TextStyle(
                                      color: AppColors.blackTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.blackTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            // margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.greyTextColor.withOpacity(0.3),
                                  blurRadius: 35,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                ContactContainerWidget(
                                  imagePath: "assets/images/info_green.png",
                                ),
                                SizedBox(width: 20),
                                ContactContainerWidget(
                                  imagePath: "assets/images/phone_green.png",
                                ),
                                SizedBox(width: 20),
                                ContactContainerWidget(
                                  imagePath: "assets/images/locate_green.png",
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Dog Owner Feild",
                                  style: TextStyle(
                                    color: AppColors.accentTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: controller.size.width * 0.16,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.dogsTopList.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: controller.size.width * 0.16,
                                      width: controller.size.width * 0.16,
                                      margin: const EdgeInsets.only(
                                          bottom: 5, right: 5),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              controller.dogsTopList[index],
                                            ),
                                            fit: BoxFit.cover),
                                        color: AppColors.greyTextColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    index == 0
                                        ? Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.whiteColor,
                                                size: 12,
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: controller.size.height * 0.25,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "About",
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/edit_black_icon.png",
                                      height: 25,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "The cat (Felis catus) is a domestic species of small carnivorous mammal.[1][2] It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.greyTextColor,
                                      fontWeight: FontWeight.w300,
                                      wordSpacing: 1,
                                      height: 1.2),
                                ),
                              ],
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
}
