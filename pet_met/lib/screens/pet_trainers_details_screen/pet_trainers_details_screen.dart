import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import 'pet_trainers_details_screen_widgets.dart';

class PetTrainersDetailsScreen extends StatelessWidget {
  PetTrainersDetailsScreen({Key? key}) : super(key: key);
  final petTrainersDetailsScreenController =
      Get.put(PetTrainersDetailsScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: PayButtonModule(),
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
                  title: 'Trainer Details',
                ),
                Expanded(
                  child: Obx(
                    () => petTrainersDetailsScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PetTrainerBannerImageModule(),
                                SizedBox(
                                    height: petTrainersDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                PetTrainerPicturesModule(),
                                SizedBox(
                                    height: petTrainersDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                PetTrainerNameAndSocialMediaButtonModule(),
                                SizedBox(
                                    height: petTrainersDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                PetTrainerPlaceTimePaymentModule(),
                                SizedBox(
                                    height: petTrainersDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                // petTrainersDetailsScreenController
                                //         .isShowStatus.value
                                //     ? CallUsTextModule()
                                //     : Container(),
                                const SizedBox(height: 10),
                                PetTrainerOverViewModule(),
                                SizedBox(
                                    height: petTrainersDetailsScreenController
                                            .size.height *
                                        0.002.w),

                                PayButtonModule()
                              ],
                            ).commonSymmetricPadding(horizontal: 5),
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
