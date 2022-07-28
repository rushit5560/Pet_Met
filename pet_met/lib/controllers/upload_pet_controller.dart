import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_category_model/get_all_category_model.dart';
import 'package:pet_met/models/get_all_sub_category_model/get_all_sub_category_model.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/models/update_pet_profile_model/update_pet_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../utils/app_colors.dart';

class UploadPetController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  var petNameController = TextEditingController();
  var weightController = TextEditingController();

  Datum getProfile = Datum();
  RxList<PetCategory> petCategoryList = [PetCategory(categoryName: 'Select Category')].obs;
  PetCategory petCategoryDropDownValue = PetCategory();

  RxList<PetSubCategory> petSubCategoryList = [PetSubCategory(categoryName: 'Select Sub Category')].obs;
  PetSubCategory petSubCategoryDropDownValue = PetSubCategory();

  RxString selectedPetGenderValue = "Male".obs;
  RxString selectedPetTypeValue = "Grown".obs;
  RxString selectedAvailabilityValue = "Yes".obs;

  XFile? imageFile = XFile("");

  List<DropdownMenuItem<String>> get dropdownPetGenderItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Male",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Male",
      ),
      DropdownMenuItem(
        child: Text(
          "Female",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Female",
      ),
      DropdownMenuItem(
        child: Text(
          "Other",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Other",
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownPetTypeItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Child",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Child",
      ),
      DropdownMenuItem(
        child: Text(
          "Adult",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Adult",
      ),
      DropdownMenuItem(
        child: Text(
          "Grown",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Grown",
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownAvailabilityItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          "Yes",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "Yes",
      ),
      DropdownMenuItem(
        child: Text(
          "No",
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: "No",
      ),
    ];
    return menuItems;
  }

  /// Get Pet Category
  Future<void> getPetCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCategoryApi;
    log("All Pet Category Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Pet Category Api response : ${response.body}");

      GetPetCategoryModel getPetCategoryModel =
      GetPetCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        log("Success");
        petCategoryList.addAll(getPetCategoryModel.data);
        petCategoryDropDownValue = petCategoryList[0];
        log('petCategoryList : ${petCategoryList.length}');
        isLoading(true);
        isLoading(false);
        //log('pet name: ${getProfile.petName}');
      } else {
        log("Pet Category Api Else");
      }

    } catch(e) {
      log("Pet Category Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get Area Using City Id
  getSubCategoryUsingCategoryId({required String categoryId}) async {
    isLoading(true);

    String url = ApiUrl.getAllSubCategoryApi;
    String finalUrl = url + categoryId;
    log('finalUrl : $finalUrl');

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try{
      http.Response response = await http.get(Uri.parse(finalUrl), headers: header);
      log('Sub Category response : ${response.body}');

      GetPetSubCategoryModel getPetSubCategoryModel = GetPetSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetSubCategoryModel.success.obs;

      if(isSuccessStatus.value) {
        petSubCategoryList.addAll(getPetSubCategoryModel.data);
        petSubCategoryDropDownValue = petSubCategoryList[0];
        log('petSubCategoryList : ${petSubCategoryList.length}');
      } else {
        log('getSubCategoryUsingCategoryId false false');
      }
    } catch(e) {
      log('getSubCategoryUsingCategoryId Error : $e');
    } finally{
      //isLoading(false);
      getProfileFunction();
    }
  }

  /// Get Pet Profile
  Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petProfileApi + "1";
    log("All Pet Profile Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Pet Profile Api response : ${response.body}");

      GetPetProfileModel getPetProfileModel =
      GetPetProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetProfileModel.success!.obs;

      if (isSuccessStatus.value) {
        // bannerList.clear();
        // petTopList.addAll(getPetTopListModel.data);
        // log("petList Length : ${petTopList.length}");
        getProfile = getPetProfileModel.data![0];
        log('pet name: ${getProfile.petName}');
      } else {
        log("Pet Profile Api Else");
      }

    } catch(e) {
      log("Pet Profile Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update Pet profile
  updatePetProfileFunction() async {
    isLoading(true);

    String url = ApiUrl.petUpdateProfileApi;
    log("Update Pet Profile url: $url");

    Map<String, String> header = apiHeader.apiHeader();
    log("header : $header");

    try {
      if (imageFile != null) {
        log("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(imageFile!.openRead());
        stream.cast();

        var length = await imageFile!.length();

        request.files.add(await http.MultipartFile.fromPath("image", imageFile!.path));
        request.headers.addAll(header);

        request.fields['pet_name'] = petNameController.text.trim();
        request.fields['main_category'] = "${petCategoryDropDownValue.categoryId}";
        request.fields['sub_category'] = "${petSubCategoryDropDownValue.categoryId}";
        request.fields['dob'] = "01/08/2021";
        request.fields['weight'] = weightController.text.trim();
        request.fields['details'] = "abc";
        request.fields['gender'] = "Male";
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['petid'] = "1";
        //request.fields['showimg'] = "jgjadg";

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        // var multiFile = await http.MultipartFile.fromPath(
        //  "image",
        //   file!.path,
        // );

        request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          UpdatePetProfileModel updatePetProfileModel =
          UpdatePetProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updatePetProfileModel.success}');
          isSuccessStatus = updatePetProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updatePetProfileModel.message);
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      } else {
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(header);

        request.fields['pet_name'] = petNameController.text.trim();
        request.fields['main_category'] = "${petCategoryDropDownValue.categoryId}";
        request.fields['sub_category'] = "${petSubCategoryDropDownValue.categoryId}";
        request.fields['dob'] = "01/08/2021";
        request.fields['weight'] = weightController.text.trim();
        request.fields['details'] = "abc";
        request.fields['gender'] = "Male";
        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['petid'] = "1";

        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );
        //
        // request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) async {
          UpdatePetProfileModel updatePetProfileModel =
          UpdatePetProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updatePetProfileModel.success}');
          isSuccessStatus = updatePetProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updatePetProfileModel.message);
            // log(updateUserProfileModel.dataVendor.userName);
            // log(updateUserProfileModel.dataVendor.email);
            // log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }



  @override
  void onInit() {
    super.onInit();
    getPetCategoryFunction();
    //getProfileFunction();
  }
}
