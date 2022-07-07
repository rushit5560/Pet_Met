import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/enums.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.appBarOption, this.title}) : super(key: key);

  final String? title;
  final AppBarOption? appBarOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side Button Module
          SizedBox(
            height: 50,
            width: 50,
            child: appBarOption == AppBarOption.singleBackButtonOption
                ? Image.asset(AppImages.backButtonImg)
                : Container(),
          ),
        ],
      ),
    );
  }
}
