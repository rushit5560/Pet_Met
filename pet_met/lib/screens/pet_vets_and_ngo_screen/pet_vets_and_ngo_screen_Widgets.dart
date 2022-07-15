import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_vets_and_ngo_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class VetsAndNgoListModule extends StatelessWidget {
  VetsAndNgoListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetVetsAndNgoScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.vetsAndNgoList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        String shopName = screenController.vetsAndNgoList[i];
        return _vetsAndNgoListTile(shopName);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _vetsAndNgoListTile(String shopName) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.petVetsAndNgoDetailsScreenRoute);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
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
                    "Beside Kantilal Jewellers, Saragam Shopping Center, U 11-12, Anmol Complex Near, Surat 395007",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
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
