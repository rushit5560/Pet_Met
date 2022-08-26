import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/subscription_report_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';

import '../../utils/app_images.dart';

class SubscriptionOrderListModule extends StatelessWidget {
  SubscriptionOrderListModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubscriptionReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.subscriptionOrderList.isEmpty
        ? const Center(child: Text("Orders Not Found!"))
        : ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: screenController.subscriptionOrderList.length,
      itemBuilder: (context, i) {

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeProvider.darkTheme
                ? AppColors.darkThemeColor
                : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "Order Id",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(screenController.subscriptionOrderList[i].id),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "Price",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(screenController.subscriptionOrderList[i].price),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "Payment Id",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(
                        screenController.subscriptionOrderList[i].transitionPaymentId,
                    ),
                  ),
                ],
              ),
            ],
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(vertical: 7);
      },
    ).commonAllSidePadding(padding: 10);
  }
}
