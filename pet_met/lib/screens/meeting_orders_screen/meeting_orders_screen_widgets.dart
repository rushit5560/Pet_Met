import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/meeting_orders_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import '../../utils/app_images.dart';

class MeetingOrderListModule extends StatelessWidget {
  MeetingOrderListModule({Key? key}) : super(key: key);
  final screenController = Get.find<MeetingOrdersScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.meetingOrderList.isEmpty
        ? const Center(child: Text("Orders Not Found!"))
        : ListView.builder(
            itemCount: screenController.meetingOrderList.length,
            itemBuilder: (context, i) {
              String sDate =
                  "${screenController.meetingOrderList[i].startdate.day}-"
                  "${screenController.meetingOrderList[i].startdate.month}-"
                  "${screenController.meetingOrderList[i].startdate.year}";
              String eDate =
                  "${screenController.meetingOrderList[i].enddate.day}-"
                  "${screenController.meetingOrderList[i].enddate.month}-"
                  "${screenController.meetingOrderList[i].enddate.year}";

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
                            "Start Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 75,
                          child: Text(sDate),
                        ),
                      ],
                    ),
                    Row(
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
                              "${screenController.meetingOrderList[i].price}"),
                        ),
                      ],
                    ),
                  ],
                ).commonAllSidePadding(padding: 8),
              );
            },
          ).commonAllSidePadding(padding: 10);
  }
}
