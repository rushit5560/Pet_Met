import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/ngo_user_profile_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
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

  final screenController = Get.find<NgoUserProfileScreenController>();

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

  final screenController = Get.find<NgoUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        modelBottomSheet(context);
      },
      child: Container(
          // height: screenController.size.height * 0.2,
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
              : screenController.ngoProfile != null
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
                                      screenController.ngoProfile!
                                  : ApiUrl.apiImagePath +
                                      screenController.ngoProfile!,
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
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Upload Image",
                            style: TextStyle(
                              color: AppColors.blackTextColor,
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

class NameOfNgoListModule extends StatelessWidget {
  NameOfNgoListModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "NGO/VET picture",
          style: TextStyle(
            color: themeProvider.darkTheme
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        /*Container(
          height: screenController.size.width * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return Stack(
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
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
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
                  )
                ],
              );
            },
          ),
        ),*/
        SizedBox(
          height: screenController.size.width * 0.17,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  // height: screenController.size.width * 0.16,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    /*child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            height: screenController.size.width * 0.16,
                            width: screenController.size.width * 0.16,
                            margin: const EdgeInsets.only(bottom: 5, right: 10),
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //       controller.dogsTopList[index],
                              //     ),
                              //     fit: BoxFit.cover),
                              //color: AppColors.greyTextColor,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: index == 0
                                ? screenController.ngoPictureFile1 != null
                                    ? Image.file(
                                        screenController.ngoPictureFile1!,
                                        height: 65,
                                        fit: BoxFit.fill,
                                      )
                                    : screenController.ngoImage1 != null
                                        ? Image.network(
                                            screenController.ngoImage1!,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                            errorBuilder: (context, er, st) {
                                              return Image.asset(
                                                AppImages.petMetLogoImg,
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          )
                                        : Image.asset(AppImages.petMetLogoImg)
                                : index == 1
                                    ? screenController.ngoPictureFile2 != null
                                        ? Image.file(
                                            screenController.ngoPictureFile2!,
                                            height: 65,
                                            fit: BoxFit.fill,
                                          )
                                        : screenController.ngoImage2 != null
                                            ? Image.network(
                                                screenController.ngoImage2!,
                                                height: 50,
                                                width: 50,
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
                                    : index == 2
                                        ? screenController.ngoPictureFile3 !=
                                                null
                                            ? Image.file(
                                                screenController
                                                    .ngoPictureFile3!,
                                                height: 65,
                                                fit: BoxFit.fill,
                                              )
                                            : screenController.ngoImage3 != null
                                                ? Image.network(
                                                    screenController.ngoImage3!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                    errorBuilder:
                                                        (context, er, st) {
                                                      return Image.asset(
                                                        AppImages.petMetLogoImg,
                                                        fit: BoxFit.fill,
                                                        height: 50,
                                                        width: 50,
                                                      );
                                                    },
                                                  )
                                                : Image.asset(
                                                    AppImages.petMetLogoImg)
                                        : index == 3
                                            ? screenController
                                                        .ngoPictureFile4 !=
                                                    null
                                                ? Image.file(
                                                    screenController
                                                        .ngoPictureFile4!,
                                                    height: 65,
                                                    fit: BoxFit.fill,
                                                  )
                                                : screenController.ngoImage4 !=
                                                        null
                                                    ? Image.network(
                                                        screenController
                                                            .ngoImage4!,
                                                        height: 50,
                                                        width: 50,
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
                                            : index == 4
                                                ? screenController
                                                            .ngoPictureFile5 !=
                                                        null
                                                    ? Image.file(
                                                        screenController
                                                            .ngoPictureFile5!,
                                                        height: 65,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : screenController
                                                                .ngoImage5 !=
                                                            null
                                                        ? Image.network(
                                                            screenController
                                                                .ngoImage5!,
                                                            height: 50,
                                                            width: 50,
                                                            fit: BoxFit.fill,
                                                            errorBuilder:
                                                                (context, er,
                                                                    st) {
                                                              return Image
                                                                  .asset(
                                                                AppImages
                                                                    .petMetLogoImg,
                                                                fit:
                                                                    BoxFit.fill,
                                                              );
                                                            },
                                                          )
                                                        : Image.asset(AppImages
                                                            .petMetLogoImg)
                                                : Container()),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                getFromGallery();
                              } else if (index == 1) {
                                getFromGallery2();
                              } else if (index == 2) {
                                getFromGallery3();
                              } else if (index == 3) {
                                getFromGallery4();
                              } else if (index == 4) {
                                getFromGallery5();
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
                    ),*/
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          getFromGallery();
                        } else if (index == 1) {
                          getFromGallery2();
                        } else if (index == 2) {
                          getFromGallery3();
                        } else if (index == 3) {
                          getFromGallery4();
                        } else if (index == 4) {
                          getFromGallery5();
                        }
                      },
                      child: Container(
                        height: screenController.size.width * 0.16,
                        width: screenController.size.width * 0.16,
                        margin: const EdgeInsets.only(bottom: 5, right: 10),
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: index == 0
                              ? screenController.ngoPictureFile1 != null
                                  ? Image.file(
                                      screenController.ngoPictureFile1!,
                                      height: 65,
                                      fit: BoxFit.fill,
                                    )
                                  : screenController.ngoImage1 != null
                                      ? Image.network(
                                          screenController.ngoImage1!,
                                          height: 50,
                                          width: 50,
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
                                  ? screenController.ngoPictureFile2 != null
                                      ? Image.file(
                                          screenController.ngoPictureFile2!,
                                          height: 65,
                                          fit: BoxFit.fill,
                                        )
                                      : screenController.ngoImage2 != null
                                          ? Image.network(
                                              screenController.ngoImage2!,
                                              height: 50,
                                              width: 50,
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
                                  : index == 2
                                      ? screenController.ngoPictureFile3 != null
                                          ? Image.file(
                                              screenController.ngoPictureFile3!,
                                              height: 65,
                                              fit: BoxFit.fill,
                                            )
                                          : screenController.ngoImage3 != null
                                              ? Image.network(
                                                  screenController.ngoImage3!,
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
                                      : index == 3
                                          ? screenController.ngoPictureFile4 !=
                                                  null
                                              ? Image.file(
                                                  screenController
                                                      .ngoPictureFile4!,
                                                  height: 65,
                                                  fit: BoxFit.fill,
                                                )
                                              : screenController.ngoImage4 !=
                                                      null
                                                  ? Image.network(
                                                      screenController
                                                          .ngoImage4!,
                                                      height: 50,
                                                      width: 50,
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
                                          : index == 4
                                              ? screenController
                                                          .ngoPictureFile5 !=
                                                      null
                                                  ? Image.file(
                                                      screenController
                                                          .ngoPictureFile5!,
                                                      height: 65,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : screenController
                                                              .ngoImage5 !=
                                                          null
                                                      ? Image.network(
                                                          screenController
                                                              .ngoImage5!,
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.fill,
                                                          errorBuilder:
                                                              (context, er,
                                                                  st) {
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
      screenController.ngoPictureFile1 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.ngoPictureFile1}');
      log('Camera Image Path : ${screenController.ngoPictureFile1!.path}');
    } else {}

    screenController.ngoPictureFile1 = File(pickedFile!.path);
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
      screenController.ngoPictureFile2 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.ngoPictureFile2}');
      log('Camera Image Path : ${screenController.ngoPictureFile2!.path}');
    } else {}

    screenController.ngoPictureFile2 = File(pickedFile!.path);
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
      screenController.ngoPictureFile3 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.ngoPictureFile3}');
      log('Camera Image Path : ${screenController.ngoPictureFile3!.path}');
    } else {}

    screenController.ngoPictureFile3 = File(pickedFile!.path);
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
      screenController.ngoPictureFile4 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.ngoPictureFile4}');
      log('Camera Image Path : ${screenController.ngoPictureFile4!.path}');
    } else {}

    screenController.ngoPictureFile4 = File(pickedFile!.path);
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
      screenController.ngoPictureFile5 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.ngoPictureFile5}');
      log('Camera Image Path : ${screenController.ngoPictureFile5!.path}');
    } else {}

    screenController.ngoPictureFile5 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }
}

class NgoBankNameModule extends StatelessWidget {
  NgoBankNameModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ngo Bank Name:", style: TextStyle(color: Colors.black)),
        const SizedBox(height: 8),
        Container(
          height: screenController.size.width * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return Stack(
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
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
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
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

/*class CommonTextFieldModule extends StatelessWidget {
  //CommonTextFieldModule({Key? key}) : super(key: key);
  String? fieldName;
  String? fieldHinttext;

  CommonTextFieldModule({this.fieldName, this.fieldHinttext});

  final screenController = Get.find<NgoUserProfileScreenController>();

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
}*/

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
              "Name",
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
          hintText: "Name",
          maxLength: 10,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}

class NgoBankAccountNumberTextFieldModule extends StatelessWidget {
  NgoBankAccountNumberTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
                text: 'Ngo Bank Account Number ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: <InlineSpan>[
                  const TextSpan(
                    text: '*',
                    style: const TextStyle(
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
          fieldController: screenController.accountNumberController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Ngo Bank Account Number",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateBankAccountNumber(val!),
          maxLength: 18,
        ),
      ],
    );
  }
}

class IfscCodeTextFieldModule extends StatelessWidget {
  IfscCodeTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();

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
                text: 'IFSC Code ',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                children: <InlineSpan>[
                  const TextSpan(
                    text: '*',
                    style: const TextStyle(
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
          fieldController: screenController.ifscCodeController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "IFSC Code",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateIfscCode(val!),
          maxLength: 11,
        ),
      ],
    );
  }
}

class NgoAddressTextFieldModule extends StatelessWidget {
  NgoAddressTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
                text: 'Ngo Address ',
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
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validations().validateAddress(val!),
        ),
      ],
    );
  }
}

