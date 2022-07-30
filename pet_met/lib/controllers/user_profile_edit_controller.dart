import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
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
  var mobileController = TextEditingController();
  var locationController = TextEditingController();

  XFile? imageFile = XFile("");
  String userProfile= "";

  RxString selectedGenderValue = "Male".obs;

  List<DropdownMenuItem<String>> get dropdownGenderItems {
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

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    birthDate = day + "-" + month + "-" + year;
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
        "uid": "${UserDetails.selfId}",
        "categoryid": "${UserDetails.categoryId}",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      AllRoleProfileModel allRoleProfileModel =
      AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;

      if (isSuccessStatus.value) {
        // petList.clear();
        // petList.addAll(allRoleProfileModel.data.petdata);
        // log("petList Length : ${petList.length}");
        userProfile = allRoleProfileModel.data.data.image;
         nameController.text = allRoleProfileModel.data.data.name;
         mobileController.text = allRoleProfileModel.data.data.phone;
        //locationController.text = allRoleProfileModel.data.data.;
        //selectedGenderValue.value = allRoleProfileModel.data.data.gender;
         birthDate = allRoleProfileModel.data.data.bod;
        log('name: ${nameController.text}');
        log('mobile: ${mobileController.text}');

      } else {
        log("Get All Role Profile Api Else");
      }

    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async{
    super.onInit();
    await getAllRoleProfileFunction();
  }
}
