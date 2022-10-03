import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/address_controller.dart';
import 'package:pet_met/screens/address_screen/address_screen_widgets.dart';
import 'package:pet_met/utils/common_widgets/loader.dart';
import 'package:provider/provider.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/common_widgets/background_widgets.dart';
import '../../utils/common_widgets/custom_appbar.dart';
import '../../utils/enums.dart';



class AddressScreen extends StatelessWidget {
  final controller = Get.put(AddressController());

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
            const BackgroundCurve(),
            Column(
              children: [
                CustomAppBar(
                  appBarOption: AppBarOption.singleBackButtonOption,
                  title: "Address",
                ),
                Expanded(
                  child: Obx(()=>
                    controller.isLoading.value
                      ? const CustomAnimationLoader():
                     Padding(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 25),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           // const SizedBox(height: 8),
                           // Text(
                           //   "Addresses",
                           //   style: TextStyle(
                           //     color: AppColors.accentTextColor,
                           //     fontSize: 20.sp,
                           //     fontWeight: FontWeight.bold,
                           //   ),
                           // ),
                           // Spacer(),
                           const SizedBox(height: 20),
                           Expanded(child: AddressListModule()),

                           // SizedBox(height: 2.5.h),
                         ],
                       ),
                     ),
                  ),
                ),
                const AddNewAddressButtonModule(),

                //const Spacer(),
                const NextButton(),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                //   child: GestureDetector(
                //     onTap: () {
                //       // controller.submitLoginForm();
                //     },
                //     child: Container(
                //       width: double.infinity,
                //       height: 60,
                //       decoration: const BoxDecoration(
                //         color: AppColors.accentColor,
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(12),
                //         ),
                //       ),
                //       child: Center(
                //         child: Text(
                //           "Next",
                //           style: TextStyle(
                //             color: AppColors.whiteColor,
                //             fontSize: 15.sp,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
