import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/trainers_and_users_screen_controller.dart';
import 'package:pet_met/screens/pet_pricing_screen/pet_pricing_screen.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../services/providers/dark_theme_provider.dart';
import '../address_screen/address_screen_widgets.dart';

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

  final screenController = Get.find<TrainersAndUsersScreenController>();

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

  final screenController = Get.find<TrainersAndUsersScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        modelBottomSheet(context);
      },
      child: Container(
          height: screenController.size.height * 0.2,
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
                          height: screenController.size.height * 0.2,
                          width: screenController.size.width * 0.50,
                          fit: BoxFit.fill,
                        ),
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
              : screenController.trainersProfile != ""
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              themeProvider.darkTheme
                                  ? screenController.trainersProfile
                                  : screenController.trainersProfile,
                              height: screenController.size.height * 0.2,
                              width: screenController.size.width * 0.50,
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
                                      fit: BoxFit.fill,
                                      height: screenController.size.height * 0.2,
                                      width: screenController.size.width * 0.50,
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
                              },
                            ),
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
                    )),
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

class TrainersAchievmentPictureListModule extends StatelessWidget {
  TrainersAchievmentPictureListModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrainersAndUsersScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trainer Achievement's Pictures:",
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: screenController.size.width * 0.18,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                /*return Stack(
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
                        child: index == 0
                            ? screenController.trainerPictureFile1 != null
                                ? Image.file(
                                    screenController.trainerPictureFile1!,
                                    height: 65,
                                    fit: BoxFit.fill,
                                  )
                                : screenController.trainerImage1 != null
                                    ? Image.network(
                                        screenController.trainerImage1!,
                                        height: 65,
                                        fit: BoxFit.fill,
                                        errorBuilder: (context, er, st) {
                                          return Image.asset(
                                              AppImages.petMetLogoImg);
                                        },
                                      )
                                    : Image.asset(
                                        AppImages.petMetLogoImg,
                                        fit: BoxFit.fill,
                                      )
                            : index == 1
                                ? screenController.trainerPictureFile2 != null
                                    ? Image.file(
                                        screenController.trainerPictureFile2!,
                                        height: 65,
                                        fit: BoxFit.fill,
                                      )
                                    : screenController.trainerImage2 != null
                                        ? Image.network(
                                            screenController.trainerImage2!,
                                            height: 65,
                                            fit: BoxFit.fill,
                                            errorBuilder: (context, er, st) {
                                              return Image.asset(
                                                AppImages.petMetLogoImg,
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          )
                                        : Image.asset(AppImages.petMetLogoImg)
                                : index == 2
                                    ? screenController.trainerPictureFile3 !=
                                            null
                                        ? Image.file(
                                            screenController
                                                .trainerPictureFile3!,
                                            height: 65,
                                            fit: BoxFit.fill,
                                          )
                                        : screenController.trainerImage3 != null
                                            ? Image.network(
                                                screenController.trainerImage3!,
                                                height: 65,
                                                fit: BoxFit.fill,
                                                errorBuilder:
                                                    (context, er, st) {
                                                  return Image.asset(
                                                    AppImages.petMetLogoImg,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              )
                                            : Image.asset(
                                                AppImages.petMetLogoImg)
                                    : index == 3
                                        ? screenController
                                                    .trainerPictureFile4 !=
                                                null
                                            ? Image.file(
                                                screenController
                                                    .trainerPictureFile4!,
                                                height: 65,
                                                fit: BoxFit.fill,
                                              )
                                            : screenController.trainerImage4 !=
                                                    null
                                                ? Image.network(
                                                    screenController
                                                        .trainerImage4!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                    errorBuilder:
                                                        (context, er, st) {
                                                      return Image.asset(
                                                          AppImages
                                                              .petMetLogoImg);
                                                    },
                                                  )
                                                : Image.asset(
                                                    AppImages.petMetLogoImg,
                                                    fit: BoxFit.fill,
                                                  )
                                        : index == 4
                                            ? screenController
                                                        .trainerPictureFile5 !=
                                                    null
                                                ? Image.file(
                                                    screenController
                                                        .trainerPictureFile5!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                  )
                                                : screenController
                                                            .trainerImage5 !=
                                                        null
                                                    ? Image.network(
                                                        screenController
                                                            .trainerImage5!,
                                                        height: 65,
                                                        fit: BoxFit.fill,
                                                        errorBuilder:
                                                            (context, er, st) {
                                                          return Image.asset(
                                                            AppImages
                                                                .petMetLogoImg,
                                                            fit: BoxFit.fill,
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
                            //getFromGallery();
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
                              color: AppColors.accentColor,
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
                );*/
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: index == 0
                            ? screenController.trainerPictureFile1 != null
                                ? Image.file(
                                    screenController.trainerPictureFile1!,
                                    height: 65,
                                    fit: BoxFit.fill,
                                  )
                                : screenController.trainerImage1 != null
                                    ? Image.network(
                                        screenController.trainerImage1!,
                                        height: 65,
                                        fit: BoxFit.fill,
                                        errorBuilder: (context, er, st) {
                                          return Icon(
                                            Icons.add,
                                            color: AppColors.accentTextColor,
                                          );
                                        },
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: AppColors.accentTextColor,
                                      )
                            : index == 1
                                ? screenController.trainerPictureFile2 != null
                                    ? Image.file(
                                        screenController.trainerPictureFile2!,
                                        height: 65,
                                        fit: BoxFit.fill,
                                      )
                                    : screenController.trainerImage2 != null
                                        ? Image.network(
                                            screenController.trainerImage2!,
                                            height: 65,
                                            fit: BoxFit.fill,
                                            errorBuilder: (context, er, st) {
                                              return Icon(
                                                Icons.add,
                                                color:
                                                    AppColors.accentTextColor,
                                              );
                                            },
                                          )
                                        : Icon(
                                            Icons.add,
                                            color: AppColors.accentTextColor,
                                          )
                                : index == 2
                                    ? screenController.trainerPictureFile3 !=
                                            null
                                        ? Image.file(
                                            screenController
                                                .trainerPictureFile3!,
                                            height: 65,
                                            fit: BoxFit.fill,
                                          )
                                        : screenController.trainerImage3 != null
                                            ? Image.network(
                                                screenController.trainerImage3!,
                                                height: 65,
                                                fit: BoxFit.fill,
                                                errorBuilder:
                                                    (context, er, st) {
                                                  return Icon(
                                                    Icons.add,
                                                    color: AppColors
                                                        .accentTextColor,
                                                  );
                                                },
                                              )
                                            : Icon(
                                                Icons.add,
                                                color:
                                                    AppColors.accentTextColor,
                                              )
                                    : index == 3
                                        ? screenController
                                                    .trainerPictureFile4 !=
                                                null
                                            ? Image.file(
                                                screenController
                                                    .trainerPictureFile4!,
                                                height: 65,
                                                fit: BoxFit.fill,
                                              )
                                            : screenController.trainerImage4 !=
                                                    null
                                                ? Image.network(
                                                    screenController
                                                        .trainerImage4!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                    errorBuilder:
                                                        (context, er, st) {
                                                      return Icon(
                                                        Icons.add,
                                                        color: AppColors
                                                            .accentTextColor,
                                                      );
                                                    },
                                                  )
                                                : Icon(
                                                    Icons.add,
                                                    color: AppColors
                                                        .accentTextColor,
                                                  )
                                        : index == 4
                                            ? screenController
                                                        .trainerPictureFile5 !=
                                                    null
                                                ? Image.file(
                                                    screenController
                                                        .trainerPictureFile5!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                  )
                                                : screenController
                                                            .trainerImage5 !=
                                                        null
                                                    ? Image.network(
                                                        screenController
                                                            .trainerImage5!,
                                                        height: 65,
                                                        fit: BoxFit.fill,
                                                        errorBuilder:
                                                            (context, er, st) {
                                                          return Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .accentTextColor,
                                                          );
                                                        },
                                                      )
                                                    : Icon(
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
      ],
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
      screenController.trainerPictureFile1 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile1}');
      log('Camera Image Path : ${screenController.trainerPictureFile1!.path}');
    } else {}

    screenController.trainerPictureFile1 = File(pickedFile!.path);
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
      screenController.trainerPictureFile2 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile2}');
      log('Camera Image Path : ${screenController.trainerPictureFile2!.path}');
    } else {}

    screenController.trainerPictureFile2 = File(pickedFile!.path);
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
      screenController.trainerPictureFile3 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile3}');
      log('Camera Image Path : ${screenController.trainerPictureFile3!.path}');
    } else {}

    screenController.trainerPictureFile3 = File(pickedFile!.path);
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
      screenController.trainerPictureFile4 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile4}');
      log('Camera Image Path : ${screenController.trainerPictureFile4!.path}');
    } else {}

    screenController.trainerPictureFile4 = File(pickedFile!.path);
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
      screenController.trainerPictureFile5 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile5}');
      log('Camera Image Path : ${screenController.trainerPictureFile5!.path}');
    } else {}

    screenController.trainerPictureFile5 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }
}

