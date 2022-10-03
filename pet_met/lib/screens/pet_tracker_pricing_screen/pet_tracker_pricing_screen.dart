import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_tracker_pricing_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';



class PetTrackerPricingScreen extends StatelessWidget {
  PetTrackerPricingScreen({Key? key}) : super(key: key);
  final controller = Get.put(PetTrackerPricingController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.38,
              leftPad: -controller.size.width * 0.15,
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
                  title: "Subscription Details",
                ),
                Obx(
                  () => Expanded(
                    child: controller.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: controller.size.height * 0.18),
                                  Container(
                                    height: controller.size.height * 0.58,
                                    width: double.infinity,
                                    child: PetTrackerPriceModule(
                                      controller: controller,
                                      planTypeText: controller.name,
                                    ),
                                  ),
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
}

class PetTrackerPriceModule extends StatelessWidget {
  PetTrackerPriceModule({
    Key? key,
    required this.controller,
    required this.planTypeText,
  }) : super(key: key);

  final PetTrackerPricingController controller;
  final String planTypeText;

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: controller.size.height * 0.52,
          width: controller.size.width * 0.8,
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeBoxColor
                : AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: controller.size.height * 0.09),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      planTypeText.toUpperCase(),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 20,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.greyTextColor,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: controller.size.height * 0.24,
                  width: controller.size.width * 0.75,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          '(${controller.days} days subscription)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.greyTextColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Html(
                          data: controller.overview,
                          style: {
                            "body": Style(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor,
                              fontSize: FontSize(12.sp),
                              fontWeight: FontWeight.w500,
                            ),
                            "p": Style(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor,
                              fontSize: FontSize(12.sp),
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
                        /*PetTrackingDetailsCheckModule(
                          detailsText: controller.overview,
                        ),
                        PetTrackingDetailsCheckModule(
                          detailsText: "valid for ${controller.overview} days",
                        ),
                        PetTrackingDetailsCheckModule(),*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        if(controller.planActivated == "true") {
                          Fluttertoast.showToast(msg: 'Selected plan already activated.');
                        } else {
                          controller.openCheckout();
                        }

                        /*if (controller.planDetailsData[0].isActive == "1") {
                          Fluttertoast.showToast(msg: "Already Purchased");
                        } else {
                          controller.openCheckout();
                        }*/
                      },
                      style: ElevatedButton.styleFrom(
                        primary: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.accentColor,
                        fixedSize: Size(Get.size.width * 0.32, 40),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          controller.planActivated == "true"
                              ? "Activated"
                              : "Buy",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.accentColor
                                : AppColors.whiteColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: controller.size.height * 0.12,
            width: controller.size.height * 0.12,
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 12),
                  //     child: Text(
                  //       "₹",
                  //       style: TextStyle(
                  //         color: AppColors.whiteColor,
                  //         fontSize: 15.sp,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "₹ " + controller.price.toString(),
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PetTrackingDetailsCheckModule extends StatelessWidget {
  PetTrackingDetailsCheckModule({
    Key? key,
    this.detailsText,
  }) : super(key: key);

  final String? detailsText;

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 15,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.accentTextColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.whiteColor,
              size: 12,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.58,
                child: Text(
                  detailsText == null
                      ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                      : detailsText!,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // child: Html(
                //   data:  detailsText == null
                //         ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                //         : detailsText!,
                // ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
