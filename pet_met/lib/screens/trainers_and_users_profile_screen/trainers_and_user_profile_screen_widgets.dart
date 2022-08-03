import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/shop_user_profile_screen_controller.dart';
import 'package:pet_met/controllers/trainers_and_users_screen_controller.dart';
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
        screenController.trainersProfile != null ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                themeProvider.darkTheme
                    ? ApiUrl.apiImagePath + screenController.trainersProfile! : ApiUrl.apiImagePath + screenController.trainersProfile!,
                height: 65),

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

class TrainersAchievmentPictureListModule extends StatelessWidget {
  TrainersAchievmentPictureListModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name of Trainers Achievment Picture:", style: TextStyle(color: Colors.black),),
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
                          screenController.trainerPictureFile1 != null ?
                          Image.file(
                            screenController.trainerPictureFile1!,height: 65,) :
                          screenController.trainerImage1 != null ?
                          Image.network(
                            screenController.trainerImage1!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 1 ?
                          screenController.trainerPictureFile2!= null ?
                          Image.file(
                            screenController.trainerPictureFile2!,height: 65,) :
                          screenController.trainerImage2 != null ?
                          Image.network(
                            screenController.trainerImage2!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 2 ?
                          screenController.trainerPictureFile3 != null ?
                          Image.file(
                            screenController.trainerPictureFile3!,height: 65,) :
                          screenController.trainerImage3 != null ?
                          Image.network(
                            screenController.trainerImage3!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg) :

                          index == 3 ?
                          screenController.trainerPictureFile4 != null ?
                          Image.file(
                            screenController.trainerPictureFile4!,height: 65,) :
                          screenController.trainerImage4 != null ?
                          Image.network(
                            screenController.trainerImage4!,height: 65,):
                          Image.asset(AppImages.petMetLogoImg):

                          index == 4 ?
                          screenController.trainerPictureFile5 != null ?
                          Image.file(
                            screenController.trainerPictureFile5!,height: 65,) :
                          screenController.trainerImage5 != null ?
                          Image.network(
                            screenController.trainerImage5!,height: 65,):
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
      screenController.trainerPictureFile1 = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.trainerPictureFile1}');
      log('Camera Image Path : ${screenController.trainerPictureFile1!.path}');
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
    } else {
    }

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
          hintText: "Trainers Name",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}

class TrainersContactNumberTextField extends StatelessWidget {
  TrainersContactNumberTextField({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Trainers Contact",
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
          hintText: "Trainers Contact",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateMobile(val!),
        ),
      ],
    );
  }
}

class TrainersAddressTextFieldModule extends StatelessWidget {
  TrainersAddressTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Trainers Address",
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trainers Details",
          style: TextStyle(
            color: AppColors.blackTextColor.withOpacity(0.7),
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
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

class IsActiveTextFieldModule extends StatelessWidget {
  IsActiveTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

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

  final screenController = Get.find<TrainersAndUsersScreenController>();

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
              CustomLightTextField(
                readOnly: false,
                fieldController: screenController.openTimeController,
                height: screenController.size.height * 0.05,
                width: double.infinity,
                hintText: "Open",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                validator: (val) => Validations().validateOpenTime(val!),
              ),
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
              CustomLightTextField(
                readOnly: false,
                fieldController: screenController.closeTimeController,
                height: screenController.size.height * 0.05,
                width: double.infinity,
                hintText: "Close",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                validator: (val) => Validations().validateCloseTime(val!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);

  final screenController = Get.find<TrainersAndUsersScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(screenController.formKey.currentState!.validate()){
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