class CommonTextFieldModule extends StatelessWidget {
  //CommonTextFieldModule({Key? key}) : super(key: key);
  String? fieldName;
  String? fieldHinttext;

  CommonTextFieldModule({this.fieldName, this.fieldHinttext});

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
                color: AppColors.blackTextColor.withOpacity(0.7),
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

class TrainersNameTextFieldModule extends StatelessWidget {
  // const TrainersNameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();
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
              "Trainers Name",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.darkThemeColor,
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
          hintText: "Trainers Name",
          maxLength: 10,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  // const TrainersNameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();
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
                    : AppColors.darkThemeColor,
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
          validator: (val) => Validations().validateEmail(val!),
        ),
      ],
    );
  }
}

class DisplayNameTextFieldModule extends StatelessWidget {
  DisplayNameTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<TrainersAndUsersScreenController>();

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
                text: 'Display Name ',
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
          fieldController: controller.displayNameController,
          height: controller.size.height * 0.05,
          width: double.infinity,
          hintText: "Display Name",
          maxLength: 10,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateDisplayName(val!),
        ),
      ],
    );
  }
}

class TrainersContactNumberTextField extends StatelessWidget {
  TrainersContactNumberTextField({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
                text: 'Trainers Contact ',
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
          hintText: "Trainers Contact",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          maxLength: 10,
          validator: (val) => Validations().validateMobile(val!),
        ),
      ],
    );
  }
}