class NgoContactTextFieldModule extends StatelessWidget {
  NgoContactTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
                text: 'Ngo Contact ',
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
          fieldController: screenController.contactController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Ngo Contact",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.phone,
          validator: (val) => Validations().validateMobile(val!),
          maxLength: 10,
        ),
      ],
    );
  }
}

class NgoDetailsTextFieldModule extends StatelessWidget {
  NgoDetailsTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
                text: 'Ngo Details ',
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

  final screenController = Get.find<NgoUserProfileScreenController>();
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
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            )
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
          // validator: (val) => Validations().validateInstagramLink(val!),
        ),
      ],
    );
  }
}

class GetVerifiedInfo extends StatelessWidget {
  GetVerifiedInfo({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();
  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

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
                  "1. Vet&Ngo Registration certificate",
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
                  "2. Two pictures of your Vet&Ngo",
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
          /*Icon(
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

class FacebookLinkTextFieldModule extends StatelessWidget {
  FacebookLinkTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  DarkThemeProvider themeProvider =
      Provider.of<DarkThemeProvider>(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text.rich(
            //     TextSpan(
            //         text: 'Facebook Link ',
            //         style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.bold),
            //         children: const <InlineSpan>[
            //           TextSpan(
            //             text: '*',
            //             style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red),
            //           )
            //         ]
            //     )
            // ),
            Text(
              "Facebook Link",
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            )
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
          //validator: (val) => Validations().validateFacebookLink(val!),
        ),
      ],
    );
  }
}

class NgoUpiTextFieldModule extends StatelessWidget {
  NgoUpiTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();
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

class IsActiveTextFieldModule extends StatelessWidget {
  IsActiveTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();
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
                text: 'Active Status ',
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
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor.withOpacity(0.05)
                          : AppColors.greyTextColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 0),
                    ),
                  ]),
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
                      value: screenController.ngoActiveStatusValue.value,
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
                        screenController.ngoActiveStatusValue.value = value!;
                        log("ngoActiveStatusValue.value : ${screenController.ngoActiveStatusValue.value}");
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

class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();
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
                  text: 'Open time ',
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
              // Stack(
              //   children: [
              //     Container(
              //       height: screenController.size.height * 0.05,
              //       //width: double.infinity,
              //       decoration: BoxDecoration(
              //         color: Colors.transparent,
              //         boxShadow: [
              //           BoxShadow(
              //             color: AppColors.greyTextColor.withOpacity(0.25),
              //             blurRadius: 35,
              //             spreadRadius: 1,
              //             offset: const Offset(0, 0),
              //           ),
              //         ],
              //       ),
              //     ),
              //     TextFormField(
              //       readOnly: false,
              //       controller: screenController.openTimeController,
              //       validator: (val) => Validations().validateOpenTime(val!),
              //       textInputAction: TextInputAction.next,
              //       keyboardType: TextInputType.number,
              //       style: TextStyle(
              //         color: AppColors.blackTextColor,
              //         fontSize: 13.sp,
              //         fontWeight: FontWeight.w400,
              //         decoration: TextDecoration.none,
              //       ),
              //       decoration: InputDecoration(
              //         fillColor: AppColors.whiteColor,
              //         filled: true,
              //         contentPadding:
              //         const EdgeInsets.symmetric(horizontal: 15),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide:
              //           const BorderSide(width: 0, style: BorderStyle.none),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide:
              //           const BorderSide(width: 0, style: BorderStyle.none),
              //         ),
              //         //hintText: hintText,
              //         hintStyle: TextStyle(
              //           color: AppColors.greyTextColor,
              //           fontSize: 13.sp,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //     ),
              //   ],
              // )
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
                      ]),
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
                                    : AppColors.darkThemeColor,
                              )),
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
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  text: 'Close time ',
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
              /*Stack(
                children: [
                  Container(
                    height: screenController.size.height * 0.05,
                    //width: width,
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
                    readOnly: false,
                    controller: screenController.closeTimeController,
                    validator: (val) => Validations().validateCloseTime(val!),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15),
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
              )*/
              Obx(
                () => Container(
                  height: Get.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: Colors.transparent,
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
                      ]),
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
                                    : AppColors.darkThemeColor,
                              )),
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
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
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

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.formKey.currentState!.validate()) {
          await screenController.updateVetAndNgoProfileFunction();
        }
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
