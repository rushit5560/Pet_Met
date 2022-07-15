import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/rate_app_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class RateAppScreen extends StatelessWidget {
  RateAppScreen({Key? key}) : super(key: key);

  final controller = Get.put(RateAppController());

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

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
              child: Image.asset(AppImages.tealBackgroundImg),
            ),
            Column(
              children: [
                CustomAppBar(
                  title: "Rate App",
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                          horizontal: 25, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 8),
                          // Text(
                          //   "Rate your App",
                          //   style: TextStyle(
                          //     color: AppColors.accentTextColor,
                          //     fontSize: 20.sp,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const SizedBox(height: 45),
                          Container(
                            //height: controller.size.height * 0.4,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: themeProvider.darkTheme
                                  ? AppColors.darkThemeBoxColor
                                  : AppColors.whiteColor,
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    switch (index) {
                                      case 0:
                                        return const Icon(
                                          Icons.sentiment_very_dissatisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 1:
                                        return const Icon(
                                          Icons.sentiment_dissatisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 2:
                                        return const Icon(
                                          Icons.sentiment_neutral,
                                          color: AppColors.accentColor,
                                        );
                                      case 3:
                                        return const Icon(
                                          Icons.sentiment_satisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 4:
                                        return const Icon(
                                          Icons.sentiment_very_satisfied,
                                          color: AppColors.accentColor,
                                        );
                                    }
                                    return const SizedBox();
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Text(
                                      "4",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        color: themeProvider.darkTheme
                                            ? AppColors.whiteColor
                                            : AppColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    fillColor: themeProvider.darkTheme
                                        ? AppColors.greyColor.withOpacity(1)
                                        : AppColors.greyColor.withOpacity(0.12),
                                    hintText:
                                        "Leave Your Feedback Here (Optional)",
                                    hintStyle: TextStyle(
                                      color: themeProvider.darkTheme
                                          ? AppColors.whiteColor
                                          : AppColors.greyTextColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.blackTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  "Your feedback is private and will not be shared with your client",
                                  style: TextStyle(
                                    color: themeProvider.darkTheme
                                        ? AppColors.whiteColor
                                        : AppColors.greyTextColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Container(
                                  height: 35,
                                  width: controller.size.width * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.accentColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
}