class TrainersAddressTextFieldModule extends StatelessWidget {
  TrainersAddressTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
                text: 'Trainers Address ',
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
          hintText: "Trainers Address",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateAddress(val!),
        ),
      ],
    );
  }
}

class TrainersDetailsModule extends StatelessWidget {
  TrainersDetailsModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: 'Trainers Details ',
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
        SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.detailsController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Trainers Details",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateDetails(val!),
        ),
        /*Stack(
          children: [
            Container(
              height: screenController.size.height * 0.05,
              //width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyTextColor.withOpacity(0.25),
                    blurRadius: 35,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: screenController.detailsController,
              validator: (value) => Validations().validateDetails(value!),
              maxLines: 5,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                //hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),*/
      ],
    );
  }
}

class InstagramTextFieldModule extends StatelessWidget {
  InstagramTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
              "Instagram Link",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.darkThemeColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
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

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
              "Facebook Link",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.darkThemeColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
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

class IsActiveTextFieldModule extends StatelessWidget {
  IsActiveTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
                text: 'Active ',
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
        Stack(
          children: [
            Container(
              height: screenController.size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeProvider.darkTheme
                    ? AppColors.darkThemeBoxColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
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
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 10),
                width: Get.width,
                //gives the width of the dropdown button
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //color: Colors.grey.shade200,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.grey.shade100,
                    buttonTheme: ButtonTheme.of(context).copyWith(
                      alignedDropdown: true,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: screenController.trainerActiveStatusValue.value,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: <String>[
                        'Active',
                        'Inactive',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : AppColors.blackTextColor.withOpacity(0.7),
                              fontSize: 13.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: const SizedBox(),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) {
                        screenController.isLoading(true);
                        screenController.trainerActiveStatusValue.value =
                            value!;
                        log("ngoActiveStatusValue.value : ${screenController.trainerActiveStatusValue.value}");
                        screenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        /*CustomLightTextField(
          readOnly: false,
          fieldController: screenController.activeController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Active",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateActive(val!),
        ),*/
      ],
    );
  }
}

class TrainerUpiTextFieldModule extends StatelessWidget {
  TrainerUpiTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrainersAndUsersScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'GPay UPI ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                // children: const <InlineSpan>[
                //   TextSpan(
                //     text: '*',
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.red),
                //   )
                // ]
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.gPayController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "GPay UPI",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          // validator: (val) => Validations().validateFacebookLink(val!),
        ),
      ],
    );
  }
}

