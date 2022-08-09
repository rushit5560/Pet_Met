import 'dart:developer';
import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/controllers/upload_pet_controller.dart';
import 'package:pet_met/models/get_all_category_model/get_all_category_model.dart';
import 'package:pet_met/models/get_all_sub_category_model/get_all_sub_category_model.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_images.dart';
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

class UploadImageModule extends StatefulWidget {
  UploadImageModule({Key? key}) : super(key: key);

  @override
  State<UploadImageModule> createState() => _UploadImageModuleState();
}

class _UploadImageModuleState extends State<UploadImageModule> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          constraints: null,
          builder: (BuildContext context) {
            return Container(
              height: controller.size.height * 0.15,
              child: Column(
                children: [
                  ListTile(
                    onTap: getFromCamera,
                    contentPadding:
                        EdgeInsets.only(left: controller.size.width * 0.1),
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
                        EdgeInsets.only(left: controller.size.width * 0.1),
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
      },
      child: Container(
        height: controller.size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.darkTheme
              ? AppColors.darkThemeColor
              : AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          // image: DecorationImage(
          //   image: FileImage(
          //     File(controller.imageFile!.path),
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
        child: controller.imageFile != null
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.file(
                themeProvider.darkTheme
                    ? controller.imageFile! : controller.imageFile!,height: 65,),

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
        controller.petImage != null ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                themeProvider.darkTheme
                    ? controller.petImage! : controller.petImage!,height: 65,),

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
              )
      ),
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
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      log('Camera File Path : ${controller.imageFile}');
      log('Camera Image Path : ${controller.imageFile!.path}');


      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {


    }

    controller.imageFile = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
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
      controller.imageFile = File(pickedFile.path);
      controller.loadUI();
      log('Camera File Path : ${controller.imageFile}');
      log('Camera Image Path : ${controller.imageFile!.path}');


      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {


    }

    controller.imageFile = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
  }
}

/*class TextFieldSection extends StatelessWidget {
  //TextFieldSection({Key? key}) : super(key: key);

  String? fieldName;
  String? fieldHinttext;
  TextEditingController ? textEditingController;
  TextFieldSection({this.fieldName, this.fieldHinttext});

  final controller = Get.find<UploadPetController>();

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
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          fieldController: textEditingController,
          height: controller.size.height * 0.05,
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

class PetNameTextFieldModule extends StatelessWidget {
  PetNameTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Pet Name",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: controller.petNameController,
          height: controller.size.height * 0.065,
          width: double.infinity,
          hintText: "Pet Name",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateName(val!),
        ),
      ],
    );
  }
}


/*class TypesOfPetDropDownModule extends StatefulWidget {
  const TypesOfPetDropDownModule({Key? key}) : super(key: key);

  @override
  State<TypesOfPetDropDownModule> createState() =>
      _TypesOfPetDropDownModuleState();
}*/

class TypesOfPetDropDownModule extends StatelessWidget {
  final controller = Get.find<UploadPetController>();

  TypesOfPetDropDownModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Pet Category",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        /*Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
              ),
              value: controller.selectedPetTypeValue.value,
              isDense: true,
              isExpanded: true,
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              items: controller.dropdownPetTypeItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedPetTypeValue.value = val!;
                });
              },
            ),
          ),
        ),*/
        Stack(
          children: [
            Container(
              height: controller.size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.darkTheme
                      ? AppColors.darkThemeBoxColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor.withOpacity(0.3),
                      blurRadius: 35,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ]
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
                    child: DropdownButton<PetCategory>(
                      value: controller.petCategoryDropDownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: controller.petCategoryList
                          .map<DropdownMenuItem<PetCategory>>((PetCategory value) {
                        return DropdownMenuItem<PetCategory>(
                          value: value,
                          child: Text(
                            value.categoryName!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) async {
                        // controller.petCategoryDropDownValue = value!;
                        // controller.loadUI();

                        controller.isLoading(true);
                        controller.petCategoryDropDownValue = value!;
                         controller.petSubCategoryList.clear();
                        controller.petSubCategoryList.add(PetSubCategory(categoryName: 'Select Sub Category'));
                        await controller.getSubCategoryUsingCategoryId(categoryId: "${controller.petCategoryDropDownValue.categoryId}");
                         log("petCategoryDropDownValue : ${controller.petCategoryDropDownValue}");
                        controller.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PetSubCategoryDropDownModule extends StatelessWidget {
  PetSubCategoryDropDownModule({Key? key}) : super(key: key);

  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Pet Sub Category",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        /*Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
              ),
              value: controller.selectedPetTypeValue.value,
              isDense: true,
              isExpanded: true,
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              items: controller.dropdownPetTypeItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedPetTypeValue.value = val!;
                });
              },
            ),
          ),
        ),*/
        Stack(
          children: [
            Container(
              height: controller.size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.darkTheme
                      ? AppColors.darkThemeBoxColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor.withOpacity(0.3),
                      blurRadius: 35,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ]
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
                    child: DropdownButton<PetSubCategory>(
                      value: controller.petSubCategoryDropDownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: controller.petSubCategoryList
                          .map<DropdownMenuItem<PetSubCategory>>((PetSubCategory value) {
                        return DropdownMenuItem<PetSubCategory>(
                          value: value,
                          child: Text(
                            value.categoryName!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) {
                        // controller.petCategoryDropDownValue = value!;
                        // controller.loadUI();

                        controller.isLoading(true);
                        controller.petSubCategoryDropDownValue = value!;
                        // controller.areaList.clear();
                        // authScreenController.areaList.add(GetAreaList(areaName: 'Select Area'));

                        // print("cityDropDownValue : ${authScreenController.cityDropDownValue}");
                        controller.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PetDetailsTextFieldModule extends StatelessWidget {
  PetDetailsTextFieldModule({Key? key}) : super(key: key);
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Pet Details",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: controller.petDetailsController,
          height: controller.size.height * 0.065,
          width: double.infinity,
          hintText: "Pet Details",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          validator: (val) => Validations().validateDetails(val!),
        ),
      ],
    );
  }
}



class MeetingAvailabilityDropDown extends StatefulWidget {
  const MeetingAvailabilityDropDown({Key? key}) : super(key: key);

  @override
  State<MeetingAvailabilityDropDown> createState() =>
      _MeetingAvailabilityDropDownState();
}

class _MeetingAvailabilityDropDownState
    extends State<MeetingAvailabilityDropDown> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Meeting Availability",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        /*Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.greyTextColor,
              ),
              value: controller.selectedAvailabilityValue.value,
              isDense: true,
              isExpanded: true,
              items: controller.dropdownAvailabilityItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              dropdownColor: themeProvider.darkTheme
                  ? AppColors.darkThemeBoxColor
                  : AppColors.whiteColor,
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedAvailabilityValue.value = val!;
                });
              },
            ),
          ),
        ),*/
        Stack(
          children: [
            Container(
              height: controller.size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.darkTheme
                      ? AppColors.darkThemeBoxColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor.withOpacity(0.3),
                      blurRadius: 35,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ]
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
                      value: controller.meetingAvailabilityValue.value,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: <String>[
                        'Yes',
                        'No'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) {
                        // controller.petCategoryDropDownValue = value!;
                        // controller.loadUI();

                        controller.isLoading(true);
                        controller.meetingAvailabilityValue.value = value!;
                        // controller.areaList.clear();
                        // authScreenController.areaList.add(GetAreaList(areaName: 'Select Area'));

                        // print("cityDropDownValue : ${authScreenController.cityDropDownValue}");
                        controller.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class BirthDateDropDown extends StatefulWidget {
  const BirthDateDropDown({Key? key}) : super(key: key);

  @override
  State<BirthDateDropDown> createState() => _BirthDateDropDownState();
}

class _BirthDateDropDownState extends State<BirthDateDropDown> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Birthdate",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: controller.size.height * 0.08,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: themeProvider.darkTheme
                ? AppColors.darkThemeColor
                : AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyTextColor.withOpacity(0.3),
                blurRadius: 35,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: DropdownDatePicker(
            boxDecoration: BoxDecoration(
              // border: Border.,
              borderRadius: BorderRadius.circular(5),
            ), // optional
            dayFlex: 2,
            monthFlex: 3,
            yearFlex: 2,
            textStyle: TextStyle(
              color: AppColors.blackTextColor.withOpacity(0.6),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.greyTextColor,
            ),
            isDropdownHideUnderline: true, // optional
            isFormValidator: true, // optional
            // startYear: 1900, // optional
            // endYear: 2020, // optional
            // width: 10,

            // selectedDay: DateTime.now(), // optional
            // selectedMonth: 10, // optional
            // selectedYear: 1993, // optional
            onChangedDay: (value){
              controller.day = value!;
              log('onChangedDay: ${controller.day}');
            },
            onChangedMonth: (value) {
              controller.month = value!;
              log('onChangedMonth: ${controller.month}');
            },
            onChangedYear: (value) {
              controller.year = value!;
              log('onChangedYear: ${controller.year}');
            },
            // showDay: false,// optional
            // dayFlex: 2,// optional
            // locale: "zh_CN",// optional
          ),
        ),
      ],
    );
  }
}

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({Key? key}) : super(key: key);

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Gender",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        /*Container(
          height: controller.size.height * 0.06,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: themeProvider.darkTheme
                  ? AppColors.darkThemeColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyTextColor.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: Center(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.greyTextColor,
              ),
              value: controller.selectedPetGenderValue.value,
              isDense: true,
              isExpanded: true,
              items: controller.dropdownPetGenderItems,
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.darkThemeColor
                    : AppColors.whiteColor,
                fontSize: 15.sp,
              ),
              onChanged: (val) {
                setState(() {
                  controller.selectedPetGenderValue.value = val!;
                });
              },
            ),
          ),
        ),*/
        Stack(
          children: [
            Container(
              height: controller.size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.darkTheme
                      ? AppColors.darkThemeBoxColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor.withOpacity(0.3),
                      blurRadius: 35,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ]
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
                      value: controller.genderValue.value,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                      ),
                      items: <String>[
                        'Male',
                        'Female',
                        'Other',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      // isDense: true,
                      // isExpanded: true,
                      dropdownColor: themeProvider.darkTheme
                          ? AppColors.darkThemeBoxColor
                          : AppColors.whiteColor,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackTextColor.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                      onChanged: (value) {
                        // controller.petCategoryDropDownValue = value!;
                        // controller.loadUI();

                        controller.isLoading(true);
                        controller.genderValue.value = value!;
                        // controller.areaList.clear();
                        // authScreenController.areaList.add(GetAreaList(areaName: 'Select Area'));

                        // print("cityDropDownValue : ${authScreenController.cityDropDownValue}");
                        controller.isLoading(false);
                      },

                    ),

                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class WeightTextFieldModule extends StatelessWidget {
  WeightTextFieldModule({Key? key}) : super(key: key);

  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Weight",
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.blackTextColor.withOpacity(0.7),
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomLightTextField(
          readOnly: false,
          fieldController: controller.weightController,
          height: controller.size.height * 0.065,
          width: double.infinity,
          hintText: "Weight",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.number,
          validator: (val) => Validations().validateWeight(val!),
        ),
      ],
    );
  }
}


class PetSubmitButton extends StatelessWidget {
  PetSubmitButton({Key? key}) : super(key: key);

  final controller = Get.find<UploadPetController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(controller.updatePetFormKey.currentState!.validate()){
          if(controller.petCategoryDropDownValue.categoryId == 0){
            Fluttertoast.showToast(msg: 'Please select category');
          } else if(controller.petSubCategoryDropDownValue.categoryId == 0){
            Fluttertoast.showToast(msg: 'Please select sub category');
          }
          else if(controller.meetingAvailabilityValue.isEmpty){
            Fluttertoast.showToast(msg: 'Please select meeting availability');
          }
          else if(controller.genderValue.isEmpty){
            Fluttertoast.showToast(msg: 'Please select gender');
          }//else if(controller.petOption == PetOption.addOption){
            else if(controller.imageFile == null){
              Fluttertoast.showToast(msg: 'Please select image');
            }
         // }
          else if(controller.petOption == PetOption.addOption) {
            // Here Add Pet Api Call
            await controller.addPetProfileFunction();
          } else /*if(controller.petOption == PetOption.updateOption)*/ {
            // Update Pet API Call
            await controller.updatePetProfileFunction();
          }
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
            controller.petOption == PetOption.addOption ? "Submit" : "Update",
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
