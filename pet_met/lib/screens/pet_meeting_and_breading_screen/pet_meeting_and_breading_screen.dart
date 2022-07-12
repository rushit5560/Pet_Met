import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';
import 'pet_meeting_and_breading_screen_widgets.dart';

class PetMeetingAndBreadingScreen extends StatelessWidget {
  PetMeetingAndBreadingScreen({Key? key}) : super(key: key);
  final petMeetingAndBreadingScreenController =
      Get.put(PetMeetingAndBreadingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AppImages.tealBackgroundImg),
          ),
          BackGroundLeftShadow(
            height: petMeetingAndBreadingScreenController.size.height * 0.3,
            width: petMeetingAndBreadingScreenController.size.height * 0.3,
            topPad: petMeetingAndBreadingScreenController.size.height * 0.28,
            leftPad: -petMeetingAndBreadingScreenController.size.width * 0.15,
          ),
          Column(
            children: [
              const CustomAppBar(title: "Pet Meeting & Breading"),

              // Body Part
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MeetingAndBreadingSearchFieldModule(),
                    SizedBox(
                        height:
                            petMeetingAndBreadingScreenController.size.height *
                                0.002.h),
                    const PetCategoriesTextModule(),
                    SizedBox(
                        height:
                            petMeetingAndBreadingScreenController.size.height *
                                0.002.h),
                    Expanded(child: PetCategoriesListModule()),
                    SizedBox(
                        height:
                            petMeetingAndBreadingScreenController.size.height *
                                0.002.h),
                    MeetYourLovedOneButtonModule(),
                  ],
                ).commonAllSidePadding(padding: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
