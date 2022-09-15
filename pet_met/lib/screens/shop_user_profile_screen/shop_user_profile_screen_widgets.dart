import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/screens/pet_pricing_screen/pet_pricing_screen.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../services/providers/dark_theme_provider.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({Key? key}) : super(key: key);

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(themeProvider.darkTheme
          ? AppImages.backgroundImgDark
          : AppImages.backgroundImgLight),
    );
  }
}

class BackArrow extends StatelessWidget {
  BackArrow({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppIcons.backButtonImg,
              width: screenController.size.width * 0.07,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}

class UploadImageModule extends StatelessWidget {
  UploadImageModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        modelBottomSheet(context);
      },
      child: Container(
        //height: screenController.size.height * 0.2,
        width: screenController.size.width * 0.50,
        decoration: BoxDecoration(
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          // image: DecorationImage(
          //   image: FileImage(
          //     File(screenController.imageFile!.path),
          //   ),
          // ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyTextColor.withOpacity(0.3),
              blurRadius: 35,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: screenController.imageFile != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                          themeProvider.darkTheme
                              ? screenController.imageFile!
                              : screenController.imageFile!,
                          width: double.infinity,
                          height: screenController.size.height * 0.2,
                          fit: BoxFit.fill),
                    ),

                    //),
                    // const SizedBox(height: 20),
                    // Text(
                    //   "Upload Image",
                    //   style: TextStyle(
                    //     color: themeProvider.darkTheme
                    //         ? AppColors.whiteColor
                    //         : AppColors.blackTextColor,
                    //     fontSize: 15.sp,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ],
                ),
              )
            : screenController.shopImage != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              themeProvider.darkTheme
                                  ? ApiUrl.apiImagePath +
                                      screenController.shopImage!
                                  : ApiUrl.apiImagePath +
                                      screenController.shopImage!,
                              width: double.infinity,
                              height: screenController.size.height * 0.2,
                              fit: BoxFit.fill,
                              errorBuilder: (context, er, st) {
                            //return Image.asset(AppImages.petMetLogoImg);
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  themeProvider.darkTheme
                                      ? AppImages.cameraPlaceHolderImgDark
                                      : AppImages.cameraPlaceHolderImglight,
                                  height: 65,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Upload Image",
                                  style: TextStyle(
                                    color: themeProvider.darkTheme
                                        ? AppColors.whiteColor
                                        : AppColors.blackTextColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),

                        //),
                        // const SizedBox(height: 20),
                        // Text(
                        //   "Upload Image",
                        //   style: TextStyle(
                        //     color: themeProvider.darkTheme
                        //         ? AppColors.whiteColor
                        //         : AppColors.blackTextColor,
                        //     fontSize: 15.sp,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          themeProvider.darkTheme
                              ? AppImages.cameraPlaceHolderImgDark
                              : AppImages.cameraPlaceHolderImglight,
                          height: 65,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Upload Image",
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.blackTextColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  modelBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
          height: screenController.size.height * 0.16,
          child: Column(
            children: [
              ListTile(
                onTap: getFromCamera,
                contentPadding:
                    EdgeInsets.only(left: screenController.size.width * 0.1),
                title: Text(
                  "Select Image From Camera",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.only(left: screenController.size.width * 0.1),
                onTap: getFromGallery,
                title: Text(
                  "Select Image From Gallery",
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Get from gallery
  getFromGallery() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.imageFile = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.imageFile}');
      log('Camera Image Path : ${screenController.imageFile!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    screenController.imageFile = File(pickedFile!.path);
    //setState(() {});
    Get.back();
  }

  /// Get from Camera
  getFromCamera() async {
    // XFile? pickedFile = await ImagePicker().pickImage(
    //   source: ImageSource.camera,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    // if (pickedFile != null) {
    //   setState(() {
    //     controller.imageFile = XFile(pickedFile.path);
    //   });
    // }
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.imageFile = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.imageFile}');
      log('Camera Image Path : ${screenController.imageFile!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    screenController.imageFile = File(pickedFile!.path);
    // setState(() {});
    Get.back();
  }
}

class AddShopOffersListModule extends StatelessWidget {
  AddShopOffersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Add Shops offers:",
        style: TextStyle(
          color: themeProvider.darkTheme
              ? AppColors.whiteColor
              : AppColors.darkThemeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: screenController.size.width * 0.16,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5),
                /*child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                        height: screenController.size.width * 0.16,
                        width: screenController.size.width * 0.16,
                        margin: const EdgeInsets.only(bottom: 5, right: 5),
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage(
                          //       controller.dogsTopList[index],
                          //     ),
                          //     fit: BoxFit.cover),
                          //color: AppColors.greyTextColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: index == 0
                            ? screenController.shopOfferFile1 != null
                                ? Image.file(
                                    screenController.shopOfferFile1!,
                                    height: 65,
                                    fit: BoxFit.contain,
                                  )
                                : screenController.offerImage1 != null
                                    ? Image.network(
                                        screenController.offerImage1!,
                                        height: 65,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, er, st) {
                                          return Image.asset(
                                            AppImages.petMetLogoImg,
                                            fit: BoxFit.contain,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        AppImages.petMetLogoImg,
                                        fit: BoxFit.contain,
                                      )
                            : index == 1
                                ? screenController.shopOfferFile2 != null
                                    ? Image.file(
                                        screenController.shopOfferFile2!,
                                        height: 65,
                                        fit: BoxFit.contain,
                                      )
                                    : screenController.offerImage2 != null
                                        ? Image.network(
                                            screenController.offerImage2!,
                                            height: 65,
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, er, st) {
                                              return Image.asset(
                                                AppImages.petMetLogoImg,
                                                fit: BoxFit.contain,
                                              );
                                            },
                                          )
                                        : Image.asset(AppImages.petMetLogoImg)
                                : index == 2
                                    ? screenController.shopOfferFile3 != null
                                        ? Image.file(
                                            screenController.shopOfferFile3!,
                                            height: 65,
                                            fit: BoxFit.contain,
                                          )
                                        : screenController.offerImage3 != null
                                            ? Image.network(
                                                screenController.offerImage3!,
                                                height: 65,
                                                fit: BoxFit.contain,
                                                errorBuilder:
                                                    (context, er, st) {
                                                  return Image.asset(
                                                    AppImages.petMetLogoImg,
                                                    fit: BoxFit.contain,
                                                  );
                                                },
                                              )
                                            : Image.asset(
                                                AppImages.petMetLogoImg)
                                    : index == 3
                                        ? screenController.shopOfferFile4 !=
                                                null
                                            ? Image.file(
                                                screenController
                                                    .shopOfferFile4!,
                                                height: 65,
                                                fit: BoxFit.contain,
                                              )
                                            : screenController.offerImage4 !=
                                                    null
                                                ? Image.network(
                                                    screenController
                                                        .offerImage4!,
                                                    height: 65,
                                                    fit: BoxFit.contain,
                                                    errorBuilder:
                                                        (context, er, st) {
                                                      return Image.asset(
                                                        AppImages.petMetLogoImg,
                                                        fit: BoxFit.contain,
                                                      );
                                                    },
                                                  )
                                                : Image.asset(
                                                    AppImages.petMetLogoImg)
                                        : index == 4
                                            ? screenController.shopOfferFile5 !=
                                                    null
                                                ? Image.file(
                                                    screenController
                                                        .shopOfferFile5!,
                                                    height: 65,
                                                    fit: BoxFit.contain,
                                                  )
                                                : screenController
                                                            .offerImage5 !=
                                                        null
                                                    ? Image.network(
                                                        screenController
                                                            .offerImage5!,
                                                        height: 65,
                                                        fit: BoxFit.contain,
                                                        errorBuilder:
                                                            (context, er, st) {
                                                          return Image.asset(
                                                            AppImages
                                                                .petMetLogoImg,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                      )
                                                    : Image.asset(
                                                        AppImages.petMetLogoImg)
                                            : Container()),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            if (screenController.showStatus.value == true) {
                              // open gallery
                              getFromGallery();
                            } else if (screenController.showStatus.value ==
                                false) {
                              //screenController.openCheckout();
                              Get.to(() => PetPricingScreen());
                            }
                          } else if (index == 1) {
                            //getFromGallery2();
                            if (screenController.showStatus.value == true) {
                              // open gallery
                              getFromGallery2();
                            } else if (screenController.showStatus.value ==
                                false) {
                              //screenController.openCheckout();
                              Get.to(() => PetPricingScreen());
                            }
                          } else if (index == 2) {
                            //getFromGallery3();
                            if (screenController.showStatus.value == true) {
                              // open gallery
                              getFromGallery3();
                            } else if (screenController.showStatus.value ==
                                false) {
                              //screenController.openCheckout();
                              Get.to(() => PetPricingScreen());
                            }
                          } else if (index == 3) {
                            //getFromGallery4();
                            if (screenController.showStatus.value == true) {
                              // open gallery
                              getFromGallery4();
                            } else if (screenController.showStatus.value ==
                                false) {
                              //screenController.openCheckout();
                              Get.to(() => PetPricingScreen());
                            }
                          } else if (index == 4) {
                            //getFromGallery5();
                            if (screenController.showStatus.value == true) {
                              // open gallery
                              getFromGallery5();
                            } else if (screenController.showStatus.value ==
                                false) {
                              //screenController.openCheckout();
                              Get.to(() => PetPricingScreen());
                            }
                          }
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.greenColor,
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),*/
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      if (screenController.showStatus.value == true) {
                        // open gallery
                        getFromGallery();
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    } else if (index == 1) {
                      if (screenController.showStatus.value == true) {
                        // open gallery
                        getFromGallery2();
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    } else if (index == 2) {
                      if (screenController.showStatus.value == true) {
                        // open gallery
                        getFromGallery3();
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    } else if (index == 3) {
                      if (screenController.showStatus.value == true) {
                        // open gallery
                        getFromGallery4();
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    } else if (index == 4) {
                      if (screenController.showStatus.value == true) {
                        // open gallery
                        getFromGallery5();
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    }
                  },
                  child: Container(
                    height: screenController.size.width * 0.16,
                    width: screenController.size.width * 0.16,
                    margin: const EdgeInsets.only(bottom: 5, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    //padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: index == 0
                          ? screenController.shopOfferFile1 != null
                              ? Image.file(
                                  screenController.shopOfferFile1!,
                                  height: 65,
                                  fit: BoxFit.fill,
                                )
                              : screenController.offerImage1 != null
                                  ? Image.network(
                                      screenController.offerImage1!,
                                      height: 65,
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, er, st) {
                                        return const Icon(
                                          Icons.add,
                                          color: AppColors.accentTextColor,
                                        );
                                      },
                                    )
                                  : const Icon(
                                      Icons.add,
                                      color: AppColors.accentTextColor,
                                    )
                          : index == 1
                              ? screenController.shopOfferFile2 != null
                                  ? Image.file(
                                      screenController.shopOfferFile2!,
                                      height: 65,
                                      fit: BoxFit.fill,
                                    )
                                  : screenController.offerImage2 != null
                                      ? Image.network(
                                          screenController.offerImage2!,
                                          height: 65,
                                          fit: BoxFit.fill,
                                          errorBuilder: (context, er, st) {
                                            return const Icon(
                                              Icons.add,
                                              color: AppColors.accentTextColor,
                                            );
                                          },
                                        )
                                      : const Icon(
                                          Icons.add,
                                          color: AppColors.accentTextColor,
                                        )
                              : index == 2
                                  ? screenController.shopOfferFile3 != null
                                      ? Image.file(
                                          screenController.shopOfferFile3!,
                                          height: 65,
                                          fit: BoxFit.fill,
                                        )
                                      : screenController.offerImage3 != null
                                          ? Image.network(
                                              screenController.offerImage3!,
                                              height: 65,
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, er, st) {
                                                return const Icon(
                                                  Icons.add,
                                                  color:
                                                      AppColors.accentTextColor,
                                                );
                                              },
                                            )
                                          : const Icon(
                                              Icons.add,
                                              color: AppColors.accentTextColor,
                                            )
                                  : index == 3
                                      ? screenController.shopOfferFile4 != null
                                          ? Image.file(
                                              screenController.shopOfferFile4!,
                                              height: 65,
                                              fit: BoxFit.fill,
                                            )
                                          : screenController.offerImage4 != null
                                              ? Image.network(
                                                  screenController.offerImage4!,
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                  errorBuilder:
                                                      (context, er, st) {
                                                    return const Icon(
                                                      Icons.add,
                                                      color: AppColors
                                                          .accentTextColor,
                                                    );
                                                  },
                                                )
                                              : const Icon(
                                                  Icons.add,
                                                  color:
                                                      AppColors.accentTextColor,
                                                )
                                      : index == 4
                                          ? screenController.shopOfferFile5 !=
                                                  null
                                              ? Image.file(
                                                  screenController
                                                      .shopOfferFile5!,
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                )
                                              : screenController.offerImage5 !=
                                                      null
                                                  ? Image.network(
                                                      screenController
                                                          .offerImage5!,
                                                      height: 65,
                                                      fit: BoxFit.fill,
                                                      errorBuilder:
                                                          (context, er, st) {
                                                        return const Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .accentTextColor,
                                                        );
                                                      },
                                                    )
                                                  : const Icon(
                                                      Icons.add,
                                                      color: AppColors
                                                          .accentTextColor,
                                                    )
                                          : Container(),
                    ),
                  ),
                ),
              );
            }),
      )
      /*Row(
          children: [
            Expanded(
              child: Container(
               // height: screenController.size.width * 0.16,
                child: Stack(
                  alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: screenController.size.width * 0.16,
                          width: screenController.size.width * 0.16,
                          margin: const EdgeInsets.only(bottom: 5, right: 5),
                          decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       controller.dogsTopList[index],
                            //     ),
                            //     fit: BoxFit.cover),
                            color: AppColors.greyTextColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: screenController.shopOfferFile1 != null ?
                          Image.file(
                            screenController.shopOfferFile1!,height: 65,) :
                          Image.asset(AppImages.petMetLogoImg),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap:(){
                              getFromGallery();
                            },
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  color: AppColors.accentColor, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                                size: 12,
                              ),
                            ),
                          ),
                        )
                      ],
      ),
    ),
            ),

            Expanded(
              child: Container(
                // height: screenController.size.width * 0.16,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: screenController.size.width * 0.16,
                      width: screenController.size.width * 0.16,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        color: AppColors.greyTextColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: screenController.shopOfferFile2 != null ?
                      Image.file(
                        screenController.shopOfferFile2!,height: 65,) :
                      Image.asset(AppImages.petMetLogoImg),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap:(){
                          getFromGallery2();
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.accentColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                // height: screenController.size.width * 0.16,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: screenController.size.width * 0.16,
                      width: screenController.size.width * 0.16,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        color: AppColors.greyTextColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: screenController.shopOfferFile3 != null ?
                      Image.file(
                        screenController.shopOfferFile3!,height: 65,) :
                      Image.asset(AppImages.petMetLogoImg),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap:(){
                          getFromGallery3();
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.accentColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                // height: screenController.size.width * 0.16,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: screenController.size.width * 0.16,
                      width: screenController.size.width * 0.16,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        color: AppColors.greyTextColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: screenController.shopOfferFile4 != null ?
                      Image.file(
                        screenController.shopOfferFile4!,height: 65,) :
                      Image.asset(AppImages.petMetLogoImg),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap:(){
                          getFromGallery4();
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.accentColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                // height: screenController.size.width * 0.16,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: screenController.size.width * 0.16,
                      width: screenController.size.width * 0.16,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        color: AppColors.greyTextColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: screenController.shopOfferFile5 != null ?
                      Image.file(
                        screenController.shopOfferFile5!,height: 65,) :
                      Image.asset(AppImages.petMetLogoImg),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap:(){
                          getFromGallery5();
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: AppColors.accentColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),*/
    ]);
  }

  /// Get from gallery
  getFromGallery() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.shopOfferFile1 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile1}');
      log('Camera Image Path : ${screenController.shopOfferFile1!.path}');
    } else {}

    screenController.shopOfferFile1 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }

  getFromGallery2() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.shopOfferFile2 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile1}');
      log('Camera Image Path : ${screenController.shopOfferFile1!.path}');
    } else {}

    screenController.shopOfferFile2 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }

  getFromGallery3() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.shopOfferFile3 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile3}');
      log('Camera Image Path : ${screenController.shopOfferFile3!.path}');
    } else {}

    screenController.shopOfferFile3 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }

  getFromGallery4() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.shopOfferFile4 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile4}');
      log('Camera Image Path : ${screenController.shopOfferFile4!.path}');
    } else {}

    screenController.shopOfferFile4 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }

  getFromGallery5() async {
    /*XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        controller.imageFile = XFile(pickedFile.path);
      });
    }*/
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.shopOfferFile5 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile5}');
      log('Camera Image Path : ${screenController.shopOfferFile5!.path}');
    } else {}

    screenController.shopOfferFile5 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }
}

