import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';
import '../../../controllers/index_screen_controller.dart';
import '../../../utils/app_colors.dart';

class BuildMenu extends StatefulWidget {
  BuildMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildMenu> createState() => _BuildMenuState();
}

class _BuildMenuState extends State<BuildMenu> {
  final controller = Get.find<HomeController>();

  final indexController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/logintopright.png"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/shades/bg_shade_left.png"),
          ),
          Positioned(
            top: controller.size.height * 0.03,
            left: controller.size.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/user_ellipse.png",
                  width: 40,
                  height: 40,
                  // width: controller.size.width * 0.05,
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Miroslava Savitskaya",
                      style: TextStyle(
                        color: AppColors.accentTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Active Status",
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding:
                EdgeInsets.only(top: controller.size.height * 0.18, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/home.png",
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.accentTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/adoption.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Pet Care",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/phone.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Support",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/about.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "About",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/question.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Faq",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {
                    indexController.drawerController.close!();
                    Get.toNamed(AppRouteNames.privacyPolicyScreenRoute);
                  },
                  leading: Image.asset(
                    "assets/icons/lock.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/share.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Share App",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () async {
                    return showDialog(
                      barrierColor: AppColors.accentColor.withOpacity(0.3),
                      context: context,
                      builder: (ctx) => Dialog(
                        backgroundColor: AppColors.whiteColor,
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 25,
                          ),
                          height: controller.size.height * 0.28,
                          width: controller.size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_forever,
                                color: AppColors.redColor,
                                size: 50,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "You want to delete account Permenetly.",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  color: AppColors.accentTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.accentColor,
                                      minimumSize:
                                          Size(controller.size.width * 0.3, 35),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
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
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
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
                                      primary: Color(0xFFC4C4C4),
                                      minimumSize:
                                          Size(controller.size.width * 0.3, 35),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: AppColors.blackTextColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // title: Text("Show Alert Dialog Box"),
                        // content: Text("You have raised a Alert Dialog Box"),
                        // actions: <Widget>[
                        //   FlatButton(
                        //     onPressed: () {
                        //       Navigator.of(ctx).pop();
                        //     },
                        //     child: Text("Ok"),
                        //   ),
                        // ],
                      ),
                    );
                  },
                  leading: Image.asset(
                    "assets/icons/delete.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Delete Account",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                drawerListTile(
                  onTap: () {
                    Get.toNamed(AppRouteNames.rateAppRoute);
                  },
                  leading: Image.asset(
                    "assets/icons/star.png",
                    color: AppColors.greyTextColor,
                    height: 24,
                  ),
                  titleWidget: Text(
                    "Rate App",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: controller.size.height * 0.08,
            left: 20,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/paintboard.png",
                          height: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Theme",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: AppColors.greyTextColor,
                      thickness: 1.5,
                      width: 10,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerListTile({
    Function()? onTap,
    Widget? leading,
    Widget? titleWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        minLeadingWidth: 15,
        title: titleWidget,
        dense: true,
        style: ListTileStyle.list,
      ),
    );
  }
}
