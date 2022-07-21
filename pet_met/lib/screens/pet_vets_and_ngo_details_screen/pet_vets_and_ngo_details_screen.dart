import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

import '../../utils/common_widgets/loader.dart';
import 'pet_vets_and_ngo_details_screen_widgets.dart';

class PetVetsAndNgoDetailsScreen extends StatelessWidget {
  PetVetsAndNgoDetailsScreen({
    Key? key,
    this.petVetsId,
  }) : super(key: key);

  final dynamic petVetsId;

  final petVetsAndNgoDetailsScreenController =
      Get.put(PetVetsAndNgoDetailsScreenController());

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
                Obx(
                  () => Expanded(
                    child: petVetsAndNgoDetailsScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                BannerImageModule(),
                                SizedBox(
                                    height: petVetsAndNgoDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                VetAndNgoNameAndSocialMediaButtonModule(),
                                SizedBox(
                                    height: petVetsAndNgoDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                VetAndNgoPlaceTimePaymentModule(),
                                SizedBox(
                                    height: petVetsAndNgoDetailsScreenController
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
    );
  }
}
