import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_details_screen_controller/shop_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

import 'shop_details_screen_widgets.dart';

class ShopDetailsScreen extends StatelessWidget {
  ShopDetailsScreen({Key? key}) : super(key: key);
  final shopDetailsScreenController = Get.put(ShopDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.tealBackgroundImg),
            ),

            Column(
              children: [
                const CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                // SizedBox(height: 2.w),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BannerImageModule(),
                        SizedBox(height: shopDetailsScreenController.size.height * 0.003.w),
                        OffersModule(),

                        SizedBox(height: shopDetailsScreenController.size.height * 0.005.w),
                        ShopNameAndSocialMediaButtonModule(),

                        SizedBox(height: shopDetailsScreenController.size.height * 0.005.w),
                        ShopPlaceTimePaymentModule(),

                        SizedBox(height: shopDetailsScreenController.size.height * 0.005.w),
                        MeetingAvailabilityModule(),

                        SizedBox(height: shopDetailsScreenController.size.height * 0.005.w),
                        OverViewModule(),
                      ],
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
