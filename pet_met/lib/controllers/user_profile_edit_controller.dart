import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/user_update_profile_model/user_update_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class UserProfileEditController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final formKey = GlobalKey<FormState>();
  ApiHeader apiHeader = ApiHeader();

  String birthDate = "";
  String month= "";
  String day = "";
  String year = "";

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var locationController = TextEditingController();

  File? imageFile;
  String userProfile= "";

  RxString selectedGenderValue = "Male".obs;

  /*List<DropdownMenuItem<String>> get dropdownGenderItems {
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
  }*/

  /// Get User Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All User Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
       // "uid": "${UserDetails.selfId}",
        "categoryID": "${UserDetails.categoryId}",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, /*headers: header*/);
      log("Get All User Profile Api response : ${response.body}");

      GetUserProfileModel getUserProfileModel =
      GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.success.obs;

      if (isSuccessStatus.value) {
        // petList.clear();
        // petList.addAll(allRoleProfileModel.data.petdata);
        // log("petList Length : ${petList.length}");
        userProfile = ApiUrl.apiImagePath + "asset/uploads/product/" + getUserProfileModel.data.data[0].image;
         nameController.text = getUserProfileModel.data.data[0].name;
         mobileController.text = getUserProfileModel.data.data[0].phone;
        emailController.text = getUserProfileModel.data.data[0].email;
        //locationController.text = allRoleProfileModel.data.data.;
        //selectedGenderValue.value = allRoleProfileModel.data.data.gender;
         birthDate = getUserProfileModel.data.data[0].bod;
        log('name: ${nameController.text}');
        log('mobile: ${mobileController.text}');

      } else {
        log("Get All User Profile Api Else");
      }

    } catch(e) {
      log("Get USer Profile Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update User profile
  updateUserProfileFunction() async {
    isLoading(true);

    birthDate = day + "-" + month + "-" + year;
    log('birthDate: $birthDate');

    String url = ApiUrl.userUpdateProfileApi;
    log("Update User Profile url: $url");

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
        //request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['bod'] = birthDate;
        request.fields['phone'] = mobileController.text.trim();
        request.fields['gender'] = selectedGenderValue.value;

        // request.fields['name'] = "demo1";
        // request.fields['bod'] = "10-9-2014";
        // request.fields['phone'] = "1234567890";
        // request.fields['gender'] = "female";

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
          log('value: $value');
          UpdateUserProfileModel updateUserProfileModel =
          UpdateUserProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateUserProfileModel.success}');
          isSuccessStatus = updateUserProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateUserProfileModel.message);
            await getAllRoleProfileFunction();
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

        //request.headers.addAll(header);

        request.fields['name'] = nameController.text.trim();
        request.fields['bod'] = birthDate;
        request.fields['phone'] = mobileController.text.trim();
        request.fields['gender'] = selectedGenderValue.value;
        //request.fields['showimg'] = "jgjadg";

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
          UpdateUserProfileModel updateUserProfileModel =
          UpdateUserProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateUserProfileModel.success}');
          isSuccessStatus = updateUserProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateUserProfileModel.message);
            await getAllRoleProfileFunction();
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

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() async{
    super.onInit();
    await getAllRoleProfileFunction();
  }
}
