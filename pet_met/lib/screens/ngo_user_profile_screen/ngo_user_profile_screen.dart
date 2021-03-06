import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/ngo_user_profile_screen_controller.dart';
import 'package:pet_met/screens/ngo_user_profile_screen/ngo_user_profile_screen_widgets.dart';

class NgoUserProfileScreen extends StatelessWidget {
  NgoUserProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(NgoUserProfileScreenController());
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

                          NameOfNgoListModule(),
                          const SizedBox(height: 30),
                          NgoBankNameModule(),
                          const SizedBox(height: 30),
                          CommonTextFieldModule(fieldName: 'Ngo Bank Account Number'),

                          const SizedBox(height: 15),

                          CommonTextFieldModule(
                            fieldName: "IFSC Code",
                            //fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldModule(
                            fieldName: "Ngo Address",
                            //fieldHinttext: "**** ** ***",
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldModule(
                            fieldName: "Ngo Contact",
                            //fieldHinttext: "**** ** ***",
                          ),
                          // const SizedBox(height: 15),
                          // OpenAndCloseShopTimeModule(),

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
