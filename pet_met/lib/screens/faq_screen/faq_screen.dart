import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/faq_controller.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import 'faq_screen_widgets.dart';



class FaqScreen extends StatelessWidget {
  FaqScreen({Key? key}) : super(key: key);

  final controller = Get.put(FaqController());

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
            BackgroundCurve(),
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
                  child: Obx(() => controller.isLoading.value
                      ? const CustomAnimationLoader()
                      : FaqListModule()),
                ),
                // const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Widget faqQuestionsListItem(int index) {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Colors.white,
//     ),
//     child: ExpandablePanel(
//       header: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         child: Text(
//           controller.questionsList[index],
//           style: TextStyle(fontSize: 13.sp),
//         ).commonSymmetricPadding(horizontal: 10),
//       ),
//       theme: const ExpandableThemeData(
//           animationDuration: Duration(milliseconds: 500),
//           headerAlignment: ExpandablePanelHeaderAlignment.center),
//       collapsed: Container(),
//       expanded: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         child: Text(
//             "With tens of thousands of satisfied clients nationwide, we’ve earned a solid reputation as the most trusted and reliable pet care service in the country. And it isn’t just Fetch as a company. "),
//       ),
//     ).commonSymmetricPadding(vertical: 5),
//   ).commonSymmetricPadding(vertical: 5);
//   /*return ExpansionTile(
//     // backgroundColor: Colors.white,
//     collapsedBackgroundColor: Colors.white,

//     title: Text("Dog"),
//     children: [],
//   );*/
// }
}
