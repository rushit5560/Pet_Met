import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';

class AddressScreen extends StatelessWidget {
  final controller = Get.put(AddressController());

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
                            "Addresses",
                            style: TextStyle(
                              color: AppColors.accentTextColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 45),
                          Container(
                            height: controller.size.height / 4,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: controller.addressList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: 50,
                                  margin: EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.greyTextColor
                                            .withOpacity(0.25),
                                        blurRadius: 35,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .addressList[index].title!,
                                            style: TextStyle(
                                              color: AppColors.blackTextColor,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            controller
                                                .addressList[index].address!,
                                            style: TextStyle(
                                              color: AppColors.greyTextColor,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: Checkbox(
                                          checkColor: AppColors.blackTextColor,
                                          activeColor: AppColors.blackColor,
                                          fillColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected))
                                                return AppColors.whiteColor;
                                              return AppColors
                                                  .greyTextColor; // Use the default value.
                                            },
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          value:
                                              controller.slectedAddress.value,
                                          onChanged: (val) {
                                            controller.slectedAddress.value =
                                                !controller
                                                    .slectedAddress.value;
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.greyTextColor.withOpacity(0.25),
                                  blurRadius: 35,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add New Address",
                                  style: TextStyle(
                                    color: AppColors.blackTextColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: AppColors.accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.accentColor
                                            .withOpacity(0.25),
                                        blurRadius: 35,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
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
