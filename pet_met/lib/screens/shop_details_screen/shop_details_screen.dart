import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import 'shop_details_screen_widgets.dart';

class ShopDetailsScreen extends StatelessWidget {
  ShopDetailsScreen({Key? key}) : super(key: key);
  final shopDetailsScreenController = Get.put(ShopDetailsScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                  title: "Details",
                ),
                // SizedBox(height: 2.w),

                Expanded(
                  child: Obx(
                    () => shopDetailsScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                BannerImageModule(),
                                SizedBox(
                                    height: shopDetailsScreenController
                                            .size.height *
                                        0.003.w),
                                shopDetailsScreenController.showStatus.value ==
                                        true
                                    ? OffersModule()
                                    : Container(),
                                SizedBox(
                                    height: shopDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                shopDetailsScreenController.showStatus.value ==
                                        true
                                    ? ShopNameAndSocialMediaButtonModule()
                                    : Container(),
                                SizedBox(
                                    height: shopDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                ShopPlaceTimePaymentModule(),
                                SizedBox(
                                    height: shopDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                shopDetailsScreenController.showStatus.value ==
                                        true
                                    ? MeetingAvailabilityModule()
                                    : Container(),
                                SizedBox(
                                    height: shopDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                OverViewModule(),
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
      bottomNavigationBar: PayButtonModule(),
    );
  }
}
