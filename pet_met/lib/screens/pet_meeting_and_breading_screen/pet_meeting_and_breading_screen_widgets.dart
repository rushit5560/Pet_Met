import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/models/pet_meeting_and_breading_screen_models/category_and_sub_category_model.dart';
import 'package:pet_met/screens/pet_meeting_list_screen/pet_meeting_list_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class MeetingAndBreadingSearchFieldModule extends StatelessWidget {
  MeetingAndBreadingSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);
    return Stack(
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
          // validator: (val) => Validations().validateEmail(val!),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: AppColors.blackTextColor,
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
            /*suffixIcon: GestureDetector(
              onTap: () async {
                // screenController.searchFieldController.clear();
                // hideKeyboard();

                if(screenController.searchFieldController.text.trim().isEmpty){
                  screenController.isLoading(true);
                  screenController.searchSubCatList.clear();
                  screenController.isLoading(false);
                } else{
                  await screenController.getSearchCategoryAndSubCategoryFunction();
                  screenController.searchFieldController.clear();
                }
                hideKeyboard();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.accentTextColor),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ).commonAllSidePadding(padding: 5),
              ).commonAllSidePadding(padding: 8),
            ),*/
          ),
        ),
      ],
    );
  }
}

class PetCategoriesTextModule extends StatelessWidget {
  const PetCategoriesTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pet Categories",
      style: TextStyle(
          color: AppColors.accentTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp),
    );
  }
}

class PetCategoriesListModule extends StatelessWidget {
  PetCategoriesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();
  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.catAndSubCatList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        CatAndSubCatData singleItem = screenController.catAndSubCatList[i];
        return _petCategoryListTile(singleItem);
      },
    );
  }

  Widget _petCategoryListTile(CatAndSubCatData singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            themeProvider.darkTheme ? AppColors.darkThemeColor : Colors.white,
      ),
      child: ExpandablePanel(
        header: Text(
          singleItem.mainCategoryId.categoryName,
          style: TextStyle(
            fontSize: 13.sp,
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
          ),
        ).commonSymmetricPadding(horizontal: 12),
        theme: ExpandableThemeData(
            iconColor: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.greyTextColor,
            animationDuration: const Duration(milliseconds: 500),
            headerAlignment: ExpandablePanelHeaderAlignment.center),
        collapsed: Container(),
        expanded: /*screenController.searchList.isNotEmpty ?
        ListView.builder(
          itemCount: screenController.searchList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            String id = screenController.searchList[i].categoryId;
            return Row(
              children: [
                Checkbox(
                  checkColor: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.greyTextColor,
                  activeColor: AppColors.greyTextColor,
                  fillColor: MaterialStateProperty.all(
                    AppColors.greyColor,
                  ),
                  focusColor: AppColors.greyColor,
                  value: screenController.searchList[i].isSelected,
                  onChanged: (value) {
                    screenController.isLoading(true);
                    for (int i = 0;
                    i < screenController.catAndSubCatList.length;
                    i++) {
                      for (int j = 0; j < screenController.searchList.length; j++) {
                        if (screenController.searchList[j].categoryId == id) {
                          screenController.searchList[j].isSelected = true;
                          screenController.selectedSubCatId =
                              screenController.searchList[j].categoryId.toString();
                          // log("${singleItem.subCategory[j].categoryId}");
                          // log(singleItem.subCategory[j].categoryName);
                        } else {
                          screenController.searchList[j].isSelected = false;
                        }
                      }
                    }
                    screenController.isLoading(false);
                  },
                ),
                Text(
                  screenController.searchList[i].categoryName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                  ),
                ),
              ],
            );
          },
        ):*/
        ListView.builder(
          itemCount: singleItem.subCategory.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            String id = singleItem.subCategory[i].categoryId;
            return Row(
              children: [
                Checkbox(
                  checkColor: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.greyTextColor,
                  activeColor: AppColors.greyTextColor,
                  fillColor: MaterialStateProperty.all(
                    AppColors.greyColor,
                  ),
                  focusColor: AppColors.greyColor,
                  value: singleItem.subCategory[i].isSelected,
                  onChanged: (value) {
                    screenController.isLoading(true);
                    for (int i = 0;
                        i < screenController.catAndSubCatList.length;
                        i++) {
                      for (int j = 0; j < singleItem.subCategory.length; j++) {
                        if (singleItem.subCategory[j].categoryId == id) {
                          singleItem.subCategory[j].isSelected = true;
                          screenController.selectedSubCatId =
                              singleItem.subCategory[j].categoryId.toString();
                          // log("${singleItem.subCategory[j].categoryId}");
                          // log(singleItem.subCategory[j].categoryName);
                        } else {
                          singleItem.subCategory[j].isSelected = false;
                        }
                      }
                    }
                    screenController.isLoading(false);
                  },
                ),
                Text(
                  singleItem.subCategory[i].categoryName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                  ),
                ),
              ],
            );
          },
        ),
      ).commonSymmetricPadding(vertical: 5),
    ).commonSymmetricPadding(vertical: 5);
    /*return ExpansionTile(
      // backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,

      title: Text("Dog"),
      children: [],
    );*/
  }
}

class MeetYourLovedOneButtonModule extends StatelessWidget {
  MeetYourLovedOneButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        log("Selected Sub cat Id : ${screenController.selectedSubCatId}");
        //if(screenController.searchFieldController.text.isNotEmpty){
          await screenController.getSearchCategoryAndSubCategoryFunction().then((value) {
            screenController.searchFieldController.clear();
            Get.to(()=> PetMeetingListScreen(),
                transition: Transition.native,
                duration: const Duration(milliseconds: 500));
          });
       // }

      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          color: AppColors.accentTextColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "Meet Your Loved One",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
