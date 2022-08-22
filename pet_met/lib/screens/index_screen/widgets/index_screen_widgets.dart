import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/about_screen/about_screen.dart';
import 'package:pet_met/screens/change_password_screen/change_password_screen.dart';
import 'package:pet_met/screens/faq_screen/faq_screen.dart';
import 'package:pet_met/screens/meeting_orders_screen/meeting_orders_screen.dart';
import 'package:pet_met/screens/pet_activity_screen/pet_activity_screen.dart';
import 'package:pet_met/screens/pet_care_info_screen/pet_care_info_screen.dart';
import 'package:pet_met/screens/pet_pricing_screen/pet_pricing_screen.dart';
import 'package:pet_met/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:pet_met/screens/rate_app_screen/rate_app_screen.dart';
import 'package:pet_met/screens/subscription_report_screen/subscription_report_screen.dart';
import 'package:pet_met/screens/support_screen/support_screen.dart';
import 'package:pet_met/screens/user_profile_screen/user_profile_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/theme_preferences.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_controller.dart';
import '../../../controllers/index_screen_controller.dart';
import '../../../services/providers/dark_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/common_widgets/background_widgets.dart';

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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: GestureDetector(
                    onTap: () {
                      // indexController.drawerController.close!();
                      // Get.to(() => UserProfileScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserDetails.categoryId == "1"
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                  ApiUrl.apiImagePath +
                                      "asset/uploads/product/" +
                                      UserDetails.userProfileImage,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                  errorBuilder: (context, st, ob) {
                                    return Image.asset(AppImages.petMetLogoImg, width: 40,
                                      height: 50,
                                      fit: BoxFit.cover);
                                  },
                                  // width: controller.size.width * 0.05,
                                ),
                            )
                            : UserDetails.categoryId == "2"
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                      ApiUrl.apiImagePath +
                                          "asset/uploads/product/" +
                                          UserDetails.shopProfile,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                      errorBuilder: (context, st, ob) {
                                        return Image.asset(
                                            AppImages.petMetLogoImg,
                                          width: 40,
                                          height: 50,
                                          fit: BoxFit.cover);
                                      },
                                      // width: controller.size.width * 0.05,
                                    ),
                                )
                                : UserDetails.categoryId == "3"
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                          ApiUrl.apiImagePath +
                                              "asset/uploads/product/" +
                                              UserDetails.userProfileImage,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                          errorBuilder: (context, st, ob) {
                                            return Image.asset(AppImages.petMetLogoImg,
                                              width: 40,
                                              height: 50,
                                              fit: BoxFit.cover);
                                          },
                                          // width: controller.size.width * 0.05,
                                        ),
                                    )
                                    : UserDetails.categoryId == "4"
                                        ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(
                                              UserDetails.userProfileImage,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                              errorBuilder: (context, st, ob) {
                                                return Image.asset(AppImages.petMetLogoImg,
                                                    width: 40,
                                                    height: 50,
                                                    fit: BoxFit.cover);
                                              },
                                              // width: controller.size.width * 0.05,
                                            ),
                                        )
                                        : Image.asset(
                                            AppImages.userProfileImg,
                                            width: 40,
                                            height: 40,
                                          ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserDetails.categoryId == "1"
                                  ? UserDetails.userName
                                  : UserDetails.categoryId == "2"
                                      ? UserDetails.shopName
                                      : UserDetails.categoryId == "3"
                                          ? UserDetails.userName
                                          : UserDetails.categoryId == "4"
                                              ? UserDetails.userName
                                              : "",
                              style: TextStyle(
                                color: AppColors.accentTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Active Status",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      // top: controller.size.height * 0.08,
                      // bottom: controller.size.height * 0.08,
                      left: 5,
                      right: controller.size.width * 0.48,
                    ),
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                            },
                            leading: Image.asset(
                              AppIcons.bottomBar3Img,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Home",
                              style: TextStyle(
                                color: AppColors.accentTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> PetCareInfoScreen());
                            },
                            leading: Image.asset(
                              AppIcons.adoptionImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Pet Care",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> SupportScreen());
                            },
                            leading: Image.asset(
                              AppIcons.supportImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Support",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(() => AboutScreen());
                            },
                            leading: Image.asset(
                              AppIcons.aboutImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "About",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(() => FaqScreen());
                            },
                            leading: Image.asset(
                              AppIcons.faqImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Faq",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(() => PrivacyPolicyScreen());
                            },
                            leading: Image.asset(
                              AppIcons.privacyPolicyImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                            },
                            leading: Image.asset(
                              AppIcons.shareImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Share App",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () async {
                              indexController.drawerController.close!();
                              await deleteAccountDialog();
                            },
                            leading: Image.asset(
                              AppIcons.deleteImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Delete Account",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> ChangePasswordScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500));
                            },
                            leading: Icon(
                              Icons.edit_note_rounded,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              size: 22,
                            ),
                            titleWidget: Text(
                              "Change Password",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          /*drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> RateAppScreen());
                            },
                            leading: Image.asset(
                              AppIcons.rateImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Rate App",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),*/
                          /*drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(() => PetActivityScreen());
                            },
                            leading: Image.asset(
                              AppIcons.rateImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Pet Activity",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),*/
                          drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> PetPricingScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(milliseconds: 500));
                            },
                            leading: Image.asset(
                              AppIcons.rateImg,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              height: 22,
                            ),
                            titleWidget: Text(
                              "Subscription",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                          UserDetails.categoryId == "1" || UserDetails.categoryId == "2"
                          ? drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> MeetingOrdersScreen());
                            },
                            leading: Icon(
                              Icons.edit_note_rounded,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              size: 22,
                            ),
                            titleWidget: Text(
                              "Meeting Report",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ) : Container(),

                          UserDetails.categoryId == "2" || UserDetails.categoryId == "4"
                              ? drawerListTile(
                            onTap: () {
                              indexController.drawerController.close!();
                              Get.to(()=> SubscriptionReportScreen());
                            },
                            leading: Icon(
                              Icons.edit_note_rounded,
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.greyTextColor,
                              size: 22,
                            ),
                            titleWidget: Text(
                              "Subscription Report",
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ) : Container(),


                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Container(
                                // height: 45,
                                width: 65,
                                child: DayNightSwitcher(
                                  isDarkModeEnabled: themeChange.darkTheme,
                                  onStateChanged: (val) async {
                                    print("theme is changed  : " +
                                        val.toString());

                                    themeChange.darkTheme = val;
                                    var themeIs =
                                        await DarkThemePreference().getTheme();

                                    print("theme is " + themeIs.toString());
                                  },
                                ),
                              ),

                              // Image.asset(
                              //   "assets/icons/paintboard.png",
                              //   height: 28,
                              // ),
                              const SizedBox(width: 12),
                              Text(
                                "Theme",
                                style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.greyTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.greyTextColor,
                            thickness: 1.5,
                            width: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () async {
                            await indexController.userLogOutFunction();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.greyTextColor,
                                  fontSize: 12.sp,
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
          ],
        ),
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

  deleteAccountDialog() {
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
            horizontal: 15,
            vertical: 25,
          ),
          height: controller.size.height * 0.35,
          width: controller.size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.delete_forever,
                color: AppColors.redColor,
                size: 60,
              ),
              // const SizedBox(height: 20),
              Text(
                "You want to delete account Permanently.",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.2,
                ),
              ),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await indexController.deleteAccountFunction();
                      //Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.accentColor,
                      minimumSize: Size(
                        controller.size.width * 0.25,
                        30,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          : AppColors.greyTextColor.withOpacity(0.3),
                      minimumSize: Size(controller.size.width * 0.25, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }
}
