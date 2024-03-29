import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_trainers_screen_controller.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/screens/pet_trainers_details_screen/pet_trainers_details_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';

class SearchTrainersTextFieldModule extends StatelessWidget {
  SearchTrainersTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<PetTrainersScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Form(
      key: screenController.formKey,
      child: Stack(
        children: [
          Container(
            height: screenController.size.height * 0.065,
            width: screenController.size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.25),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: screenController.searchFieldController,
            validator: (val) => Validations().validateSearchTextField(val!),
            cursorColor: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.accentTextColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              fillColor: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor.withOpacity(0.75)
                    : AppColors.greyTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: GestureDetector(
                onTap: () async {
                  screenController.isLoading(true);
                  if (screenController.searchFieldController.text
                      .trim()
                      .isNotEmpty) {
                    screenController.searchTrainersList = screenController
                        .trainersList
                        .where((u) => (u.displayName.toLowerCase().contains(
                            screenController.searchFieldController.text
                                .toLowerCase())))
                        .toList();
                    //screenController.searchFieldController.clear();
                    hideKeyboard();
                    log('screenController.searchTrainersList: ${screenController.searchTrainersList.length}');
                  }
                  screenController.isLoading(false);
                },
                child: Container(
                  height: 4.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentTextColor),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 3.h,
                  ).commonAllSidePadding(padding: 5),
                ).commonAllSidePadding(padding: 8),
              ),
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                screenController.isLoading(true);
                screenController.searchTrainersList.clear();
                screenController.isLoading(false);
              }
            },
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20),
    );
  }
}

class PetTrainerListModule extends StatelessWidget {
  PetTrainerListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetTrainersScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return screenController.searchTrainersList.isEmpty
        ? ListView.builder(
            itemCount: screenController.trainersList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Trainers trainerSingleItem = screenController.trainersList[i];
              return _petTrainerListTile(trainerSingleItem, themeProvider);
            },
          ).commonAllSidePadding(padding: 10)
        : ListView.builder(
            itemCount: screenController.searchTrainersList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Trainers searchTrainerSingleItem =
                  screenController.searchTrainersList[i];
              return searchPetTrainerListTile(
                  searchTrainerSingleItem, themeProvider);
            },
          ).commonAllSidePadding(padding: 10);
  }

  Widget _petTrainerListTile(
      Trainers trainerSingleItem, DarkThemeProvider themeProvider) {
    String imgUrl = ApiUrl.apiImagePath + trainerSingleItem.image;
    return GestureDetector(
      onTap: () {
        Get.to(() => PetTrainersDetailsScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500),
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
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.grey,
                    //       blurRadius: 1.5,
                    //       spreadRadius: 1.5
                    //   )
                    // ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(imgUrl,
                          errorBuilder: (context, er, ob) {
                        return Image.asset(
                          AppImages.petMetLogoImg,
                          // fit: BoxFit.fill
                        );
                      })),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainerSingleItem.displayName,
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
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trainerSingleItem.isVerified == "1"
                ? Image.asset(
                    AppIcons.verifiedSymbolImg,
                    width: 3.5.h,
                    height: 3.5.h,
                  )
                : Container(),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }

  Widget searchPetTrainerListTile(
      Trainers searchTrainerSingleItem, DarkThemeProvider themeProvider) {
    String imgUrl = ApiUrl.apiImagePath + searchTrainerSingleItem.image;
    return GestureDetector(
      onTap: () {
        Get.to(() => PetTrainersDetailsScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500),
            arguments: searchTrainerSingleItem.id);
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
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              children: [
                Container(
                  width: 75,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.grey),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.grey,
                    //       blurRadius: 1.5,
                    //       spreadRadius: 1.5
                    //   )
                    // ]
                    //color: Colors.grey,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(imgUrl,
                          errorBuilder: (context, er, ob) {
                        return Image.asset(AppImages.petMetLogoImg);
                      })),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchTrainerSingleItem.displayName,
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
                        searchTrainerSingleItem.address,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            searchTrainerSingleItem.isVerified == "1"
                ? Image.asset(
                    AppIcons.verifiedSymbolImg,
                    width: 3.5.h,
                    height: 3.5.h,
                  )
                : Container(),
          ],
        ).commonAllSidePadding(padding: 2.w),
      ).commonAllSidePadding(padding: 10),
    );
  }
}
