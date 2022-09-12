import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';

import '../../controllers/index_screen_controller.dart';
import '../../services/providers/dark_theme_provider.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    Key? key,
    this.appBarOption = AppBarOption.none,
    this.title = "",
    this.centerWidget,
    this.trailingWidget,
    this.isTitleText = true,
  }) : super(key: key);

  final String title;
  bool? isTitleText;
  Widget? centerWidget;
  Widget? trailingWidget;
  final AppBarOption appBarOption;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final indexController = Get.put(IndexScreenController());

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return SizedBox(
      height: size.height * 0.065,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side Button Module
          GestureDetector(
            onTap: () {
              if (widget.appBarOption == AppBarOption.singleBackButtonOption) {
                Get.back();
              } else if (widget.appBarOption ==
                  AppBarOption.drawerButtonOption) {
                indexController.drawerController.open!();
              } else {
                null;
              }
            },
            child: SizedBox(
              height: 25,
              width: 25,
              child: leadingWidget(),
            ).commonSymmetricPadding(horizontal: 20, vertical: 15),
          ),

          // Title Text Module
          /*Expanded(
            child:*/
          widget.isTitleText!
              ? Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.accentTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : widget.centerWidget!,
          // ),

          // Right Side Button Module
          SizedBox(
            height: 25,
            width: 25,
            child: widget.trailingWidget,
          ).commonSymmetricPadding(horizontal: 20, vertical: 8),
        ],
      ),
    );
  }

  leadingWidget() {
    final themeProvider = Provider.of<DarkThemeProvider>(Get.context!);
    setState(() {});

    log("${themeProvider.darkTheme}");
    if (widget.appBarOption == AppBarOption.singleBackButtonOption) {
      return Image.asset(
        AppIcons.backButtonImg,
      );
    } else if (widget.appBarOption == AppBarOption.drawerButtonOption) {
      return Image.asset(
        AppIcons.drawerButtonImg,
        color: themeProvider.darkTheme
            ? AppColors.whiteColor
            : AppColors.blackTextColor.withOpacity(0.8),
      );
    } else {
      return Container();
    }
  }

  trailingWidget1() {
    if (widget.appBarOption == AppBarOption.singleBackButtonOption) {
      return Image.asset(
        AppIcons.profilePetImg,
      );
    } else {
      return Container();
    }
  }
}
