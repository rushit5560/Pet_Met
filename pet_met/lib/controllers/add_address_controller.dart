import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_address_screen_model/add_address_screen_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';



class AddAddressController extends GetxController {
  final size = Get.size;

  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  final formKey = GlobalKey<FormState>();

  ApiHeader apiHeader = ApiHeader();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  var drawerController = ZoomDrawerController();

  var addressController = TextEditingController();

  Future<void> addAddressFunction() async {
    isLoading(true);
    String url = ApiUrl.getAddAddressApi;
    log('Get Add Address Api Url : $url');

    Map<String, dynamic> data = {
      "userid": UserDetails.userId,
      "address": addressController.text.trim()
    };
    log("data : $data");

    try {

      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: header);
      log("Add Address Api Response : ${response.body}");

      AddAddressModel addAddressModel = AddAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus = addAddressModel.success.obs;

      if (isSuccessStatus.value) {
        addressController.clear();
        Get.back();
        Fluttertoast.showToast(msg: addAddressModel.message,fontSize: 12.sp);
      } else {
        Fluttertoast.showToast(msg: addAddressModel.message,fontSize: 12.sp);
      }
    } catch(e) {
      log('User Add Address Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  List<AddressModel> addressList = [
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
  ];

}

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
