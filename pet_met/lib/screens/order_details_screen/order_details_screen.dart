import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:pet_met/controllers/order_details_controller.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/enums.dart';
import 'order_details_screen_widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);

  final controller = Get.put(OrderDetailsController());
  final addressController = Get.put(AddressController());

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
                  title: "Order Details",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 2.h),

                              AddressModule(),
                              // const PaymentDetailsModule(),
                              SizedBox(height: 1.5.h),

                              const OrderDetailsModule(),
                            ],
                          ),
                          // const Spacer(),
                          SizedBox(height: 20.h),
                          OrderCountingModule(),
                          SizedBox(height: 2.h),
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
