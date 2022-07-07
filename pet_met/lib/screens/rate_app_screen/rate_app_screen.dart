import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/rate_app_controller.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/validations.dart';

class RateAppScreen extends StatelessWidget {
  RateAppScreen({Key? key}) : super(key: key);

  final controller = Get.put(RateAppController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGroundLeftShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.25,
              leftPad: -controller.size.width * 0.25,
            ),
            BackGroundRightShadow(
              height: controller.size.height * 0.3,
              width: controller.size.height * 0.3,
              topPad: controller.size.height * 0.45,
              rightPad: -controller.size.width * 0.25,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/logintopright.png"),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/icons/left_back_arrow.png",
                          width: controller.size.width * 0.07,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            "Rate your App",
                            style: TextStyle(
                              color: AppColors.accentTextColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 45),
                          Container(
                            height: controller.size.height * 0.4,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    switch (index) {
                                      case 0:
                                        return Icon(
                                          Icons.sentiment_very_dissatisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 1:
                                        return Icon(
                                          Icons.sentiment_dissatisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 2:
                                        return Icon(
                                          Icons.sentiment_neutral,
                                          color: AppColors.accentColor,
                                        );
                                      case 3:
                                        return Icon(
                                          Icons.sentiment_satisfied,
                                          color: AppColors.accentColor,
                                        );
                                      case 4:
                                        return Icon(
                                          Icons.sentiment_very_satisfied,
                                          color: AppColors.accentColor,
                                        );
                                    }
                                    return SizedBox();
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1"),
                                    SizedBox(width: 30),
                                    Text("2"),
                                    SizedBox(width: 30),
                                    Text("3"),
                                    SizedBox(width: 30),
                                    Text("4"),
                                    SizedBox(width: 30),
                                    Text("5"),
                                  ],
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    ),
                                    hintText:
                                        "Leave Your Feedback Here (Optional)",
                                    hintStyle: TextStyle(
                                      color: AppColors.greyTextColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: AppColors.blackTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Your feedback is private and will not be shared with your client",
                                  style: TextStyle(
                                    color: AppColors.greyTextColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                  height: 35,
                                  width: controller.size.width * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.accentColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
