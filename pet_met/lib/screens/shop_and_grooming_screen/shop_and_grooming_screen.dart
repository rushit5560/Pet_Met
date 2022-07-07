import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_and_grooming_screen_controller/shop_and_grooming_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'shop_and_grooming_screen_widgets.dart';

class ShopAndGroomingScreen extends StatelessWidget {
  ShopAndGroomingScreen({Key? key}) : super(key: key);
  final shopAndGroomingScreenController = Get.put(ShopAndGroomingScreenController());

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
                const CustomAppBar(title: "Shop & Grooming"),
                Expanded(child: ShopListModule()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
