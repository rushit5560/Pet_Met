import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/faq_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_images.dart';

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(AppImages.tealBackgroundImg),
    );
  }
}

class FaqListModule extends StatelessWidget {
  FaqListModule({Key? key}) : super(key: key);

  final controller = Get.find<FaqController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.questionsList.length,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
      ),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            controller.questionsList[index],
            style: TextStyle(
              fontSize: 13.sp,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
          ).commonSymmetricPadding(horizontal: 10),
        ),
        theme: ExpandableThemeData(
            animationDuration: const Duration(milliseconds: 500),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
         iconColor: themeProvider.darkTheme
             ? AppColors.whiteColor
             : AppColors.blackTextColor,

        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. ",
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
          ),
        ),
      ).commonSymmetricPadding(vertical: 5),
    ).commonSymmetricPadding(vertical: 5);
    /*return ExpansionTile(
      // backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,

      title: Text("Dog"),
      children: [],
    );*/
  }
}
