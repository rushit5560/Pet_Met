import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_screen_controller.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class PetTrainerListModule extends StatelessWidget {
  PetTrainerListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.trainersList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        Trainers trainerSingleItem = screenController.trainersList[i];
        return _petTrainerListTile(trainerSingleItem);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _petTrainerListTile(Trainers trainerSingleItem) {
    String imgUrl = ApiUrl.apiImagePath + trainerSingleItem.showimg;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.petTrainerDetailsScreenRoute,
            arguments: trainerSingleItem.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              themeProvider.darkTheme ? AppColors.darkThemeColor : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 0),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 65,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(30),
              //   color: Colors.grey,
              // ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imgUrl, errorBuilder: (context, er, ob) {
                    return Image.asset(AppImages.petMetLogoImg);
                  })),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainerSingleItem.shopename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(height: 1.w),
                  Text(
                    trainerSingleItem.address,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.blackTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }
}
