import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';

class BuildMenu extends StatelessWidget {
  BuildMenu({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

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
            child: Image.asset("assets/images/bg_shade.png"),
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
                  onTap: () {},
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
                  onTap: () {},
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
                  onTap: () {},
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
