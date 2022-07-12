import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/faq_controller.dart';
import 'package:pet_met/controllers/register_controller.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';

import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/common_widgets/custom_light_passfield.dart';
import '../../utils/common_widgets/custom_light_textfield.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({Key? key}) : super(key: key);

  final controller = Get.put(FaqController());

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
              child: Image.asset("assets/images/logintopright.png"),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Faq",
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 20, left: 20, right: 20, bottom: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Image.asset(
                //           "assets/icons/left_back_arrow.png",
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       const SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Container(
                        height: 86.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 1.h),
                            // Text(
                            //   "Faq",
                            //   style: TextStyle(
                            //     color: AppColors.accentTextColor,
                            //     fontSize: 20.sp,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(height: 1.h),
                            Expanded(
                              child: Container(
                                height: 80.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                width: double.infinity,
                                // decoration: BoxDecoration(
                                //   // color: AppColors.whiteColor,
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(12),
                                //   ),
                                // ),
                                child: ListView.separated(
                                  itemCount: 10,
                                  itemBuilder: (ctx, ind) {
                                    return faqQuestionsListItem(ind);
                                  },
                                  separatorBuilder: (ctx, ind) {
                                    return SizedBox(height: 1.5.h);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget faqQuestionsListItem(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            controller.questionsList[index],
            style: TextStyle(fontSize: 13.sp),
          ).commonSymmetricPadding(horizontal: 10),
        ),
        theme: const ExpandableThemeData(
            animationDuration: Duration(milliseconds: 500),
            headerAlignment: ExpandablePanelHeaderAlignment.center),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
              "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. "),
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
