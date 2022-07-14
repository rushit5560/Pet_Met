import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/privacy_policy_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);
  final privacyPolicyScreenController =
      Get.put(PrivacyPolicyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.tealBackgroundImg),
            ),
            Column(
              children: [
                CustomAppBar(
                  title: "Privacy Policy",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Any information you place on Pet’o Mate app is treated with the utmost care.",
                          style: TextStyle(
                            color: AppColors.accentTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                            height: privacyPolicyScreenController.size.height *
                                0.001.h),
                        Text(
                          "Certain information including your IP address, domain name is collected through cookies and similar "
                          "technologies for a limited purpose. This is to learn which parts of our site you are visiting and to "
                          "improve user experience next time you visit our site. We do not link the information to anything personally "
                          "identifiable, meaning while a user’s session is tracked, the users remain anonymous. Only aggregated statistics"
                          " are captured to make the web site more informative and useful to the visitors."
                          "Our site’s inquiry form requires you to give us contact information such as your name and email address. "
                          "We may use this contact information to send you information about our "
                          "company services and the continuous upgrades in our offerings. In the event that you choose to not receive "
                          "such emails, please use the unsubscribe button and we will ensure that the information emails are stopped. "
                          "Of course, you are welcome to opt to reenter our mail list at any time in the future.",
                          style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor),
                        ),
                      ],
                    ).commonAllSidePadding(padding: 20),
                  ).commonAllSidePadding(padding: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
