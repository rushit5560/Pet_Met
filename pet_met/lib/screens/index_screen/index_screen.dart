import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_light_passfield.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/themedata.dart';
import 'package:pet_met/utils/validations.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/login_controller.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  final controller = Get.put(IndexScreenController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0.0,
      borderRadius: 15,
      showShadow: false,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      moveMenuScreen: false,
      shrinkMainScreen: false,
      style: DrawerStyle.defaultStyle,
      controller: controller.drawerController,
      menuBackgroundColor: AppColors.whiteColor,
      menuScreenWidth: double.infinity,
      slideWidth: controller.size.width * 0.5,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      boxShadow: [
        BoxShadow(
          color: AppColors.greyTextColor.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(-10, 15), // changes position of shadow
        ),
      ],
      menuScreen: BuildMenu(),
      mainScreen: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          bottomNavigationBar: BubbleBottomBar(
            opacity: 0.2,
            currentIndex: controller.selectedbottomIndex.value,
            onTap: (ind) {
              setState(() {
                controller.selectedbottomIndex.value = ind!;
              });
            },
            backgroundColor: AppColors.accentColor,
            borderRadius: const BorderRadius.all(const Radius.circular(20)),
            //new
            hasInk: true, //new, gives a cute ink effect
            inkColor:
                Colors.black12, //optional, uses theme color if not specified
            tilesPadding: const EdgeInsets.symmetric(vertical: 8),
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                backgroundColor: AppColors.blackTextColor,
                icon: Image.asset(
                  "assets/icons/mate-branding_icon.png",
                  color: AppColors.whiteColor,
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  "assets/icons/mate-branding_icon.png",
                  color: AppColors.whiteColor,
                  width: 40,
                  height: 40,
                ),
                title: const Text(
                  "Mate",
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: AppColors.blackTextColor,
                icon: Image.asset(
                  "assets/icons/trainging_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                activeIcon: Image.asset(
                  "assets/icons/trainging_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                title: const Text(
                  "Play",
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: AppColors.blackTextColor,
                icon: Image.asset(
                  "assets/icons/home.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                activeIcon: Image.asset(
                  "assets/icons/home.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: AppColors.blackTextColor,
                icon: Image.asset(
                  "assets/icons/location_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                activeIcon: Image.asset(
                  "assets/icons/location_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                title: const Text(
                  "Locate",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
              BubbleBottomBarItem(
                backgroundColor: AppColors.blackTextColor,
                icon: Image.asset(
                  "assets/icons/doctor_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                activeIcon: Image.asset(
                  "assets/icons/doctor_icon.png",
                  color: AppColors.whiteColor,
                  width: 28,
                  height: 28,
                ),
                title: const Text(
                  "Doctor",
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/logintopright.png"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/images/bg_shade.png"),
              ),
              controller.screenPages[controller.selectedbottomIndex.value],
            ],
          ),
        ),
      ),
    );
  }
}