class MeetingAvailabilityModule extends StatelessWidget {
  MeetingAvailabilityModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Your Pets:",
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 12),
        Row(
          children: [
            screenController.petList.length == 5
                ? Container()
                : /*Stack(
                children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        //color: AppColors.greyTextColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(AppImages.petMetLogoImg,
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          //screenController.openCheckout();

                          if (screenController.showStatus.value == true) {
                            Get.to(() => UploadPetScreen(),
                                transition: Transition.native,
                                duration: const Duration(milliseconds: 500),
                                arguments: [PetOption.addOption, ""]);
                          } else if (screenController.showStatus.value ==
                              false) {
                            //screenController.openCheckout();
                            Get.to(() => PetPricingScreen());
                          }
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ]),*/
                GestureDetector(
                    onTap: () {
                      if (screenController.showStatus.value == true) {
                        Get.to(() => UploadPetScreen(),
                                transition: Transition.native,
                                duration: const Duration(milliseconds: 500),
                                arguments: [
                              PetOption.addOption,
                              "",
                              screenController,
                            ])!
                            .then((value) async {
                          await screenController.getAllRoleProfileFunction();
                        });
                      } else if (screenController.showStatus.value == false) {
                        //screenController.openCheckout();
                        Get.to(() => PetPricingScreen());
                      }
                    },
                    child: Container(
                      height: 8.h,
                      width: 8.h,
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       controller.dogsTopList[index],
                        //     ),
                        //     fit: BoxFit.cover),
                        //color: AppColors.greyTextColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: /*ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(AppImages.petMetLogoImg,
                        fit: BoxFit.cover))*/
                          const Icon(
                        Icons.add,
                        color: AppColors.accentTextColor,
                        size: 30,
                      ),
                    ),
                  ),
            screenController.petList.length == 5
                ? Container()
                : const SizedBox(width: 5),
            Expanded(
                child: SizedBox(
              height: 8.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: screenController.petList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log('Pet Id : ${screenController.petList[index].id}');
                      Get.to(() => UploadPetScreen(),
                          transition: Transition.native,
                          duration: const Duration(milliseconds: 500),
                          arguments: [
                            PetOption.updateOption,
                            screenController.petList[index].id,
                            screenController,
                          ]);
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 8.h,
                          width: 7.h,
                          margin: const EdgeInsets.only(bottom: 5, right: 5),
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       controller.dogsTopList[index],
                            //     ),
                            //     fit: BoxFit.cover),
                            //color: AppColors.greyTextColor,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                                ApiUrl.apiImagePath +
                                    screenController.petList[index].image,
                                errorBuilder: (context, st, ob) {
                              return Image.asset(AppImages.petMetLogoImg);
                            }, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ))
          ],
        )
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: true,
          fieldController: screenController.emailController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Email",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          //validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class ShopNameTextFieldModule extends StatelessWidget {
  ShopNameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Shop Name",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: true,
          fieldController: screenController.nameController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Shop Name",
          maxLength: 10,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}

