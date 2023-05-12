import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';



class ForgotPasswordController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  var drawerController = ZoomDrawerController();


  Future<void> forgotPasswordFunction() async {
    isLoading(true);
    String url =ApiUrl.forgotPasswordApi;
    log("Forgot password api url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "email" : emailController.text.trim().toLowerCase()
      };
      http.Response response = await http.post(Uri.parse(url), body: bodyData);
      log("Forgot password Response : ${response.body}");


      if(response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Please check your mail!",fontSize: 12.sp);
      } else {
        Fluttertoast.showToast(msg: "Please try again!",fontSize: 12.sp);
      }

    } catch(e) {
      log("forgotPasswordFunction Error ::: $e");
    }

    isLoading(false);
  }


  /*List<AddressModel> addressList = [
    AddressModel(
      title: "Honduras",
      address: "1691 Vetug Boulevard",
      isChecked: true,
    ),
    AddressModel(
      title: "Mavlohige",
      address: "272 Wecdo Heights",
      isChecked: false,
    ),
  ];*/


}

/*
class AddressModel {
  final String? title;
  final String? address;
  final bool? isChecked;

  AddressModel({
    this.title,
    this.address,
    this.isChecked,
  });

  // NOTE: implementing functionality here in the next step!
}
*/
