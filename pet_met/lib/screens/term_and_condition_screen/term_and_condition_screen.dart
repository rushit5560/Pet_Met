import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';

import '../../controllers/term_and_condition_screen_controller.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class TermAndConditionScreen extends StatelessWidget {
  TermAndConditionScreen({Key? key}) : super(key: key);

  final termAndConditionScreenController = Get.put(TermAndConditionScreenController());

  DarkThemeProvider themeProvider =
  Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> termAndConditionScreenController.isLoading.value
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
                    title: "Terms & Condition",
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
                            Html(
                              data: termAndConditionScreenController
                                  .description.value,
                              style: {
                                "p": Style(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.blackTextColor,
                                  fontSize: const FontSize(15.0),
                                  fontWeight: FontWeight.w500,
                                ),
                                "body": Style(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.blackTextColor,
                                  fontSize: const FontSize(15.0),
                                  fontWeight: FontWeight.w500,
                                ),
                                "b": Style(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.blackTextColor,
                                  fontSize: const FontSize(15.0),
                                  fontWeight: FontWeight.w500,
                                ),
                                "span": Style(
                                  color: themeProvider.darkTheme
                                      ? AppColors.whiteColor
                                      : AppColors.blackTextColor,
                                  fontSize: const FontSize(15.0),
                                  fontWeight: FontWeight.w500,
                                ),

                              },
                            ),

                          ],
                        ).commonAllSidePadding(padding: 16),
                      ).commonSymmetricPadding(
                          vertical: 20, horizontal: 20),
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
