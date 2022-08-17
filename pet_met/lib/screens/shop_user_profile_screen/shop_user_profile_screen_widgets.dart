import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/screens/upload_pet_screen/upload_pet_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
import 'package:pet_met/utils/enums.dart';
import 'package:pet_met/utils/validations.dart';
import 'package:sizer/sizer.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        modelBottomSheet(context);
      },
      child: Container(
        height: screenController.size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
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
                      ? screenController.imageFile! : screenController.imageFile!,
                    width: double.infinity,
                    height: screenController.size.height * 0.2,
                  fit: BoxFit.cover),
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
        ):
        screenController.shopImage != null ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  themeProvider.darkTheme
                      ? ApiUrl.apiImagePath + screenController.shopImage! : ApiUrl.apiImagePath + screenController.shopImage!,
                    width: double.infinity,
                    height: screenController.size.height * 0.2,
                    fit: BoxFit.cover,
                  errorBuilder: (context, er, st){
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
        ):
        Center(
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

  modelBottomSheet(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      constraints: null,
      builder: (BuildContext context) {
        return Container(
          color: themeProvider.darkTheme
              ? AppColors.blackTextColor
              : AppColors.whiteColor,
          height: screenController.size.height * 0.15,
          child: Column(
            children: [
              ListTile(
                onTap: getFromCamera,
                contentPadding:
                EdgeInsets.only(left: screenController.size.width * 0.1),
                title: Text(
                  "Select Image From Camera",
                  style: TextStyle(
                    color: AppColors.blackTextColor.withOpacity(0.7),
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
                    color: AppColors.blackTextColor.withOpacity(0.7),
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
    } else {


    }

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
    } else {


    }

    screenController.imageFile = File(pickedFile!.path);
    // setState(() {});
    Get.back();
  }
}

class AddShopOffersListModule extends StatelessWidget {
  AddShopOffersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ShopUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Shops offers:", style: TextStyle(color: Colors.black),),
        SizedBox(height: 8),
        Container(
          height: screenController.size.width * 0.16,
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
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
                        child: index == 0 ?
                        screenController.shopOfferFile1 != null ?
                        Image.file(
                          screenController.shopOfferFile1!,height: 65,) :
                            screenController.offerImage1 != null ?
                            Image.network(
                              screenController.offerImage1!,height: 65,
                              errorBuilder: (context, er, st){
                                return Image.asset(AppImages.petMetLogoImg);
                              },):
                        Image.asset(AppImages.petMetLogoImg) :

                        index == 1 ?
                        screenController.shopOfferFile2 != null ?
                        Image.file(
                          screenController.shopOfferFile2!,height: 65,) :
                        screenController.offerImage2 != null ?
                        Image.network(
                          screenController.offerImage2!,height: 65,
                          errorBuilder: (context, er, st){
                            return Image.asset(AppImages.petMetLogoImg);
                          },):
                        Image.asset(AppImages.petMetLogoImg) :

                          index == 2 ?
                          screenController.shopOfferFile3 != null ?
                          Image.file(
                            screenController.shopOfferFile3!,height: 65,) :
                          screenController.offerImage3 != null ?
                          Image.network(
                            screenController.offerImage3!,height: 65,
                            errorBuilder: (context, er, st){
                              return Image.asset(AppImages.petMetLogoImg);
                            },):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 3 ?
                          screenController.shopOfferFile4 != null ?
                          Image.file(
                            screenController.shopOfferFile4!,height: 65,) :
                          screenController.offerImage4 != null ?
                          Image.network(
                            screenController.offerImage4!,height: 65,
                            errorBuilder: (context, er, st){
                              return Image.asset(AppImages.petMetLogoImg);
                            },):
                          Image.asset(AppImages.petMetLogoImg):

                          index == 4 ?
                          screenController.shopOfferFile5 != null ?
                          Image.file(
                            screenController.shopOfferFile5!,height: 65,) :
                          screenController.offerImage5 != null ?
                          Image.network(
                            screenController.offerImage5!,height: 65,
                            errorBuilder: (context, er, st){
                              return Image.asset(AppImages.petMetLogoImg);
                            },):
                          Image.asset(AppImages.petMetLogoImg) : Container()
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap:(){
                            if(index == 0){
                              getFromGallery();
                            } else if(index == 1){
                              getFromGallery2();
                            } else if(index == 2){
                              getFromGallery3();
                            } else if(index == 3){
                              getFromGallery4();
                            } else if(index == 4){
                              getFromGallery5();
                            }

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
    ]
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
      screenController.shopOfferFile1 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.shopOfferFile1}');
      log('Camera Image Path : ${screenController.shopOfferFile1!.path}');
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

    screenController.shopOfferFile5 = File(pickedFile!.path);
    //setState(() {});
    // Get.back();
  }
}

class MeetingAvailabilityModule extends StatelessWidget {
  MeetingAvailabilityModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Meeting Availability for Pets:", style: TextStyle(color: Colors.black)),
        SizedBox(height: 8),
        /*Container(
          height: screenController.size.width * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: screenController.meetingImagesList.length,
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
                    child: Image.network(ApiUrl.apiImagePath + screenController.meetingImagesList[index],
                      errorBuilder: (context, st, ob){
                        return Image.asset(AppImages.petMetLogoImg);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  */
        /*Positioned(
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
                  )*//*
                ],
              );
            },
          ),
        ),*/

        Row(
          children: [
            Stack(
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(AppImages.petMetLogoImg, fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        // petOption == PetOption.addOption ?
                        // ""
                        //     : "";
                        //    // :

                        Get.to(() => UploadPetScreen(),
                            transition: Transition.native,
                            duration: const Duration(milliseconds: 500),
                            arguments: [PetOption.addOption, ""]);
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
                ]),
            SizedBox(width: 5),
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
                          Get.to(()=> UploadPetScreen(),
                              transition: Transition.native,
                              duration: const Duration(milliseconds: 500),
                              arguments: [
                                PetOption.updateOption,
                                screenController.petList[index].id
                              ]);
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 8.h,
                              width: 7.h,
                              margin: const EdgeInsets.only(
                                  bottom: 5, right: 5),
                              decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(
                                //       controller.dogsTopList[index],
                                //     ),
                                //     fit: BoxFit.cover),
                                //color: AppColors.greyTextColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                child: Image.network(
                                    ApiUrl.apiImagePath + screenController.petList[index].image,
                                    errorBuilder: (context, st, ob) {
                                      return Image.asset(AppImages.petMetLogoImg);
                                    },
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
            )
          ],
        )
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

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
                color: AppColors.blackTextColor.withOpacity(0.7),
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
                color: AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: screenController.nameController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Shop Name",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Contact Number",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Address",
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
          readOnly: false,
          fieldController: screenController.addressController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "**** ** ***",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Details",
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
                color: AppColors.blackTextColor.withOpacity(0.7),
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

  final screenController = Get.find<ShopUserProfileScreenController>();

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
                color: AppColors.blackTextColor.withOpacity(0.7),
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


class CommonTextFieldModule extends StatelessWidget {
  //CommonTextFieldModule({Key? key}) : super(key: key);
  String? fieldName;
  String? fieldHinttext;

  CommonTextFieldModule({this.fieldName, this.fieldHinttext});

  final screenController = Get.find<ShopUserProfileScreenController>();

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

class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<ShopUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open shop time",
                style: TextStyle(
                  color: AppColors.blackTextColor.withOpacity(0.7),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              Obx(()=>
                 Container(
                  height: Get.height * 0.05,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    //color: Colors.transparent,
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: themeProvider.darkTheme
                    //           ? AppColors.whiteColor.withOpacity(0.05)
                    //           : AppColors.greyTextColor.withOpacity(0.5),
                    //       blurRadius: 10,
                    //       spreadRadius: 0.5,
                    //       offset: const Offset(0, 0),
                    //     ),
                    //   ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            screenController.selectedOpenTime != null ? screenController.selectedOpenTime!.value : "No time selected!",
                            // textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(color: Colors.black)
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.timer_outlined,
                          color: Colors.black,
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
              )
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Close shop time",
                style: TextStyle(
                  color: AppColors.blackTextColor.withOpacity(0.7),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              Obx(()=>
                  Container(
                    height: Get.height * 0.05,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      //color: Colors.transparent,
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: themeProvider.darkTheme
                      //           ? AppColors.whiteColor.withOpacity(0.05)
                      //           : AppColors.greyTextColor.withOpacity(0.5),
                      //       blurRadius: 10,
                      //       spreadRadius: 0.5,
                      //       offset: const Offset(0, 0),
                      //     ),
                      //   ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                              screenController.selectedCloseTime != null ? screenController.selectedCloseTime!.value : "No time selected!",
                              // textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(color: Colors.black)),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.timer_outlined,
                            color: Colors.black,
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
              )
            ],
          ),
        ),
      ],
    );
  }


  Future<void> timePicker(BuildContext context) async {
    final TimeOfDay? result =
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (result != null) {
      //setState(() {
        screenController.selectedOpenTime!.value = result.format(context);
        log('Open time: ${screenController.selectedOpenTime!.value}');
     // });
    }
  }

  Future<void> closeTimePicker(BuildContext context) async {
    final TimeOfDay? result =
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
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
      onTap: ()async {
        if(screenController.formKey.currentState!.validate()){
          if(screenController.selectedOpenTime!.value.isEmpty){
            Fluttertoast.showToast(msg: 'Please shop select open time');
          } else if(screenController.selectedCloseTime!.value.isEmpty){
            Fluttertoast.showToast(msg: 'Please shop select close time');
          }else{
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
