import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/add_address_controller.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:pet_met/screens/add_address_screen/add_address_screen_widgets.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';
import '../../utils/validations.dart';

class AddAddressScreen extends StatelessWidget {
  final controller = Get.put(AddAddressController());

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

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
            BackgroundCurve(),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Add New Address",
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Image.asset(
                //           "assets/icons/left_back_arrow.png",
                //           width: controller.size.width * 0.07,
                //         ),
                //       ),
                //       const SizedBox(),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Container(
                        height: 75.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 8),
                            // Text(
                            //   "Add New Address",
                            //   style: TextStyle(
                            //     color: AppColors.accentTextColor,
                            //     fontSize: 20.sp,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: 4.h),
                            // const SizedBox(height: 15),
                            TextFieldSection(
                              fieldName: "Select Address",
                              fieldHinttext: "Address line 1",
                            ),
                            SizedBox(height: 2.h),
                            TextFieldSection(
                              fieldName: "Detail Address",
                              fieldHinttext: "Address line 2",
                            ),
                            SizedBox(height: 2.h),
                            AddAddressByLocation(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SaveButton(),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
