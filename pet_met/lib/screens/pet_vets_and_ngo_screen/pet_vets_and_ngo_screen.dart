import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../services/providers/dark_theme_provider.dart';
import 'pet_vets_and_ngo_screen_Widgets.dart';

class PetVetsAndNgoScreen extends StatelessWidget {
  PetVetsAndNgoScreen({Key? key}) : super(key: key);
  final petVetsAndNgoScreenController =
      Get.put(PetVetsAndNgoScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            BackGroundLeftShadow(
              height: petVetsAndNgoScreenController.size.height * 0.3,
              width: petVetsAndNgoScreenController.size.height * 0.3,
              topPad: petVetsAndNgoScreenController.size.height * 0.28,
              leftPad: -petVetsAndNgoScreenController.size.width * 0.15,
            ),
            Column(
              children: [
                CustomAppBar(
                  title: "Pet Vets & NGO",
                  appBarOption: AppBarOption.drawerButtonOption,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: petVetsAndNgoScreenController.isLoading.value
                      ? const CustomAnimationLoader()
                      : Column(
                          children: [
                            SearchVetAndNgoTextFieldModule(),
                            Expanded(child: VetsAndNgoListModule()),
                          ],
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
