import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_care_info_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class PetCareListModule extends StatelessWidget {
  PetCareListModule({Key? key}) : super(key: key);
  final controller = Get.find<PetCareInfoController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: controller.size.height * 0.85,
      child: ListView.separated(
        itemCount: controller.petCareInfosList.length,
        separatorBuilder: (ctx, ind) {
          return SizedBox(
            height: 2.5.h,
          );
        },
        itemBuilder: (ctx, ind) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentTextColor,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 15,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.petCareInfosList[ind].name!,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.petCareInfosList[ind].description!,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.75)
                            : AppColors.blackTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
