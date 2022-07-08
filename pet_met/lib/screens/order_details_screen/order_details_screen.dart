import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:pet_met/controllers/order_details_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';

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
                            "Order Details",
                            style: TextStyle(
                              color: AppColors.accentTextColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 45),
                          // const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.7),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Container(
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      addressController.addressList[0].title!,
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      addressController.addressList[0].address!,
                                      style: TextStyle(
                                        color: AppColors.greyTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Payment",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.7),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Container(
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
                                  color:
                                      AppColors.greyTextColor.withOpacity(0.25),
                                  blurRadius: 35,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/visa_image.png",
                                  // height: 8.w,
                                  width: 12.w,
                                ),
                                SizedBox(width: 6.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mobile Banking **** **3579",
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      "Anamwp",
                                      style: TextStyle(
                                        color: AppColors.greyTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Your Order",
                                style: TextStyle(
                                  color:
                                      AppColors.blackTextColor.withOpacity(0.7),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            // height: 50,
                            margin: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/image_placeholder2.png",
                                  // height: 8.w,
                                  width: 15.w,
                                ),
                                SizedBox(width: 6.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mobile Banking **** **3579",
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
                                      children: [
                                        Container(
                                          height: 28,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: AppColors.greyTextColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Male",
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Container(
                                          height: 30,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: AppColors.greyTextColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "1 Years",
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      "150 \$",
                                      style: TextStyle(
                                        color: AppColors.blackTextColor
                                            .withOpacity(0.6),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
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
