import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/faq_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_images.dart';

class BackgroundCurve extends StatelessWidget {
  BackgroundCurve({Key? key}) : super(key: key);

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(themeProvider.darkTheme
          ? AppImages.backgroundImgDark
          : AppImages.backgroundImgLight),
    );
  }
}

class FaqListModule extends StatelessWidget {
  FaqListModule({Key? key}) : super(key: key);

  final controller = Get.find<FaqController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.faqList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (ctx, ind) {
        return faqQuestionsListItem(ind);
      },
      separatorBuilder: (ctx, ind) {
        return SizedBox(height: 1.5.h);
      },
    );
  }

  Widget faqQuestionsListItem(int index) {
    DarkThemeProvider themeProvider =
        Provider.of<DarkThemeProvider>(Get.context!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: themeProvider.darkTheme
              ? AppColors.darkThemeBoxColor
              : AppColors.whiteColor,
        ),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Text(
              controller.faqList[index].question,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontWeight: FontWeight.w600),
            ).commonSymmetricPadding(horizontal: 10),
          ),
          theme: ExpandableThemeData(
            animationDuration: const Duration(milliseconds: 500),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconColor: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.accentColor,
          ),
          collapsed: Container(),
          expanded: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Html(
                data: controller.faqList[index].answer,
                style: {
                  "body": Style(
                    fontSize: FontSize(10.sp),
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                  ),
                  "p": Style(
                    fontSize: FontSize(10.sp),
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                  ),
                  "b": Style(
                    fontSize: FontSize(10.sp),
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                  ),
                  "span": Style(
                    fontSize: FontSize(10.sp),
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                  ),
                },
              )
              /*child: Text(
              controller.faqList[index].answer,
              style: TextStyle(
                fontSize: 14,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.greyTextColor,
              ),
            ),*/
              ),
        ).commonSymmetricPadding(vertical: 5),
      ).commonSymmetricPadding(vertical: 5),
    );
    /*return ExpansionTile(
      // backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,

      title: Text("Dog"),
      children: [],
    );*/
  }
}
