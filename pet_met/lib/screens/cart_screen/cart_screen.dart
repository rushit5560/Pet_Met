import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/cart_screen_controller.dart';
import '../get_payment_list_screen/get_payment_list_screen_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                themeProvider.darkTheme
                    ? AppImages.backgroundImgDark
                    : AppImages.backgroundImgLight,
              ),
            ),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Cart",
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Shampoo",
                                  style: TextStyle(
                                    color: AppColors.accentTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvmeGEMXf7lyS2L2sPk-W03mpY8AWwl6lnsg&usqp=CAU"))),
                                  // padding: EdgeInsets.only(top: 20, bottom: 20),
                                ),
                                SizedBox(width: 4.w),
                                const Expanded(
                                  child: Text(
                                    "Herbal strateg Pet Shampoo is an excellent and ",
                                    maxLines: 2,
                                  ),
                                ),


                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "₹ 200",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.accentColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
                                          Icons.remove,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "1",
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.add,
                                          // size: 15.sp,
                                          color: AppColors.accentColor,
                                        ),
                                      ],
                                    ).commonSymmetricPadding(horizontal: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).commonAllSidePadding(padding: 10),
                      ).commonAllSidePadding(padding: 10);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ 2000",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("CheckOut"),
                      ),
                    ),
                  ],
                ).commonSymmetricPadding(vertical: 10, horizontal: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
