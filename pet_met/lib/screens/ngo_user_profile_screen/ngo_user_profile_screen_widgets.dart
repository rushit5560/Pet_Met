import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/ngo_user_profile_screen_controller.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/common_widgets/custom_light_textfield.dart';
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
              Image.file(
                themeProvider.darkTheme
                    ? screenController.imageFile! : screenController.imageFile!,height: 65,),

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
        screenController.ngoProfile != null ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                themeProvider.darkTheme
                    ? ApiUrl.apiImagePath + screenController.ngoProfile! : ApiUrl.apiImagePath + screenController.ngoProfile!,height: 65,),

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
                        color: AppColors.blackTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
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

class NameOfNgoListModule extends StatelessWidget {
  NameOfNgoListModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name of NGO/Vet picture:", style: TextStyle(color: Colors.black)),
        SizedBox(height: 8),
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
                          screenController.ngoPictureFile1 != null ?
                          Image.file(
                            screenController.ngoPictureFile1!,height: 65,) :
                          screenController.ngoImage1 != null ?
                          Image.network(
                            screenController.ngoImage1!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 1 ?
                          screenController.ngoPictureFile2 != null ?
                          Image.file(
                            screenController.ngoPictureFile2!,height: 65,) :
                          screenController.ngoImage2 != null ?
                          Image.network(
                            screenController.ngoImage2!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 2 ?
                          screenController.ngoPictureFile3 != null ?
                          Image.file(
                            screenController.ngoPictureFile3!,height: 65,) :
                          screenController.ngoImage3 != null ?
                          Image.network(
                            screenController.ngoImage3!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 3 ?
                          screenController.ngoPictureFile4 != null ?
                          Image.file(
                            screenController.ngoPictureFile4!,height: 65,) :
                          screenController.ngoImage4 != null ?
                          Image.network(
                            screenController.ngoImage4!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg):

                          index == 4 ?
                          screenController.ngoPictureFile5 != null ?
                          Image.file(
                            screenController.ngoPictureFile5!,height: 65,) :
                          screenController.ngoImage5 != null ?
                          Image.network(
                            screenController.ngoImage5!,height: 65,):
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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
        Text("Ngo Bank Name:", style: TextStyle(color: Colors.black)),
        SizedBox(height: 8),
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

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
          hintText: "Name",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ngo Bank Account Number",
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
          fieldController: screenController.accountNumberController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Ngo Bank Account Number",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validations().validateBankAccountNumber(val!),
        ),
      ],
    );
  }
}

class IfscCodeTextFieldModule extends StatelessWidget {
  IfscCodeTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<NgoUserProfileScreenController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "IFSC Code",
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
          fieldController: screenController.ifscCodeController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "**** ** ***",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validations().validateIfscCode(val!),
        ),
      ],
    );
  }
}

class NgoAddressTextFieldModule extends StatelessWidget {
  NgoAddressTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ngo Address",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ngo Contact",
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
          fieldController: screenController.contactController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Ngo Contact",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateMobile(val!),
        ),
      ],
    );
  }
}

class NgoDetailsTextFieldModule extends StatelessWidget {
  NgoDetailsTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ngo Details",
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
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateDetails(val!),
        ),
      ],
    );
  }
}


class InstagramTextFieldModule extends StatelessWidget {
  InstagramTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateInstagramLink(val!),
        ),
      ],
    );
  }
}

class FacebookLinkTextFieldModule extends StatelessWidget {
  FacebookLinkTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateFacebookLink(val!),
        ),
      ],
    );
  }
}

class IsActiveTextFieldModule extends StatelessWidget {
  IsActiveTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Active",
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
          fieldController: screenController.activeController,
          height: screenController.size.height * 0.05,
          width: double.infinity,
          hintText: "Active",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateActive(val!),
        ),
      ],
    );
  }
}


class OpenAndCloseShopTimeModule extends StatelessWidget {
  OpenAndCloseShopTimeModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

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
              Stack(
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
                    readOnly: false,
                    controller: screenController.openTimeController,
                    validator: (val) => Validations().validateOpenTime(val!),
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
              Stack(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<NgoUserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(screenController.formKey.currentState!.validate()){
          await screenController.updateVetAndNgoProfileFunction();
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