class ContactNumberTextFieldModule extends StatelessWidget {
  ContactNumberTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Contact Number ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: const <InlineSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.contactNumber,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "**** ** ***",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateMobile(val!),
        ),
      ],
    );
  }
}

class AddressTextFieldModule extends StatelessWidget {
  AddressTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Address ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: const <InlineSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.addressController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Address",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateAddress(val!),
        ),
      ],
    );
  }
}

class DetailsTextFieldModule extends StatelessWidget {
  DetailsTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Details ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: const <InlineSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.detailsController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Details",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateDetails(val!),
        ),
      ],
    );
  }
}

class InstagramTextFieldModule extends StatelessWidget {
  InstagramTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Instagram Link ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: const <InlineSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.instagramController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Instagram Link",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateInstagramLink(val!),
        ),
      ],
    );
  }
}

class FacebookLinkTextFieldModule extends StatelessWidget {
  FacebookLinkTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'Facebook Link ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: const <InlineSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.facebookController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Facebook Link",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateFacebookLink(val!),
        ),
      ],
    );
  }
}

class CommonTextFieldModule extends StatelessWidget {
  //CommonTextFieldModule({Key? key}) : super(key: key);
  String? fieldName;
  String? fieldHinttext;

  CommonTextFieldModule({this.fieldName, this.fieldHinttext});

