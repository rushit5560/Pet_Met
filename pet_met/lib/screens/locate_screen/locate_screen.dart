import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/locate_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:provider/provider.dart';

import '../../services/providers/dark_theme_provider.dart';

class LocateScreen extends StatelessWidget {
  LocateScreen({Key? key}) : super(key: key);
  final locateScreenController = Get.put(LocateScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background Module
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(themeProvider.darkTheme
                  ? AppImages.backgroundImgDark
                  : AppImages.backgroundImgLight),
            ),
            BackGroundLeftShadow(
              height: locateScreenController.size.height * 0.3,
              width: locateScreenController.size.height * 0.3,
              topPad: locateScreenController.size.height * 0.28,
              leftPad: -locateScreenController.size.width * 0.15,
            ),

            // UI Module
            /*const Center(
              child: Text(
                "Coming Soon!",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.petActivityImg,
                  width: locateScreenController.size.width * 0.45,
                ),
                Text(
                  "Coming Soon!",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.accentTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
