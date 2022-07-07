import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.appBarOption = AppBarOption.none, this.title = ""}) : super(key: key);

  final String title;
  final AppBarOption appBarOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side Button Module
          GestureDetector(
            onTap: () {
              if(appBarOption == AppBarOption.singleBackButtonOption) {
                Get.back();
              }
            },
            child: SizedBox(
              height: 25,
              width: 25,
              child: appBarOption == AppBarOption.singleBackButtonOption
                  ? Image.asset(AppIcons.backButtonImg)
                  : Container(),
            ).commonAllSidePadding(padding: 10),
          ),



          // Title Text Module
          Text(
              title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 25,
              color: AppColors.accentTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),


          // Right Side Button Module
          SizedBox(
            height: 25,
            width: 25,
          ).commonAllSidePadding(padding: 10),

        ],
      ),
    );
  }
}
