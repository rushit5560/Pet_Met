import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/support_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);

  final controller = Get.put(SupportController());
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.25,
            ),
            BackGroundRightShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.45,
              rightPad: -controller.size.width * 0.25,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Support",
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 4.h),
                                  Image.network(
                                    ApiUrl.apiImagePath +
                                        controller.featuredImage,
                                    height: 20.w,
                                    errorBuilder: (context, obj, st) {
                                      return Image.asset(
                                        AppImages.petMetLogoImg,
                                        height: 20.w,
                                        // width: 20.w,
                                      );
                                    },
                                  ),
                                  // SizedBox(height: 5.h),
                                  // Text(
                                  //   controller.title,
                                  //   style: TextStyle(
                                  //     color: AppColors.accentTextColor,
                                  //     fontSize: 24.sp,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  SizedBox(height: 5.h),
                                  Html(
                                    data: controller.content,
                                    style: {
                                      "p": Style(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                        fontSize: const FontSize(20.0),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    },
                                  ),
                                  /*contactInfoRow(
                                    imageAsset: AppIcons.emailImg,
                                    textdata: "Support@petomate.com",
                                  ),
                                  SizedBox(height: 2.4.h),
                                  contactInfoRow(
                                    imageAsset: AppIcons.callIconImg,
                                    textdata: "+91 98725 25571",
                                  ),
                                  SizedBox(height: 2.4.h),
                                  contactInfoRow(
                                    imageAsset: AppIcons.whatsappImg,
                                    textdata: "+91 98725 12345",
                                  ),*/
                                ],
                              ),
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

  Widget contactInfoRow({
    final imageAsset,
    final textdata,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageAsset,
          height: 20,
          color: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.blackTextColor,
        ),
        SizedBox(width: 15),
        Text(
          textdata,
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
