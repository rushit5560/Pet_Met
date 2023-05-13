import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/about_controller.dart';
import 'package:pet_met/screens/about_screen/about_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';



class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  final controller = Get.put(AboutController());
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
                  title: "About Us",
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: SizedBox(
                                height: 86.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 1.h),
                                    // Text(
                                    //   "Pet'o Care",
                                    //   style: TextStyle(
                                    //     color: AppColors.accentTextColor,
                                    //     fontSize: 20.sp,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    SizedBox(height: 1.h),
                                    Expanded(child: AboutUsModule()),
                                  ],
                                ),
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
}
