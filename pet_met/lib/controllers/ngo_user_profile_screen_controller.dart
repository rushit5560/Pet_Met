import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';

class NgoUserProfileScreenController extends GetxController {
  final size = Get.size;
  XFile? imageFile = XFile("");
  RxString selectedGenderValue = "Male".obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final formKey = GlobalKey<FormState>();

  var accountNumberController = TextEditingController();
  var ifscCodeController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    //birthDate = day + "-" + month + "-" + year;
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
      log('isSuccessStatus: $isSuccessStatus');
      if (isSuccessStatus.value) {
        // nameController.text = allRoleProfileModel.data.profiledata[0].shopename;
        // contactNumber.text = allRoleProfileModel.data.profiledata[0].phonenumber.toString();
        // addressController.text = allRoleProfileModel.data.profiledata[0].address;
        // openTimeController.text = allRoleProfileModel.data.profiledata[0].shopopen;
        // closeTimeController.text = allRoleProfileModel.data.profiledata[0].shopclose;
        // //
        // log('Phone: ${contactNumber.text}');
        // accountNumberController.text = allRoleProfileModel.data.data.name;
        // ifscCodeController.text = allRoleProfileModel.data.profiledata.name;
        addressController.text = allRoleProfileModel.data.profiledata[0].address;
        contactController.text = allRoleProfileModel.data.profiledata[0].contact;

        log('Address: ${addressController.text}');
        log('Contact: ${contactController.text}');
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
    // TODO: implement onInit
    super.onInit();
    await getAllRoleProfileFunction();
  }
}
