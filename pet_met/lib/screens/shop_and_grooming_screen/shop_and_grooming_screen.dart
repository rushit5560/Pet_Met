import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/shop_and_grooming_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'shop_and_grooming_screen_widgets.dart';

class ShopAndGroomingScreen extends StatelessWidget {
  ShopAndGroomingScreen({Key? key}) : super(key: key);
  final shopAndGroomingScreenController =
      Get.put(ShopAndGroomingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AppImages.tealBackgroundImg),
          ),
          BackGroundLeftShadow(
            height: shopAndGroomingScreenController.size.height * 0.3,
            width: shopAndGroomingScreenController.size.height * 0.3,
            topPad: shopAndGroomingScreenController.size.height * 0.28,
            leftPad: -shopAndGroomingScreenController.size.width * 0.15,
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(title: "Shop & Grooming",
                appBarOption: AppBarOption.drawerButtonOption,
                ),
                Expanded(
                  child: shopAndGroomingScreenController.isLoading.value ?
                  SizedBox(
                    // width: double.infinity,
                    height: 60,
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.accentTextColor,
                      size: 40,
                    ),
                  ):
                  ShopListModule(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