  final screenController = Get.find<ShopUserProfileScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              fieldName!,
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          fieldController: screenController.nameController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: fieldHinttext,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  text: 'Open shop time ',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  children: const <InlineSpan>[
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )
                  ])),
              const SizedBox(height: 8),
              /* CustomLightTextField(
                readOnly: false,
                fieldController: screenController.openTimeController,
                height: screenController.size.height * 0.05,
                width: double.infinity,
                hintText: "Open",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                validator: (val) => Validations().validateOpenTime(val!),
              ),*/
              Obx(
                () => Container(
                  height: Get.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeProvider.darkTheme
                        ? AppColors.darkThemeBoxColor
                        : AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.05)
                            : AppColors.greyTextColor.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            screenController.selectedOpenTime != null
                                ? screenController.selectedOpenTime!.value
                                : "No time selected!",
                            // textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.blackTextColor)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.timer_outlined,
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                          size: 20,
                        ),
                        tooltip: 'Open Time',
                        onPressed: () {
                          timePicker(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  text: 'Close shop time ',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  children: const <InlineSpan>[
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )
                  ])),
              const SizedBox(height: 8),
              // CustomLightTextField(
              //   readOnly: false,
              //   fieldController: screenController.closeTimeController,
              //   height: screenController.size.height * 0.05,
              //   width: double.infinity,
              //   hintText: "Close",
              //   textInputAction: TextInputAction.done,
              //   textInputType: TextInputType.number,
              //   validator: (val) => Validations().validateCloseTime(val!),
              // ),
              Obx(
                () => Container(
                  height: Get.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeProvider.darkTheme
                        ? AppColors.darkThemeBoxColor
                        : AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor.withOpacity(0.05)
                            : AppColors.greyTextColor.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            screenController.selectedCloseTime != null
                                ? screenController.selectedCloseTime!.value
                                : "No time selected!",
                            // textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : AppColors.blackTextColor)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.timer_outlined,
                          color: themeProvider.darkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackTextColor,
                          size: 20,
                        ),
                        tooltip: 'Close Time',
                        onPressed: () {
                          closeTimePicker(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> timePicker(BuildContext context) async {
    DarkThemeProvider themeProvider =
        Provider.of<DarkThemeProvider>(Get.context!, listen: false);
    TimePickerThemeData(
      backgroundColor: themeProvider.darkTheme
          ? AppColors.darkThemeColor
          : AppColors.whiteColor,
    );
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      //setState(() {
      screenController.selectedOpenTime!.value = result.format(context);
      log('Open time: ${screenController.selectedOpenTime!.value}');
      // });
    }
  }

  Future<void> closeTimePicker(BuildContext context) async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      //setState(() {
      screenController.selectedCloseTime!.value = result.format(context);
      log('Open time: ${screenController.selectedCloseTime!.value}');
      // });
    }
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.formKey.currentState!.validate()) {
          if (screenController.selectedOpenTime!.value.isEmpty) {
            Fluttertoast.showToast(msg: 'Please shop select open time');
          } else if (screenController.selectedCloseTime!.value.isEmpty) {
            Fluttertoast.showToast(msg: 'Please shop select close time');
          } else {
            await screenController.updateShopProfileFunction();
          }
        }
        // controller.submitLoginForm();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
