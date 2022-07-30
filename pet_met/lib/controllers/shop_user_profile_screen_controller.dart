import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class ShopUserProfileScreenController extends GetxController {
  final size = Get.size;
  XFile? imageFile = XFile("");
  RxString selectedGenderValue = "Male".obs;
  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var contactNumber = TextEditingController();
  var addressController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String birthDate = "";
  String month= "";
  String day = "";
  String year = "";

  //List<> shopOfferList = [];

  ApiHeader apiHeader = ApiHeader();

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

      GetShopProfileModel getShopProfileModel =
      GetShopProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getShopProfileModel.success.obs;

      if (isSuccessStatus.value) {
        nameController.text = getShopProfileModel.data.profiledata[0].shopename;
        contactNumber.text = getShopProfileModel.data.profiledata[0].phonenumber.toString();
        addressController.text = getShopProfileModel.data.profiledata[0].address;
        openTimeController.text = getShopProfileModel.data.profiledata[0].shopopen;
        closeTimeController.text = getShopProfileModel.data.profiledata[0].shopclose;

        //shopOfferList = getShopProfileModel.data.profiledata[0].offersimages;
        //
        log('Phone: ${contactNumber.text}');
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
