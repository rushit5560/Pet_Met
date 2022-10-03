import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/get_payment_list_screen_controller.dart';
import 'package:pet_met/utils/common_widgets/background_widgets.dart';
import 'package:pet_met/screens/get_payment_list_screen/get_payment_list_screen_widget.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:pet_met/utils/enums.dart';



class GetPaymentListScreen extends StatelessWidget {
  GetPaymentListScreen({Key? key}) : super(key: key);

  final controller = Get.put(GetPaymentListScreenController());

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
                    title: "Payment",
                  ),
                  Expanded(
                    child: Obx(()=>
                    controller.isLoading.value
                        ? const CustomAnimationLoader():
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Expanded(child: PaymentListModule()),

                          // SizedBox(height: 2.5.h),
                        ],
                      ),
                    ),
                    ),
                  ),

                  const AddNewPaymentButtonModule(),

                  const NextButton(),
                ],
              )
            ],
          ),
        )
    );
  }
}
