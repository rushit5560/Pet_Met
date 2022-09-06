import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;

import '../models/change_password_screen_model/change_password_screen_model.dart';

class ChangePasswordScreenController extends GetxController{
  final size = Get.size;
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  Future<void> changePasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.changePasswordApi;
    log('Change Password Api Url : $url');

    Map<String, dynamic> data = {
      "oldpassword": currentPasswordController.text.trim(),
      "password": newPasswordController.text.trim(),
      "password_confirmation": confirmPasswordController.text.trim(),
      "userID": UserDetails.selfId
    };
    log("data : $data");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: header);
      log("Change Password Api Response : ${response.body}");

      ChangePasswordScreenModel changePasswordScreenModel = ChangePasswordScreenModel.fromJson(json.decode(response.body));
      isSuccessStatus = changePasswordScreenModel.success.obs;

      if (isSuccessStatus.value) {

        Fluttertoast.showToast(msg: changePasswordScreenModel.message);
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
      } else {
        Fluttertoast.showToast(msg: changePasswordScreenModel.message);
      }
    } catch(e) {
      log('Change Password Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }
}