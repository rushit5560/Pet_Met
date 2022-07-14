import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_and_grooming_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class ShopListModule extends StatelessWidget {
  ShopListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopAndGroomingScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.shopList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        String shopName = screenController.shopList[i];
        return _shopListTile(shopName);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _shopListTile(String shopName) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.shopDetailsScreenRoute);
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
              blurRadius: 1,
              spreadRadius: 1,
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
