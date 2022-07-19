import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

import 'pet_trainers_details_screen_widgets.dart';

class PetTrainersDetailsScreen extends StatelessWidget {
  PetTrainersDetailsScreen({Key? key}) : super(key: key);
  final petTrainersDetailsScreenController =
      Get.put(PetTrainersDetailsScreenController());

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
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                ),
                Expanded(
                  child: Obx(
                    () => petTrainersDetailsScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
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
                                PetTrainerOverViewModule(),
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
