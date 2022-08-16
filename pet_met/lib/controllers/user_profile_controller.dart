import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/follow_user_model/follow_user_model.dart';
import 'package:pet_met/models/follow_user_model/get_follow_status_model.dart';
import 'package:pet_met/models/follow_user_model/unfollow_user_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/get_pet_profile_model/get_pet_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class UserProfileController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  String followUserId = Get.arguments[0];
  String followCategoryId = Get.arguments[1];
  String petId = Get.arguments[2];

  ApiHeader apiHeader = ApiHeader();

  List<Petdatum> petList = [];
  List<ShopPet> shopPetList = [];
  List<NgoPet> ngoPetList = [];
  List<TrainerPet> trainerPetList = [];

  List dogsTopList = [
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
    AppIcons.profilePetImg,
  ];

  String message = "";
 // int followUserId = 0;

  RxBool status = true.obs;

  String userprofile= "";
  String userName = "";

  String shopProfile= "";
  String shopName = "";

  String ngoProfile= "";
  String ngoName = "";

  String trainerProfile= "";
  String trainerName = "";

  late Razorpay _razorpay;

  //PetDatum getProfile = PetDatum();

  /// Get All Role Profile
  /*Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": "${UserDetails.userId}",
       // "uid": "${UserDetails.selfId}",
        "categoryID": "${UserDetails.categoryId}",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetPetListModel getPetListModel =
      GetPetListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetListModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getPetListModel.data.petdata);

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }*/

  /// Get User Profile
  Future<void> getUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": followUserId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": followCategoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetUserProfileModel getUserProfileModel =
      GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getUserProfileModel.data.petdata);

        userprofile = ApiUrl.apiImagePath + "asset/uploads/product/" + getUserProfileModel.data.data[0].image;
        userName = getUserProfileModel.data.data[0].name;
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }

  /// Get Shop Profile
  Future<void> getShopProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": followUserId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": followCategoryId,
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
        shopPetList.clear();
        shopPetList.addAll(getShopProfileModel.data.petdata);

        shopProfile = ApiUrl.apiImagePath + getShopProfileModel.data.data[0].showimg;
        shopName = getShopProfileModel.data.data[0].shopename;
        log('shopProfile: $shopProfile');

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }

  /// Get NGO Profile
  Future<void> getNgoProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": followUserId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": followCategoryId,
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
        ngoPetList.clear();
        ngoPetList.addAll(allRoleProfileModel.data.petdata);

        ngoProfile = ApiUrl.apiImagePath + allRoleProfileModel.data.data[0].image;
        ngoName = allRoleProfileModel.data.data[0].name;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }

  /// Get Trainer Profile
  Future<void> getTrainerProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": followUserId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": followCategoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetTrainersProfileModel getTrainersProfileModel =
      GetTrainersProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getTrainersProfileModel.success.obs;

      if (isSuccessStatus.value) {
        trainerPetList.clear();
        trainerPetList.addAll(getTrainersProfileModel.data.petdata);

        trainerProfile = ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image;
        trainerName = getTrainersProfileModel.data.data[0].name;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }

  /// Know Follow Status
  Future<void> followStatus() async {
    isLoading(true);
    String url = ApiUrl.followStatusApi;
    log("Follow Status Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "followuserid": "$followUserId",
        "categoryID": "$followCategoryId",
      };

      log("Follow Status Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, /*headers: header*/);
      log("Get Follow Status Api response : ${response.body}");

      GetFollowStatusModel getFollowStatusModel =
      GetFollowStatusModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFollowStatusModel.success.obs;
      status = getFollowStatusModel.success.obs;
      log('status: $status');
      if (isSuccessStatus.value) {

        message = getFollowStatusModel.message;
        //Fluttertoast.showToast(msg: getFollowStatusModel.message);
        //await followUserFunction();
      } else {
        log("Get All Follow Status Api Else");
        //await unfollowUserFunction();
      }

    } catch(e) {
      log("All Follow Status Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getProfileFunction();
    }
  }

  /// Get Pet Profile
  /*Future<void> getProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.petProfileApi + petId;
    log("All Pet Profile Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Get Pet Profile Api response : ${response.body}");

      GetPetProfileModel getPetProfileModel =
      GetPetProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPetProfileModel.success!.obs;

      if (isSuccessStatus.value) {

         getProfile = getPetProfileModel.data![0];
        // petNameController.text = getProfile.petName!;
        // petDetailsController.text = getProfile.details!;
        // // meetingAvailabilityValue.value = getProfile.meetingAvailability!;
        // //genderValue.value = getProfile.gender!;
        // weightController.text = getProfile.weight!.toString();
        // petCategoryDropDownValue.categoryName = getProfile.mainCategory.toString();
        // petSubCategoryDropDownValue.categoryName = getProfile.subCategory.toString();
        // birthDate = getProfile.dob!;
        // day = birthDate.substring(0, birthDate.length - 7);
        // log('day: $day');
        //
        // petImage = ApiUrl.apiImagePath + getProfile.image!;
        // log('pet name: ${petNameController.text}');
        // log('pet details: ${petDetailsController.text}');
        // log('genderValue: ${genderValue.value}');
        // log('weightController: ${weightController.text}');
        // log('petCategoryDropDownValue: ${petCategoryDropDownValue.categoryName}');
        // log('petSubCategoryDropDownValue: ${petSubCategoryDropDownValue.categoryName}');
        // log('birthDate: $birthDate');
        // log('petImage: $petImage');
      } else {
        log("Pet Profile Api Else");
      }

    } catch(e) {
      log("Pet Profile Api Error ::: $e");
    } finally {
      isLoading(false);
      // await getPetCategoryFunction();
    }
  }*/

  followUserFunction()async{
    isLoading(true);
    String url = ApiUrl.followUserApi;
    log("Follow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "followuserid": "$followUserId",
        "categoryID": "$followCategoryId",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, /*headers: header*/);
      log("Get Follow Status Api response : ${response.body}");

      FollowUserModel followUserModel =
      FollowUserModel.fromJson(json.decode(response.body));
      isSuccessStatus = followUserModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: followUserModel.message);
        await followStatus();
      } else {
        log("Follow User Api Else");
      }

    } catch(e) {
      log("Follow User Api Error ::: $e");
    } finally {
      isLoading(false);
      //await followStatus();
    }
  }

  unfollowUserFunction() async {
    isLoading(true);
    String url = ApiUrl.unfollowUserApi;
    log("Unfollow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "followuserid": "$followUserId",
        "categoryID": "$followCategoryId",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, /*headers: header*/);
      log("Un Follow Api response : ${response.body}");

      UnFollowUserModel unFollowUserModel =
      UnFollowUserModel.fromJson(json.decode(response.body));
      isSuccessStatus = unFollowUserModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: unFollowUserModel.message);
        await followStatus();
      } else {
        log("Un Follow User Api Else");
      }

    } catch(e) {
      log("Un Follow User Api Error ::: $e");
    } finally {
      isLoading(false);
      //await followStatus();
    }
  }

  /*void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': 200 * 100,
      'name': getProfile.petName,
      'description': getProfile.details,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }*/

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    log('Success Response: ${response.orderId}');
    /*await addOrderFunction(
        orderId: response.orderId,
        paymentId: response.paymentId!,
        signature: response.signature
    );*/

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.message.toString());
    log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  @override
  void onInit() async{
    super.onInit();
    //getAllRoleProfileFunction();
    if(followCategoryId == "1"){
      await getUserProfileFunction();
    } else if(followCategoryId == "2"){
      await getShopProfileFunction();
    } else if(followCategoryId == "3"){
      await getNgoProfileFunction();
    } else if(followCategoryId == "4"){
      await getTrainerProfileFunction();
    }
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
}
