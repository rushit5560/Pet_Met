import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/screens/shop_user_profile_screen/shop_user_profile_screen_widgets.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

class ShopUserProfileScreen extends StatelessWidget {
  ShopUserProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ShopUserProfileScreenController());

  String ? fieldName;
  String? fieldHinttext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(),
            Column(
              children: [
                BackArrow(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          UploadImageModule(),
                          const SizedBox(height: 30),

                          AddShopOffersListModule(),
                          const SizedBox(height: 30),
                          MeetingAvailabilityModule(),
                          const SizedBox(height: 30),
                          CommonTextFieldModule(fieldName: 'Shop Name'),

                          const SizedBox(height: 15),

                          CommonTextFieldModule(
                            fieldName: "Contact Number",
                            //fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldModule(
                            fieldName: "Address",
                            //fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),

                          OpenAndCloseShopTimeModule(),

                          const SizedBox(height: 30),

                          const SubmitButtonModule(),
                          const SizedBox(height: 15),
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

