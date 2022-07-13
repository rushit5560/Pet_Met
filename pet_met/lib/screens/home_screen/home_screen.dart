import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/screens/order_details_screen/order_details_screen.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_passfield.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/theme_preferences.dart';
import 'package:pet_met/utils/validations.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/login_controller.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final indexController = Get.put(IndexScreenController());
  // final indexController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundLeftShadow(
          height: controller.size.height * 0.3,
          width: controller.size.height * 0.3,
          topPad: controller.size.height * 0.25,
          leftPad: -controller.size.width * 0.15,
        ),
        BackGroundRightShadow(
          height: controller.size.height * 0.3,
          width: controller.size.height * 0.3,
          topPad: controller.size.height * 0.45,
          rightPad: -controller.size.width * 0.15,
        ),
        Column(
          children: [
            CustomAppBar(
              title: "User Categories",
              appBarOption: AppBarOption.drawerButtonOption,
              isTitleText: false,
              centerWidget: Image.asset(
                "assets/images/petmet_logo.png",
                width: controller.size.width * 0.25,
              ),
              trailingWidget: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouteNames.userProfileRoute);
                },
                child: Image.asset(
                  "assets/images/user_ellipse.png",
                  width: controller.size.width * 0.12,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             indexController.drawerController.open!();
            //           });
            //         },
            //         child: Image.asset(
            //           "assets/icons/drawer_icon.png",
            //           color: AppColors.blackTextColor,
            //           width: controller.size.width * 0.07,
            //         ),
            //       ),
            //       Image.asset(
            //         "assets/images/petmet_logo.png",
            //         width: controller.size.width * 0.25,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed(AppRouteNames.userProfileRoute);
            //         },
            //         child: Image.asset(
            //           "assets/images/user_ellipse.png",
            //           width: controller.size.width * 0.12,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        height: controller.size.width * 0.16,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dogsTopList.length,
                          physics: const BouncingScrollPhysics(),
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
                      SizedBox(height: controller.size.height * 0.025),
                      Container(
                        height: controller.size.height * 0.2,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/dogbanner.png")),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 35,
                            width: controller.size.width * 0.36,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Pet Shop & Grooming",
                                style: TextStyle(
                                  color: AppColors.accentTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      DogDisplayWidget(
                        onTap: () {
                          Get.toNamed(AppRouteNames.orderDetailsRoute);
                        },
                      ),
                      SizedBox(height: 10),
                      DogDisplayWidget(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
