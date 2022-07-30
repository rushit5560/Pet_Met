import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/register_screen_model/register_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  RxBool isPasswordVisible = true.obs;

  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool selectedTerms = false.obs;
  UserDetails userDetails = UserDetails();
  UserPreference userPreference = UserPreference();

  final formKey = GlobalKey<FormState>();

  /// Form Submit Validator
  submitRegisterForm() async {
    if (formKey.currentState!.validate()) {
      if (selectedTerms.value == false) {
        Fluttertoast.showToast(msg: "Please agree with terms and condition");
      } else {
        try {
          await userRegisterFunction();
          // ScaffoldMessenger.of(Get.context!).showSnackBar(
          //   SnackBar(
          //     content: Text("Form Submitted"),
          //     duration: Duration(seconds: 3),
          //   ),
          // );
        } catch (e) {
          throw e;
        }
      }
    }
  }

  /// User Registration
  Future<void> userRegisterFunction() async {
    isLoading(true);
    String url = ApiUrl.registerApi;
    log("Register Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "email": mailController.text.trim().toLowerCase(),
        "password": passController.text.trim(),
        "c_password": passController.text.trim(),
        "categoryID": "${UserDetails.roleId}",
        "name": nameController.text.trim()
      };
      log("Body Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : ${response.body}");

      RegisterModel registerModel =
          RegisterModel.fromJson(json.decode(response.body));
      isSuccessStatus = registerModel.success!.obs;

      // RegisterErrorModel registerErrorModel =
      //     RegisterErrorModel.fromJson(json.decode(response.body));

      if (isSuccessStatus.value) {
        log("isSuccessStatus : ${isSuccessStatus.value}");
        Fluttertoast.showToast(msg: registerModel.messege!);

        // User Data Set in Prefs
        /*await userPreference.setUserDetails(
            userId: registerModel.data[0].id,
            userName: registerModel.data[0].name,
            userEmail: registerModel.data[0].email,
            userProfileImage: registerModel.data[0].image,
          token: registerModel.data[0].rememberToken,
        );*/

        // Going to Login Screen
        // Get.offAndToNamed(AppRouteNames.loginRoute);
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "The email has already been taken");
      }
    } catch (e) {
      log("User Registration Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
}
