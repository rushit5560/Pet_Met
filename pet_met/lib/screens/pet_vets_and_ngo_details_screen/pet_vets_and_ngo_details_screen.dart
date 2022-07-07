import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_details_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

import 'pet_vets_and_ngo_details_screen_widgets.dart';

class PetVetsAndNgoDetailsScreen extends StatelessWidget {
  PetVetsAndNgoDetailsScreen({Key? key}) : super(key: key);
  final petVetsAndNgoDetailsScreenController
  = Get.put(PetVetsAndNgoDetailsScreenController());

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

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        BannerImageModule(),
                        SizedBox(height: petVetsAndNgoDetailsScreenController.size.height * 0.005.w),
                        VetAndNgoNameAndSocialMediaButtonModule(),

                        SizedBox(height: petVetsAndNgoDetailsScreenController.size.height * 0.005.w),
                        VetAndNgoPlaceTimePaymentModule(),

                        SizedBox(height: petVetsAndNgoDetailsScreenController.size.height * 0.005.w),
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
