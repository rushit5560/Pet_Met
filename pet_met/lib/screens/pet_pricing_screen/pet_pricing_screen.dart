import 'package:flutter/material.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';

class PetPricingScreen extends StatelessWidget {
  const PetPricingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.tealBackgroundImg),
            ),

            // BackGroundLeftShadow(
            //   height: petMeetingListScreenController.size.height * 0.3,
            //   width: petMeetingListScreenController.size.height * 0.3,
            //   topPad: petMeetingListScreenController.size.height * 0.28,
            //   leftPad: -petMeetingListScreenController.size.width * 0.15,
            // ),
          ],
        ),
      ),
    );
  }
}
