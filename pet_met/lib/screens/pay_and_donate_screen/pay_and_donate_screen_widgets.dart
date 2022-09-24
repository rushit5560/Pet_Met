import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/pay_and_donate_screen_controller.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:provider/provider.dart';

class PayAndDonateOrderListModule extends StatelessWidget {
  PayAndDonateOrderListModule({Key? key}) : super(key: key);


  final screenController = Get.find<PayAndDonateReportScreenController>();

  DarkThemeProvider themeProvider =
  Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return screenController.payAndDonateList.isEmpty
        ? const Center(child: Text("Pay/Donate Record Not Found!"))
        : ListView.builder(
      itemCount: screenController.payAndDonateList.length,
      itemBuilder: (context, i) {
        /*String sDate =
            "${screenController.payAndDonateList[i].startdate.day}-"
            "${screenController.payAndDonateList[i].startdate.month}-"
            "${screenController.payAndDonateList[i].startdate.year}";
        String eDate =
            "${screenController.payAndDonateList[i].enddate.day}-"
            "${screenController.payAndDonateList[i].enddate.month}-"
            "${screenController.payAndDonateList[i].enddate.year}";*/

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
              /*Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "Start Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(sDate),
                  ),
                ],
              ),*/
              /*Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "End Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(eDate),
                  ),
                ],
              ),*/


              Row(
                children: [
                  const Expanded(
                    flex: 25,
                    child: Text(
                      "Pay To",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child: Text(
                        screenController.payAndDonateList[i].name),
                  ),
                ],
              ),

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
                    child: Text(
                        screenController.payAndDonateList[i].price),
                  ),
                ],
              ),

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
                        screenController.payAndDonateList[i].transitionPaymentId),
                  ),
                ],
              ),


            ],
          ).commonAllSidePadding(padding: 8),
        ).commonSymmetricPadding(vertical: 8);
      },
    ).commonAllSidePadding(padding: 10);
  }
}
