import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/cart_screen_controller.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/common_widgets/custom_appbar.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:sizer/sizer.dart';

class CartListViwModule extends StatelessWidget {
  CartListViwModule({Key? key}) : super(key: key);
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Herbal strateg Pet Shampoo is an excellent and ",
                                maxLines: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(width: ),
                                  Text(
                                    "₹ 200",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.accentColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        cartScreenController.counter != 0
                                            ? IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  cartScreenController
                                                      .isLoading(true);
                                                  cartScreenController
                                                      .counter.value--;
                                                  cartScreenController
                                                      .isLoading(false);
                                                },
                                              )
                                            : IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {},
                                              ),
                                        const SizedBox(width: 10),
                                        Obx(
                                          () => Text(
                                            "${cartScreenController.counter.value}",
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add,
                                            color: AppColors.accentColor,
                                          ),
                                          onPressed: () {
                                            cartScreenController
                                                .isLoading(true);
                                            cartScreenController.counter.value++;
                                            cartScreenController
                                                .isLoading(false);
                                          },
                                        )
                                      ],
                                    ).commonSymmetricPadding(horizontal: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h),
                      ],
                    )
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("CheckOut"),
              ),
            ),
          ],
        ).commonSymmetricPadding(vertical: 10, horizontal: 20)
      ],
    );
  }
}
