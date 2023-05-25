// import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/home_controller.dart';
import 'package:pet_met/controllers/index_screen_controller.dart';
import 'package:pet_met/screens/index_screen/widgets/index_screen_widgets.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../services/providers/dark_theme_provider.dart';



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
    var themeProvider = Provider.of<DarkThemeProvider>(context);

    return ZoomDrawer(
      angle: 0.0,
      borderRadius: 15,
      showShadow: false,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      moveMenuScreen: false,

      // shrinkMainScreen: true,
      // sh
      style: DrawerStyle.defaultStyle,
      controller: controller.drawerController,
      menuBackgroundColor: AppColors.whiteColor,
      menuScreenWidth: double.infinity,
      slideWidth: controller.size.width * 0.5,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      boxShadow: [
        BoxShadow(
          color: themeProvider.darkTheme
              ? AppColors.greyTextColor.withOpacity(0.15)
              : AppColors.greyTextColor.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(-10, 15), // changes position of shadow
        ),
      ],
      menuScreen: BuildMenu(),
      mainScreen: Obx(
        () => WillPopScope(
          onWillPop: () async => await controller.willPopScopeFunction(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: AppColors.whiteColor,
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: controller.selectedBottomIndex.value,
              onTap: (ind) {
                setState(() {
                  controller.selectedBottomIndex.value = ind;
                });
              },
              items: [
                SalomonBottomBarItem(
                  selectedColor: AppColors.accentTextColor.withOpacity(0.2),
                  icon: Image.asset(
                    AppIcons.bottomBar1Img,
                    color: AppColors.whiteColor,
                    width: 4.5.h,
                    height: 4.5.h,
                  ),
                  title: Text(
                    "Meet",
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 10.sp),
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar1Img,
                    color: AppColors.whiteColor,
                    width: 4.h,
                    height: 4.h,
                  ),
                ),

                SalomonBottomBarItem(
                  selectedColor: AppColors.accentTextColor.withOpacity(0.2),
                  // backgroundColor: themeProvider.darkTheme
                  //     ? AppColors.accentTextColor.withOpacity(0.2)
                  //     : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar2Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar2Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title:  Text(
                    "Trainer",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),

                SalomonBottomBarItem(
                  // badge: Badge(),
                  // backgroundColor: themeProvider.darkTheme
                  //     ? AppColors.accentTextColor.withOpacity(0.2)
                  //     : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar3Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  selectedColor: AppColors.accentTextColor.withOpacity(0.2),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar3Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),

                SalomonBottomBarItem(
                  selectedColor: AppColors.accentTextColor.withOpacity(0.2),
                  // badge: Badge(),
                  // backgroundColor: themeProvider.darkTheme
                  //     ? AppColors.accentTextColor.withOpacity(0.2)
                  //     : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.chatIconImg,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.chatIconImg,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Chat",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),

                SalomonBottomBarItem(
                  selectedColor: AppColors.accentTextColor.withOpacity(0.2),
                  // badge: Badge(),
                  // backgroundColor: themeProvider.darkTheme
                  //     ? AppColors.accentTextColor.withOpacity(0.2)
                  //     : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar5Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar5Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Doctor",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),
              ],
            ),
            /*bottomNavigationBar: BubbleBottomBar(
              opacity: 0.2,
              currentIndex: controller.selectedBottomIndex.value,
              onTap: (ind) {
                setState(() {
                  controller.selectedBottomIndex.value = ind!;
                });
              },
              backgroundColor: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              //new
              hasInk: true, //new, gives a cute ink effect
              inkColor: themeProvider.darkTheme
                  ? AppColors.accentColor.withOpacity(0.12)
                  : Colors
                      .black12, //optional, uses theme color if not specified
              tilesPadding: const EdgeInsets.symmetric(vertical: 8),
              items: <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                  badge: Badge(),
                  backgroundColor: themeProvider.darkTheme
                      ? AppColors.accentTextColor.withOpacity(0.2)
                      : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar1Img,
                    color: AppColors.whiteColor,
                    width: 4.5.h,
                    height: 4.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar1Img,
                    color: AppColors.whiteColor,
                    width: 4.h,
                    height: 4.h,
                  ),
                  title:  Text(
                    "Meet",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),
                BubbleBottomBarItem(
                  badge: Badge(),
                  backgroundColor: themeProvider.darkTheme
                      ? AppColors.accentTextColor.withOpacity(0.2)
                      : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar2Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar2Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title:  Text(
                    "Trainer",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                BubbleBottomBarItem(
                  badge: Badge(),
                  backgroundColor: themeProvider.darkTheme
                      ? AppColors.accentTextColor.withOpacity(0.2)
                      : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar3Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar3Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),
                BubbleBottomBarItem(
                  badge: Badge(),
                  backgroundColor: themeProvider.darkTheme
                      ? AppColors.accentTextColor.withOpacity(0.2)
                      : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.chatIconImg,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.chatIconImg,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Chat",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),
                BubbleBottomBarItem(
                  badge: Badge(),
                  backgroundColor: themeProvider.darkTheme
                      ? AppColors.accentTextColor.withOpacity(0.2)
                      : AppColors.blackTextColor,
                  icon: Image.asset(
                    AppIcons.bottomBar5Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  activeIcon: Image.asset(
                    AppIcons.bottomBar5Img,
                    color: AppColors.whiteColor,
                    width: 3.5.h,
                    height: 3.5.h,
                  ),
                  title: Text(
                    "Doctor",
                    style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp),
                  ),
                ),
              ],

            ),*/
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    themeProvider.darkTheme
                        ? AppImages.backgroundImgDark
                        : AppImages.backgroundImgLight,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(AppShades.bgShadeLeftImg),
                ),
                controller.screenPages[controller.selectedBottomIndex.value],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
