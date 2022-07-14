import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/login_screen_model/login_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_preference.dart';
import '../utils/app_route_names.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  var mailController = TextEditingController();
  var passController = TextEditingController();
  var selectedPageIndex = 0.obs;

  UserPreference userPreference = UserPreference();

  final formKey = GlobalKey<FormState>();

  Future<void> submitLoginForm() async {
    if (formKey.currentState!.validate()) {
      try {
        await userLoginFunction();
      } catch (e) {
        throw e;
      }
    }
  }

  Future<void> userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('Login Api Url : $url');

    try {
      Map<String, dynamic> data = {
        "email": mailController.text.trim().toLowerCase(),
        "password": passController.text.trim()
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Login Api Response : ${response.body}");

      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      isSuccessStatus = loginModel.success.obs;

      if (isSuccessStatus.value) {
        // User Data Set in Prefs
        await userPreference.setUserDetails(
            userId: loginModel.data.id,
            userName: loginModel.data.name,
            userEmail: loginModel.data.email,
            userProfileImage: loginModel.data.image);
        // Going to Index Screen
        Get.toNamed(AppRouteNames.indexScreenRoute);
      } else {
        Fluttertoast.showToast(msg: loginModel.error);
      }
    } catch (e) {
      log('');
    } finally {
      isLoading(false);
    }
  }
}
