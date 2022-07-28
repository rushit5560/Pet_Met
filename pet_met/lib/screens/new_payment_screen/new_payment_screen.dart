import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/add_new_payment_screen_controller.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/screens/new_payment_screen/new_payment_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:sizer/sizer.dart';

class NewPaymentScreen extends StatelessWidget {
  NewPaymentScreen({Key? key}) : super(key: key);

  final controller = Get.put(AddNewPaymentScreenController());

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
              const BackgroundCurve(),
              Column(
                children: [
                  CustomAppBar(
                    appBarOption: AppBarOption.singleBackButtonOption,
                    title: "New Payment",
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CardNumberTextField(),
                              SizedBox(height: 2.h),
                              NameOnCardTextField(),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Expanded(child: ExpiryDateTextField()),
                                  SizedBox(width: 10),
                                  Expanded(child: CvvTextField())
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SaveButton(),
                  SizedBox(height: 1.h),

                ],
              )
            ],
          ),
        ));
  }
}
