import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AlertDialogModule {

  DarkThemeProvider themeProvider =
  Provider.of<DarkThemeProvider>(Get.context!);

  alertDialogBox({required Function() yesClick}) {
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor.withOpacity(0.3)
          : AppColors.accentColor.withOpacity(0.3),
      context: Get.context!,
      builder: (ctx) => Dialog(
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkThemeBoxColor
            : AppColors.whiteColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                    Text(
                      "Are you sure you want delete account ?",
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                const SizedBox(height: 8),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: yesClick,
                      child: Container(
                        // height: 35,
                        width: Get.size.width * 0.30,
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.size.width * 0.05),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        // height: 35,
                        width: Get.size.width * 0.30,
                        decoration: const BoxDecoration(
                          color: AppColors.greyTextColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                          child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () async {
                    //     //await screenController.userLoginFunction();
                    //     if (screenController.formKey.currentState!.validate()) {
                    //       screenController.openCheckout(price: int.parse(screenController.priceController.text));
                    //       log('price: ${screenController.priceController.text}');
                    //       Fluttertoast.showToast(msg: 'Processing payment to trainer.');
                    //       screenController.priceController.clear();
                    //     }
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     primary: AppColors.accentColor,
                    //     minimumSize: Size(
                    //       screenController.size.width * 0.3,
                    //       30,
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Ok",
                    //       style: TextStyle(
                    //         color: AppColors.whiteColor,
                    //         fontSize: 12.sp,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: screenController.size.width * 0.05,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.back();
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     primary: themeProvider.darkTheme
                    //         ? AppColors.whiteColor
                    //         : AppColors.greyTextColor.withOpacity(0.3),
                    //     minimumSize:
                    //     Size(screenController.size.width * 0.3, 30),
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Close",
                    //       style: TextStyle(
                    //         color: themeProvider.darkTheme
                    //             ? AppColors.darkThemeBoxColor
                    //             : AppColors.blackTextColor,
                    //         fontSize: 12.sp,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),

        ),
      ),
    );
  }
}