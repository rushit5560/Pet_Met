import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pet_meeting_and_breading_screen_controller.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'pet_meeting_and_breading_screen_widgets.dart';


class PetMeetingAndBreadingScreen extends StatelessWidget {
  PetMeetingAndBreadingScreen({Key? key}) : super(key: key);
  final petMeetingAndBreadingScreenController
  = Get.put(PetMeetingAndBreadingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AppImages.tealBackgroundImg),
          ),

          Column(
            children: [
              const CustomAppBar(title: "Pet Meeting & Breading"),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MeetingAndBreadingSearchFieldModule(),

                    ],
                  ).commonAllSidePadding(padding: 20),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
