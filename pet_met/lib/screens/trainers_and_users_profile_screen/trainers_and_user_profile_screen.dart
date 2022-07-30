import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/trainers_and_users_screen_controller.dart';
import 'package:pet_met/screens/trainers_and_users_profile_screen/trainers_and_user_profile_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';

class TrainersAndUserProfileScreenController extends StatelessWidget {
  TrainersAndUserProfileScreenController({Key? key}) : super(key: key);

  final controller = Get.put(TrainersAndUsersScreenController());
  String? fieldName;
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
                  child: Obx(()=>
                  controller.isLoading.value ?
                      const CustomAnimationLoader():
                     SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 25),
                              UploadImageModule(),
                              const SizedBox(height: 30),

                              TrainersAchievmentPictureListModule(),
                              //const SizedBox(height: 30),
                              //NgoBankNameModule(),
                              const SizedBox(height: 30),
                              //CommonTextFieldModule(fieldName: 'Trainers name'),
                              TrainersNameTextFieldModule(),

                              const SizedBox(height: 15),

                              // CommonTextFieldModule(
                              //   fieldName: "Trainers Contact",
                              //   //fieldHinttext: "**** ** ***",
                              // ),
                              TrainersContactNumberTextField(),
                              const SizedBox(height: 15),
                              // CommonTextFieldModule(
                              //   fieldName: "Trainers Address",
                              //   //fieldHinttext: "**** ** ***",
                              // ),
                              TrainersAddressTextFieldModule(),
                              const SizedBox(height: 15),
                              TrainersDetailsModule(),
                              // CommonTextFieldModule(
                              //   fieldName: "Trainers Details",
                              //   //fieldHinttext: "**** ** ***",
                              // ),
                              // const SizedBox(height: 15),
                              // OpenAndCloseShopTimeModule(),

                              const SizedBox(height: 30),

                              SubmitButtonModule(),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
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
