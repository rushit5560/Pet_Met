import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/privacy_policy_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);
  final privacyPolicyScreenController =
      Get.put(PrivacyPolicyScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => privacyPolicyScreenController.isLoading.value
            ? const CustomAnimationLoader()
            : SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(themeProvider.darkTheme
                          ? AppImages.backgroundImgDark
                          : AppImages.backgroundImgLight),
                    ),
                    Column(
                      children: [
                        CustomAppBar(
                          title: "Privacy Policy",
                          appBarOption: AppBarOption.singleBackButtonOption,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: themeProvider.darkTheme
                                    ? AppColors.darkThemeBoxColor
                                    : AppColors.whiteColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    privacyPolicyScreenController.title,
                                    style: TextStyle(
                                      color: AppColors.accentTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(
                                      height: privacyPolicyScreenController
                                              .size.height *
                                          0.001.h),
                                  Html(
                                    data: privacyPolicyScreenController
                                        .description,
                                    style: {
                                      "body": Style(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                        fontSize: const FontSize(15.0),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      "p": Style(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                        fontSize: const FontSize(15.0),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    },
                                  ),
                                  /*Text(
                              privacyPolicyScreenController.description,
                              style: TextStyle(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.blackTextColor),
                            ),*/
                                ],
                              ).commonAllSidePadding(padding: 20),
                            ).commonAllSidePadding(padding: 35),
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
