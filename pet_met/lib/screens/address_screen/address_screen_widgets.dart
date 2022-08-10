import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:pet_met/screens/add_address_screen/add_address_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
          themeProvider.darkTheme ?
          AppImages.backgroundImgDark : AppImages.backgroundImgLight
      ),
    );
  }
}

class AddressListModule extends StatelessWidget {
  AddressListModule({Key? key}) : super(key: key);

  final controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 12.h * controller.getAllAddressList.length,
      //width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.getAllAddressList.length,
        itemBuilder: (context, index) {
          return AddressTileWidget(
            controller: controller,
            index: index,
          );
        },
      ),
    );
  }


}

class AddressTileWidget extends StatelessWidget {
  const AddressTileWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final AddressController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(add)
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyTextColor.withOpacity(0.25),
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
                  controller.getAllAddressList[index].address,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.addressList[index].address!,
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            // Obx(
            //   () =>
            Container(
              height: 40,
              width: 40,
              child: Checkbox(
                checkColor: AppColors.whiteColor,
                activeColor: AppColors.blackColor,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected))
                      return AppColors.greyColor;
                    return AppColors.greyTextColor; // Use the default value.
                  },
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                value: controller.getAllAddressList[index].isActive,
                onChanged: (val) {
                  controller.addressIsActiveFunction(index).whenComplete(() {
                    controller.getAllAddressFunction();
                  });
                  // controller.slectedAddress.value =
                  //     !controller.slectedAddress.value;
                },
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}

class AddNewAddressButtonModule extends StatelessWidget {
  const AddNewAddressButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AddAddressScreen(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyTextColor.withOpacity(0.25),
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
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentColor.withOpacity(0.25),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GestureDetector(
        onTap: () {
          // controller.submitLoginForm();
          //Get.toNamed(AppRouteNames.paymentListRoute);
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
