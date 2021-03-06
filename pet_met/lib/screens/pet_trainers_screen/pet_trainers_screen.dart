import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pet_met/controllers/pet_trainers_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';

import 'pet_trainers_screen_widgets.dart';

class PetTrainersScreen extends StatelessWidget {
  PetTrainersScreen({Key? key}) : super(key: key);
  final petTrainersScreenController = Get.put(PetTrainersScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.tealBackgroundImg),
            ),
            BackGroundLeftShadow(
              height: petTrainersScreenController.size.height * 0.3,
              width: petTrainersScreenController.size.height * 0.3,
              topPad: petTrainersScreenController.size.height * 0.28,
              leftPad: -petTrainersScreenController.size.width * 0.15,
            ),
            Column(
              children: [
                CustomAppBar(title: "Pet Trainers",
                    appBarOption: AppBarOption.drawerButtonOption),
                Expanded(
                    child: petTrainersScreenController.isLoading.value
                    ? const CustomAnimationLoader()
                    : PetTrainerListModule(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
