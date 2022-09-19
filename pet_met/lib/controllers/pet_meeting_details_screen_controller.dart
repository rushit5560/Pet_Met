import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_order_screen_model/pet_add_order_model.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/models/get_pet_profile_model/pet_details_model.dart';
import 'package:pet_met/services/providers/dark_theme_provider.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/app_colors.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

class PetMeetingDetailsScreenController extends GetxController {
  String petId = Get.arguments[0];
  String petUserId = Get.arguments[1];
  String petUserCatId = Get.arguments[2];
  String petOwnerUserName = Get.arguments[3];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;



  ApiHeader apiHeader = ApiHeader();
  PetData getProfile = PetData();
  String meetingPetId = "";
  String image = "";
  String name = "";
  String petName = "";
  String mettingAvailability = "";
  String dob = "";
  String details = "";
  String phoneNo = "";

  late Razorpay razorpay;

  RxBool meetingStatus = false.obs;

  /// Get Pet Profile
  Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petProfileApi;
    log("All Pet Profile Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      Map<String, dynamic> bodyData = {
        "userid": UserDetails.selfId,
        "categoryID" : UserDetails.categoryId,
        "meettingpetuserid" : petUserId,
        "meettingpetusercategory" : petUserCatId,
        "id": petId
      };
      log("bodyData : $bodyData");

      http.Response response = await http.post(
          Uri.parse(url),
          headers: header,
          body: bodyData
      );
      log("Get Pet Profile Api response : ${response.body}");

      GetPetDetailsModel getPetProfileModel = GetPetDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetProfileModel.success.obs;

      if (isSuccessStatus.value) {

         getProfile = getPetProfileModel.date[0];
         meetingPetId = getPetProfileModel.date[0].id!;

         image = getPetProfileModel.date[0].image!;
         petName = getProfile.petName!;
         mettingAvailability = getProfile.meetingAvailability!;
         dob= getProfile.dob!;
         details = getProfile.details!;
         name = getPetProfileModel.user[0].name;
         phoneNo = getPetProfileModel.user[0].phone;
         log('Image: ${getProfile.image}');

         meetingStatus = getPetProfileModel.meettingstatus.obs;
      } else {
        log("Pet Profile Api Else");
      }

    } catch(e) {
      log("Pet Profile Api Error ::: $e");
    } finally {
      isLoading(false);
     // await getPetCategoryFunction();
    }
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': 200 * 100,
      'name':  petName,
      'description': details,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }





  Future<void> petAddOrderFunction(
      { String ? orderId,required String paymentId, String ? signature}) async {
    isLoading(true);
    String url = ApiUrl.petAddOrderApi;

    Map<String, dynamic> data = {
      "userid": UserDetails.selfId.toString(),
      "categoryID" : UserDetails.categoryId,
      "meettingpetuserid" : petUserId,
      "meettingpetusercategory": petUserCatId,
      "userpetid": "1",
      "meettingpetid": meetingPetId,
      "price": "200",
      "transition_orderid": orderId ?? "123",
      "transition_paymentId": paymentId,
      "signature": signature ?? "123"
    };

    log("Add Order Api Url : $url");
    //log("pet plan id : $petPlanId");
    log('Add Order body: $data');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Pet Add Orders Api Response : ${response.body}");
      PetAddOrderModel petAddOrderModel =
      PetAddOrderModel.fromJson(json.decode(response.body));
      isSuccessStatus = petAddOrderModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: petAddOrderModel.message);
        meetingStatus.value = true;
      } else {
        log("Pet Add Order Api Else Else");
      }
    } catch (e) {
      log("Pet Add Order Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfileFunction();

  }
}
