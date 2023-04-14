import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/controllers/shop_details_screen_controller.dart';
import 'package:pet_met/screens/address_screen/address_screen_widgets.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/extension_methods/extension_methods.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../firebase_database/firebase_database.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../../utils/user_details.dart';
import '../user_conversation_screen/user_conversation_screen.dart';

class BannerImageModule extends StatelessWidget {
  BannerImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenController.size.width,
      height: screenController.size.height * 0.030.h,
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: NetworkImage(ApiUrl.apiImagePath + screenController.shopDetails.showimg),
      //   fit: BoxFit.cover,
      // ),
      // borderRadius: BorderRadius.circular(15),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          ApiUrl.apiImagePath + "${screenController.shopData[0].showimg}",
          // fit: BoxFit.fill,
          errorBuilder: (context, er, ob) {
            return Image.asset(AppImages.petMetLogoImg);
          },
        ),
      ),
      // fit: BoxFit.cover,),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class OffersModule extends StatelessWidget {
  OffersModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                "Offers & Discounts :",
                style: TextStyle(
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // screenController.isVerified == true
            //     ? /*Container(
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: AppColors.accentTextColor,
            //   ),
            //   child: const Icon(
            //     Icons.check_rounded,
            //     color: Colors.white,
            //     size: 18,
            //   ),
            // )*/
            //     Image.asset(
            //         AppIcons.verifiedSymbolImg,
            //         width: 25,
            //         height: 25,
            //       )
            //     : Container(),
          ],
        ),
        // SizedBox(height: 10),
        const SizedBox(height: 20),
        /*screenController.productList.isEmpty
            ? Text(
                "No Product available!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor.withOpacity(0.4)
                      : AppColors.blackTextColor,
                ),
              )
            : */GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      // imageAlertDialog(context, index = 1);
                      bottomSheetModule();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                            ApiUrl.apiImagePath +
                                "asset/uploads/product/"
                                    "${screenController.shopData[0].image1}",
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40, errorBuilder: (context, er, da) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(AppImages.petMetLogoImg),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
        /*Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // imageAlertDialog(context, index = 1);
                      bottomSheetModule();
                    },
                    child: SizedBox(
                      height: screenController.size.width * 0.18,
                      //width: screenController.size.width * 0.18,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                              ApiUrl.apiImagePath +
                                  "asset/uploads/product/"
                                      "${screenController.shopData[0].image1}",
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                              errorBuilder: (context, er, da) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppImages.petMetLogoImg),
                            );
                          }),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      imageAlertDialog(context, index = 2);
                    },
                    child: SizedBox(
                      height: screenController.size.width * 0.18,
                      //width: screenController.size.width * 0.18,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                              ApiUrl.apiImagePath +
                                  "asset/uploads/product/"
                                      "${screenController.shopData[0].image2}",
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40, errorBuilder: (context, er, da) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppImages.petMetLogoImg),
                            );
                          }),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      imageAlertDialog(context, index = 3);
                    },
                    child: SizedBox(
                      height: screenController.size.width * 0.18,
                      //width: screenController.size.width * 0.18,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                              ApiUrl.apiImagePath +
                                  "asset/uploads/product/"
                                      "${screenController.shopData[0].image3}",
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40, errorBuilder: (context, er, da) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppImages.petMetLogoImg),
                            );
                          }),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      imageAlertDialog(context, index = 4);
                    },
                    child: SizedBox(
                      height: screenController.size.width * 0.18,
                      //width: screenController.size.width * 0.18,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                              ApiUrl.apiImagePath +
                                  "asset/uploads/product/"
                                      "${screenController.shopData[0].image4}",
                              fit: BoxFit.cover,
                              errorBuilder: (context, er, da) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppImages.petMetLogoImg),
                            );
                          }),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      imageAlertDialog(context, index = 5);
                    },
                    child: SizedBox(
                      height: screenController.size.width * 0.18,
                      //width: screenController.size.width * 0.18,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                              ApiUrl.apiImagePath +
                                  "asset/uploads/product/"
                                      "${screenController.shopData[0].image5}",
                              fit: BoxFit.cover,
                              errorBuilder: (context, er, da) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppImages.petMetLogoImg),
                            );
                          }),
                        ),
                      ),
                    ),
                  ))
                ],
              ),*/
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  /*Widget _offerListTile(int i, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // imageAlertDialog(context, i);
      },
      child: SizedBox(
        height: screenController.size.width * 0.18,
        width: screenController.size.width * 0.18,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: */ /*Image.network(
              ApiUrl.apiImagePath + screenController.shopData.offersimages![i],
              fit: BoxFit.cover, errorBuilder: (context, er, da) {
            return Image.asset(AppImages.petMetLogoImg);
          }),*/ /*
                Image.asset(AppImages.petMetLogoImg)),
      ).commonSymmetricPadding(horizontal: 5),
    );
  }*/

  //todo
  // Open Bottom Sheet
  bottomSheetModule() {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: true,
      // enableDrag: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
            child: Container(
              // height: Get.height * 0.70,
              decoration: BoxDecoration(
                color: themeProvider.darkTheme
                    ? AppColors.blackTextColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ApiUrl.apiImagePath +
                            "asset/uploads/product/" +
                            screenController.shopData[0].image1!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Product Name',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.4)
                            : AppColors.blackTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Product Description Product Description Product Description Product Description Product Description'
                      'Product Description Product Description Product Description Product Description Product Description'
                      'Product Description Product Description Product Description Product Description Product Description',
                      textAlign: TextAlign.start,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.4)
                            : AppColors.blackTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        text: "Price : ",
                        style: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor.withOpacity(0.4)
                              : AppColors.blackTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                        children: [
                          TextSpan(
                            text: "₹ 699/-",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: "MRP",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor.withOpacity(0.4)
                                  : AppColors.blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const TextSpan(text: " : "),
                          TextSpan(
                            text: "₹ 999/-",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor.withOpacity(0.4)
                                  : AppColors.blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    PayButtonModule(),
                    const SizedBox(height: 5),
                  ],
                ).commonAllSidePadding(padding: 5),
              ),
            ),
          ),
        );
      },
    );
  }

  imageAlertDialog(BuildContext context, index) {
    // Widget cancelButton = TextButton(
    //   child: Text("No, cancel"),
    //   onPressed: () {
    //     Get.back();
    //   },
    // );
    // Widget continueButton = TextButton(
    //   child: Text("Yes, delete it"),
    //   onPressed: () async {
    //     Get.back();
    //   },
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: index == 1
          ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.shopData[0].image1!,
              fit: BoxFit.cover, errorBuilder: (context, er, da) {
              return Image.asset(AppImages.petMetLogoImg);
            })
          : index == 2
              ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.shopData[0].image2!,
                  fit: BoxFit.cover, errorBuilder: (context, er, da) {
                  return Image.asset(AppImages.petMetLogoImg);
                })
              : index == 3
                  ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.shopData[0].image3!,
                      fit: BoxFit.cover, errorBuilder: (context, er, da) {
                      return Image.asset(AppImages.petMetLogoImg);
                    })
                  : index == 4
                      ? Image.network(ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.shopData[0].image4!,
                          fit: BoxFit.cover, errorBuilder: (context, er, da) {
                          return Image.asset(AppImages.petMetLogoImg);
                        })
                      : index == 5
                          ? Image.network(
                              ApiUrl.apiImagePath + "asset/uploads/product/" + screenController.shopData[0].image4!,
                              fit: BoxFit.cover, errorBuilder: (context, er, da) {
                              return Image.asset(AppImages.petMetLogoImg);
                            })
                          : Image.asset(AppImages.petMetLogoImg),
      //Image.asset(AppImages.petMetLogoImg)
      // content: Text(
      //     "If you change timing slot duration your all schedule slot should been deleted you won't be able to recover this again!"),
      // actions: [
      //   continueButton,
      //   cancelButton,
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class PayButtonModule extends StatelessWidget {
  PayButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopDetailsScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () async {
          // screenController.openCheckout();
          // Fluttertoast.showToast(msg: 'Processing payment to trainer.');
          if (screenController.shopName == UserDetails.userName) {
            Fluttertoast.showToast(msg: "Shop can't pay to itself.");
          } else {
            // alertDialogBox(context);
          }
        },
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Add To Cart",
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

  alertDialogBox(BuildContext context) {
    return showDialog(
      barrierColor: themeProvider.darkTheme
          ? AppColors.darkThemeBoxColor.withOpacity(0.3)
          : AppColors.accentColor.withOpacity(0.3),
      context: context,
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
          height: screenController.size.height * 0.3,
          width: screenController.size.width * 0.8,
          child: Form(
            key: screenController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Text(
                  "Shop Charge",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),*/

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please Enter Amount",
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // CustomLightTextField(
                //   readOnly: false,
                //   fieldController: controller.passwordController,
                //   height: Get.height * 0.05,
                //   width: double.infinity,
                //   hintText: "Password",
                //   textInputAction: TextInputAction.next,
                //   textInputType: TextInputType.text,
                //   validator: (val) => Validations().validateName(val!),
                // ),

                Stack(
                  children: [
                    Container(
                      height: screenController.size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor.withOpacity(0.05)
                                : AppColors.greyTextColor.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: screenController.priceController,
                      validator: (val) => Validations().validatePrice(val!),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      cursorColor: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.accentTextColor,
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        fillColor: themeProvider.darkTheme
                            ? AppColors.darkThemeBoxColor
                            : AppColors.whiteColor,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                        hintText: "Amount",
                        hintStyle: TextStyle(
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.greyTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //await screenController.userLoginFunction();
                        if (screenController.formKey.currentState!.validate()) {
                          Get.back();
                          screenController.openCheckout(
                              price: int.parse(
                                  screenController.priceController.text));
                        }
                      },
                      child: Container(
                        //width: double.infinity,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              "Submit",
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
                    SizedBox(
                      width: screenController.size.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        //width: double.infinity,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.greyTextColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              "Cancel",
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
      ),
    );
  }
}

class ShopNameAndSocialMediaButtonModule extends StatelessWidget {
  ShopNameAndSocialMediaButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "${screenController.shopData[0].shopename}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.accentTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: screenController.isVerified == true
                    ? Image.asset(
                        AppIcons.verifiedSymbolImg,
                        width: 25,
                        height: 25,
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     String url = "${screenController.shopData[0].instagram}";
        //     _makingInstagramApp(url);
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.instaImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     var fbUrl = "${screenController.shopData[0].facebook}";
        //     launchFacebook(fbUrl, fbUrl);
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.fbImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     String number = "${screenController.shopData[0].phonenumber}";
        //     launchWhatsApp(context, number);
        //   },
        //   child: Container(
        //     height: screenController.size.width * 0.018.w,
        //     width: screenController.size.width * 0.018.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: AppColors.accentColor,
        //     ),
        //     child: Image.asset(
        //       AppImages.whatsappImg,
        //     ).commonAllSidePadding(padding: 8),
        //   ).commonSymmetricPadding(horizontal: 2),
        // ),
        GestureDetector(
          onTap: () {
            String number = "${screenController.shopData[0].phonenumber}";
            _makingPhoneCall(number);
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppImages.phoneCallImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
        GestureDetector(
          onTap: () async {
            final FirebaseDatabase firebaseDatabase = FirebaseDatabase();

            if (UserDetails.userEmail == screenController.shopEmail) {
              Fluttertoast.showToast(msg: "User can't chat with itself.");
            } else {
              List<String> tempChatRoomIdList = [];

              screenController.shopCatId = "2";

              // CharRoom Id Generate
              String chatRoomId =
                  "${UserDetails.selfId}${UserDetails.categoryId}_${screenController.shopId}${screenController.shopCatId}";
              String chatRoomId2 =
                  "${screenController.shopId}${screenController.shopCatId}_${UserDetails.selfId}${UserDetails.categoryId}";

              // Get All Chat Room From Firebase
              QuerySnapshot querySnapshot =
                  await FirebaseFirestore.instance.collection("ChatRoom").get();

              querySnapshot.docs.map((doc) {
                doc.data();

                if (doc['chatRoomId'].toString().contains(chatRoomId)) {
                  log("first if stat");
                  tempChatRoomIdList.add(doc['chatRoomId']);
                }
                if (doc['chatRoomId'].toString().contains(chatRoomId2)) {
                  log("second if stat");
                  tempChatRoomIdList.add(doc['chatRoomId']);
                }
              }).toList();

              log("tempChatRoomId : $tempChatRoomIdList");

              if (tempChatRoomIdList.isEmpty) {
                /// Create chat room
                Timestamp timeStamp = Timestamp.now();
                // CharRoom Id Generate
                // String charRoomId =
                //     "${UserDetails.selfId}${UserDetails.categoryId}_${controller.chatUid}${controller.chatCategoryId}";

                log("ooppo Userid : ${screenController.shopId}");
                log("oppo user CategoryId : ${screenController.shopCatId}");
                log("charRoomId123 : $chatRoomId");

                // ChatRoom Data
                Map<String, dynamic> chatRoomData = {
                  "chatRoomId": chatRoomId,
                  "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                  "pearer":
                      "${screenController.shopId}${screenController.shopCatId}",
                  "creatorEmail": UserDetails.userEmail,
                  "peerEmail": screenController.shopEmail,
                  "creatorName": UserDetails.userName,
                  "peerName": screenController.shopName,
                  "createdAt": timeStamp,
                  "userEmails": [
                    UserDetails.userEmail,
                    screenController.shopEmail,
                  ],
                };

                log("chatRoomData : $chatRoomData");

                // Create ChatRoom Function
                firebaseDatabase.createChatRoomOfTwoUsers(
                    chatRoomId, chatRoomData);
                //Go to conversation screen
                Get.to(
                  () => UserConversationScreen(),
                  arguments: [
                    chatRoomId,
                    screenController.shopName,
                    screenController.shopName,
                    UserDetails.userEmail,
                    screenController.shopEmail,
                  ],
                );
              } else {
                if (tempChatRoomIdList[0].contains(chatRoomId)) {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("chatUid : ${screenController.shopId}");
                  log("chatCategoryId : ${screenController.shopCatId}");
                  log("charRoomId1 : $chatRoomId");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator": "${UserDetails.selfId}${UserDetails.categoryId}",
                    "pearer":
                        "${screenController.shopId}${screenController.shopCatId}",
                    "creatorEmail": UserDetails.userEmail,
                    "peerEmail": screenController.shopEmail,
                    "creatorName": UserDetails.userName,
                    "peerName": screenController.shopName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      UserDetails.userEmail,
                      screenController.shopEmail,
                    ],
                  };

                  log("chatRoomData : $chatRoomData");

                  // Create ChatRoom Function
                  firebaseDatabase.createChatRoomOfTwoUsers(
                      chatRoomId, chatRoomData);
                  //Go to conversation screen
                  Get.to(
                    () => UserConversationScreen(),
                    arguments: [
                      chatRoomId,
                      screenController.shopName,
                      screenController.shopName,
                      UserDetails.userEmail,
                      screenController.shopEmail,
                    ],
                  );
                } else {
                  /// Create chat room
                  Timestamp timeStamp = Timestamp.now();

                  log("screenController.chatUid : ${screenController.shopId}");
                  log("screenController.chatCategoryId : ${screenController.shopCatId}");
                  log("charRoomId123 : $chatRoomId2");

                  // ChatRoom Data
                  Map<String, dynamic> chatRoomData = {
                    "chatRoomId": chatRoomId,
                    "creator":
                        "${screenController.shopId}${screenController.shopCatId}",
                    "pearer": " ${UserDetails.selfId}${UserDetails.categoryId}",
                    "creatorEmail": screenController.shopEmail,
                    "peerEmail": UserDetails.userEmail,
                    "creatorName": screenController.shopName,
                    "peerName": UserDetails.userName,
                    "createdAt": timeStamp,
                    "userEmails": [
                      screenController.shopEmail,
                      UserDetails.userEmail,
                    ],
                  };

                  log("chatRoomData : $chatRoomData");

                  // Create ChatRoom Function
                  firebaseDatabase.createChatRoomOfTwoUsers(
                      chatRoomId2, chatRoomData);
                  //Go to conversation screen
                  Get.to(
                    () => UserConversationScreen(),
                    arguments: [
                      chatRoomId2,
                      screenController.shopName,
                      screenController.shopName,
                      UserDetails.userEmail,
                      screenController.shopEmail,
                    ],
                  );
                }

                //Go to conversation screen
                Get.to(
                  () => UserConversationScreen(),
                  arguments: [
                    chatRoomId.isEmpty ? chatRoomId2 : chatRoomId,
                    screenController.shopName,
                    screenController.shopName,
                    UserDetails.userEmail,
                    screenController.shopEmail,
                  ],
                );
              }
            }
          },
          child: Container(
            height: screenController.size.width * 0.018.w,
            width: screenController.size.width * 0.018.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: Image.asset(
              AppIcons.messageImg,
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
            ).commonAllSidePadding(padding: 8),
          ).commonSymmetricPadding(horizontal: 2),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  _makingPhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp(BuildContext context, String number) {
    FocusManager.instance.primaryFocus?.unfocus();

    var whatsappUrl = "whatsapp://send?phone= $number"
        "&text=${Uri.encodeComponent("Hello")}";
    try {
      launch(whatsappUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Unable to open whatsapp"),
        ),
      );
      Fluttertoast.showToast(msg: "Unable to open whatsapp");
    }
  }

  Future<void> launchFacebook(String fbUrl, String fbWebUrl) async {
    try {
      bool launched = await launch(fbUrl, forceSafariVC: false);
      log("Launched Native app $launched");

      if (!launched) {
        await launch(fbWebUrl, forceSafariVC: false);
        log("Launched browser $launched");
      }
    } catch (e) {
      await launch(fbWebUrl, forceSafariVC: false);
      log("Inside catch");
    }
  }

  _makingInstagramApp(String url) async {
    // var url = 'https://www.instagram.com/<INSTAGRAM_PROFILE>/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }
}

class ShopPlaceTimePaymentModule extends StatelessWidget {
  ShopPlaceTimePaymentModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  var themeProvider = Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    log('screenController.showStatus: ${screenController.showStatus.value}');
    return Column(
      children: [
        // Shop Address Module
        screenController.showStatus.value == true
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Image.asset(
              AppIcons.locationImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),*/
                  Icon(
                    Icons.watch_later_outlined,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor,
                    size: 20,
                  ),
                  SizedBox(width: screenController.size.width * 0.008.w),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "Open:" + "${screenController.shopData[0].shopopen}",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.blackTextColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Close: ${screenController.shopData[0].shopclose}",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(),
        SizedBox(height: screenController.size.height * 0.002.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.locationImg,
              height: 20,
              width: 20,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.greyTextColor,
            ),
            SizedBox(width: screenController.size.width * 0.008.w),
            Expanded(
              child: Text(
                "${screenController.shopData[0].address}",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.blackTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenController.size.height * 0.001.h),

        // Shop Time Module

        // Payment Module
        // screenController.showStatus.value == true ?
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     /*Image.asset(
        //       AppIcons.locationImg,
        //       height: 20,
        //       width: 20,
        //       color: themeProvider.darkTheme
        //           ? AppColors.whiteColor
        //           : AppColors.blackTextColor,
        //     ),*/
        //     Icon(
        //       Icons.payment,
        //       color: themeProvider.darkTheme
        //           ? AppColors.whiteColor
        //           : AppColors.greyTextColor,
        //       size: 20,
        //     ),
        //     SizedBox(width: screenController.size.width * 0.008.w),
        //     Expanded(
        //       child: Text(
        //         "Cash, Cash on Delivery, Cheque, Debit Card, Credit Card, UPI, BHIM, Visa Card, Master Card, RuPay Card, G Pay, PhonePe, NEFT, RTGS, IMPS, Paytm.",
        //         style: TextStyle(
        //           color: themeProvider.darkTheme
        //               ? AppColors.whiteColor
        //               : AppColors.blackTextColor,
        //         ),
        //       ),
        //     ),
        //   ],
        // ) : Container(),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class MeetingAvailabilityModule extends StatelessWidget {
  MeetingAvailabilityModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Pet Availability",
          style: TextStyle(
              color: AppColors.accentTextColor,
              // fontWeight: FontWeight.bold,
              fontSize: 12.sp),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),
        SizedBox(
          height: screenController.size.width * 0.15,
          child: screenController.shopData[0].meetingimages!.isEmpty
              ? const Text("Empty Meeting")
              : ListView.builder(
                  itemCount: screenController.shopData[0].meetingimages!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    log('Meeting image: ${screenController.shopData[0].meetingimages!.length}');
                    String imgUrl = ApiUrl.apiImagePath +
                        screenController.shopData[0].meetingimages![i];
                    return _meetingAvailabilityListTile(imgUrl);
                  },
                ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _meetingAvailabilityListTile(String imgUrl) {
    return GestureDetector(
      onTap: () {
        //Get.to(()=> PetMeetingDetailsScreen(), arguments: petList.id);
      },
      child: SizedBox(
        height: screenController.size.width * 0.15,
        width: screenController.size.width * 0.15,
        child: Container(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage(
            //       AppImages.shopDetailsImg,
            //     ),
            //     fit: BoxFit.cover),
            //color: AppColors.greyTextColor,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, er, data) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(AppImages.petMetLogoImg),
                );
              },
            ),
          ),
        ),
      ).commonSymmetricPadding(horizontal: 5),
    );
  }
}

class OverViewModule extends StatelessWidget {
  OverViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopDetailsScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Overview",
          style: TextStyle(
              color: AppColors.accentTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp),
        ),
        SizedBox(height: screenController.size.height * 0.002.h),
        Html(
          data: "${screenController.shopData[0].fullText}",
          style: {
            "body": Style(
              fontSize: FontSize(18.0),
              fontWeight: FontWeight.bold,
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
          },
        ),
        SizedBox(height: screenController.size.height * 0.003.h),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }
}