class GetVerifiedInfo extends StatelessWidget {
  GetVerifiedInfo({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screenController.scaffoldKey.currentState!.showBottomSheet((context) {
          return Container(
            height: Get.size.height * 0.25,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "To get verify submit below documents",
                      style: TextStyle(
                        fontSize: 15,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.darkThemeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "1. Trainer certificate",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "2. Two pictures of your",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                        const ClipboardData(text: "info@petomate.com"));
                    Fluttertoast.showToast(msg: "Copied");
                  },
                  child: Text(
                    "Mail it on : info@petomate.com",
                    style: TextStyle(
                      fontSize: 15,
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : AppColors.darkThemeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Get verified now",
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.darkThemeColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            AppIcons.verifiedSymbolImg,
            width: 30,
            height: 30,
          ),
          /* Icon(
            Icons.verified_outlined,
            size: 24,
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.darkThemeColor,
          )*/
        ],
      ),
    );
  }
}

/*class GetVerifiedInfo extends StatelessWidget {
  GetVerifiedInfo({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        screenController.scaffoldKey.currentState!.showBottomSheet((context) {
          return Container(
            height: Get.size.height * 0.25,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "To get verified submit below documents",
                      style: TextStyle(
                        fontSize: 15,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.darkThemeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "1. Trainer Registration certificate",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "2. Two pictures of Trainer",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Mail it on : info@petomate.com",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.darkThemeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Get verified now",
            style: TextStyle(
              color: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.darkThemeColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(AppIcons.verifiedSymbolImg,
            width: 30,
            height: 30,
          ),
          */ /*Icon(
            Icons.verified_outlined,
            size: 24,
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.darkThemeColor,
          )*/ /*
        ],
      ),
    );
  }
}*/

class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
                  text: 'Available From ',
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
              //   fieldController: screenController.openTimeController,
              //   height: screenController.size.height * 0.05,
              //   width: double.infinity,
              //   hintText: "Open",
              //   textInputAction: TextInputAction.next,
              //   textInputType: TextInputType.number,
              //   validator: (val) => Validations().validateOpenTime(val!),
              // ),
              Obx(
                () => Container(
                  height: Get.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //border: Border.all(color: Colors.grey),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                      : AppColors.darkThemeColor)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.timer_outlined,
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.darkThemeColor,
                            size: 20,
                          ),
                          tooltip: 'DOB',
                          onPressed: () {
                            timePicker(context);
                          },
                        ),
                      ],
                    ),
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
                  text: 'Available To ',
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
                    //color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    //border: Border.all(color: Colors.grey),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                      : AppColors.darkThemeColor)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.timer_outlined,
                            color: themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : AppColors.darkThemeColor,
                            size: 20,
                          ),
                          tooltip: 'DOB',
                          onPressed: () {
                            closeTimePicker(context);
                          },
                        ),
                      ],
                    ),
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
    final TimeOfDay? result = await showTimePicker(
      context: context,
      cancelText: "Cancel",
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
      log('Close time: ${screenController.selectedCloseTime!.value}');
      // });
    }
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.formKey.currentState!.validate()) {
          await screenController.updateTrainersProfileFunction();
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
