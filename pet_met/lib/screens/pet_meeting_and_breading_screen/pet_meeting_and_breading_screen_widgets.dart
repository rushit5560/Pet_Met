import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
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
