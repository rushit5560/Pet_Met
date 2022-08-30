import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
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
                ),
                Obx(
                  () => Expanded(
                    child: petVetsAndNgoDetailsScreenController.isLoading.value
                        ? const CustomAnimationLoader()
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BannerImageModule(),
                                SizedBox(
                                    height: petVetsAndNgoDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                NgoAchivementPictureListModule(),
                                const SizedBox(height: 15),
                                VetAndNgoNameAndSocialMediaButtonModule(),
                                const SizedBox(height: 15),
                                // SizedBox(
                                //     height: petVetsAndNgoDetailsScreenController
                                //             .size.height *
                                //         0.005.w),
                                VetAndNgoPlaceTimePaymentModule(),
                                SizedBox(
                                    height: petVetsAndNgoDetailsScreenController
                                            .size.height *
                                        0.005.w),
                                DonateForPetLoversButtonModule(),
                                SizedBox(height: 10),
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
