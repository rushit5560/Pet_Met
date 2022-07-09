import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_functions/hide_keyboard.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';


class MeetingAndBreadingSearchFieldModule extends StatelessWidget {
  MeetingAndBreadingSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();

  @override
  Widget build(BuildContext context) {
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
            fillColor: AppColors.whiteColor,
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
              color: AppColors.greyTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                screenController.searchFieldController.clear();
                hideKeyboard();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentTextColor
                ),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ).commonAllSidePadding(padding: 5),
              ).commonAllSidePadding(padding: 5),
            ),
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
          fontSize: 12.sp
      ),
    );
  }
}

class PetCategoriesListModule extends StatelessWidget {
  PetCategoriesListModule({Key? key}) : super(key: key);
  final screenController = Get.find<PetMeetingAndBreadingScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _petCategoryListTile();
      },
    );
  }


  Widget _petCategoryListTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ExpandablePanel(
        header: Text(
            "Dog",
          style: TextStyle(
            fontSize: 13.sp
          ),
        ).commonSymmetricPadding(horizontal: 10),
        theme: const ExpandableThemeData(
          animationDuration: Duration(milliseconds: 500),
          headerAlignment: ExpandablePanelHeaderAlignment.center
        ),
        collapsed: Container(),
        expanded: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Obx(
                  ()=> Checkbox(
                      value: screenController.checkBoxValue.value,
                      onChanged: (value) {
                        screenController.checkBoxValue.value
                        = !screenController.checkBoxValue.value;
                      }),
                ),
                const Text(
                  "German Shepherd dog",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
  const MeetYourLovedOneButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNames.petMeetingListScreenRoute);
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



