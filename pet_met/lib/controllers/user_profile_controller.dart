import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_order_screen_model/pet_add_order_model.dart';
import 'package:pet_met/models/follow_user_model/follow_user_model.dart';
import 'package:pet_met/models/follow_user_model/get_follow_status_model.dart';
import 'package:pet_met/models/follow_user_model/unfollow_user_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/models/user_profile_screen_model/pet_shop_profile_model.dart';
import 'package:pet_met/models/user_profile_screen_model/pet_user_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/razorpay_key.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';



class UserProfileController extends GetxController {
  String followUserId = Get.arguments[0];
  String followCategoryId = Get.arguments[1];
  String petId = Get.arguments[2];

  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<Petdatum1> petList = [];
  List<ShopPetdatum> shopPetList = [];
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

  String userprofile = "";
  String userName = "";
  String userMobileNumber = "";
  String userDescription = "";
  String userId = "";
  String userEmail = "";
  String followUserUserId = "";

  String shopProfile = "";
  String shopName = "";
  String shopDescription = "";
  String shopMobileNumber = "";
  String shopFacebookLink = "";
  String shopInstaLink = "";
  String shopId = "";
  String followShopUserId = "";

  String ngoProfile = "";
  String ngoName = "";
  String ngoDescription = "";

  String trainerProfile = "";
  String trainerName = "";
  String trainerDescription = "";

  RxBool meetingStatus = false.obs;
  RxBool shopMeetingStatus = false.obs;

  String userCategoryId = "";

  String chatUid = "";
  String chatCategoryId = "";

  late Razorpay _razorpay;

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
    String url = ApiUrl.allPetUserProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": UserDetails.selfId,
        "categoryID": UserDetails.categoryId,
        "meettingpetuserid": followUserId,
        "meettingpetusercategory": followCategoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      PetUserProfileModel getUserProfileModel =
          PetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(getUserProfileModel.data.petdata);

        meetingStatus = getUserProfileModel.data.meettingstatus.obs;
        userCategoryId = getUserProfileModel.data.data[0].categoryId.toString();
        userprofile = "${ApiUrl.apiImagePath}asset/uploads/product/${getUserProfileModel.data.data[0].image}";
        userName = getUserProfileModel.data.data[0].name;
        userEmail = getUserProfileModel.data.data[0].email;
        userMobileNumber = getUserProfileModel.data.data[0].phone;
        userDescription = getUserProfileModel.data.data[0].fullText;

        chatUid = getUserProfileModel.data.data[0].uid.toString();
        chatCategoryId = getUserProfileModel.data.data[0].categoryId.toString();

        log('userDescription: $userDescription');

        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
      rethrow;
    } finally {
      //isLoading(false);
      await followStatus();
    }
  }

  /// Get Shop Profile
  Future<void> getShopProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allPetUserProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": UserDetails.selfId,
        "categoryID": UserDetails.categoryId,
        "meettingpetuserid": followUserId,
        "meettingpetusercategory": followCategoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      // PetUserProfileModel getUserProfileModel =
      // PetUserProfileModel.fromJson(json.decode(response.body));
      PetShopProfileModel petShopProfileModel =
          PetShopProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = petShopProfileModel.success.obs;

      if (isSuccessStatus.value) {
        shopPetList.clear();
        shopPetList.addAll(petShopProfileModel.data.petdata);
        shopMeetingStatus = petShopProfileModel.data.meettingstatus.obs;
        userCategoryId = petShopProfileModel.data.data[0].categoryId.toString();
        shopProfile =
            ApiUrl.apiImagePath + petShopProfileModel.data.data[0].showimg;
        shopName = petShopProfileModel.data.data[0].shopename;

        userEmail = petShopProfileModel.data.data[0].email;
        userName = petShopProfileModel.data.data[0].shopename;

        shopDescription = petShopProfileModel.data.data[0].fullText;
        shopMobileNumber = petShopProfileModel.data.data[0].phonenumber;
        shopFacebookLink = petShopProfileModel.data.data[0].facebook;
        shopInstaLink = petShopProfileModel.data.data[0].instagram;
        shopId = petShopProfileModel.data.data[0].id.toString();
        followShopUserId = petShopProfileModel.data.data[0].userid.toString();

        chatUid = petShopProfileModel.data.data[0].uid.toString();
        chatCategoryId = petShopProfileModel.data.data[0].categoryId.toString();
        log("petList Length : ${petList.length}");
        log('shopDescription: $shopDescription');
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
      log("All Role Profile Api Error ::: $e");
      rethrow;
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

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      AllRoleProfileModel allRoleProfileModel =
          AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;

      if (isSuccessStatus.value) {
        ngoPetList.clear();
        ngoPetList.addAll(allRoleProfileModel.data.petdata);

        ngoProfile =
            ApiUrl.apiImagePath + allRoleProfileModel.data.data[0].image;
        ngoName = allRoleProfileModel.data.data[0].name;
        ngoDescription = allRoleProfileModel.data.data[0].fullText;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
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

      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Get All Role Profile Api response : ${response.body}");

      GetTrainersProfileModel getTrainersProfileModel =
          GetTrainersProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getTrainersProfileModel.success.obs;

      if (isSuccessStatus.value) {
        trainerPetList.clear();
        trainerPetList.addAll(getTrainersProfileModel.data.petdata);

        trainerProfile =
            ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image;
        trainerName = getTrainersProfileModel.data.data[0].name;
        trainerDescription = getTrainersProfileModel.data.data[0].fullText;

        //profileImage = getPetListModel.data.
        // for(int i= 0; i < getPetListModel.data.petdata.length ; i++){
        //   followUserId = getPetListModel.data.petdata[i].id;
        //   log('followUserId: $followUserId');
        // }
        log("petList Length : ${petList.length}");
      } else {
        log("Get All Role Profile Api Else");
      }
    } catch (e) {
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
        "userid": "${UserDetails.selfId}",
        "followuserid": "$followUserId",
        "categoryID": "$followCategoryId",
      };

      log("Follow Status Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data, /*headers: header*/
      );
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
    } catch (e) {
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

  Future followUserFunction() async {
    isLoading(true);
    String url = ApiUrl.followUserApi;
    log("Follow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.selfId}",
        "followuserid": "$followUserId",
        "categoryID": "$followCategoryId",
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data, /*headers: header*/
      );
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
    } catch (e) {
      log("Follow User Api Error ::: $e");
    } finally {
      isLoading(false);
      //await followStatus();
    }
  }

  Future unfollowUserFunction() async {
    isLoading(true);
    String url = ApiUrl.unfollowUserApi;
    log("Unfollow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": UserDetails.selfId,
        "followuserid": followUserId,
        "categoryID": followCategoryId,
      };

      log("Body Data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(
        Uri.parse(url),
        body: data, /*headers: header*/
      );
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
    } catch (e) {
      log("Un Follow User Api Error ::: $e");
    } finally {
      isLoading(false);
      //await followStatus();
    }
  }

  void openCheckout() async {
    var options = {
      'key': RazorpayKey.razorpayKey,
      'amount': 200 * 100,
      'name': followCategoryId == "1"
          ? userName
          : followCategoryId == "2"
              ? shopName
              : followCategoryId == "3"
                  ? ngoName
                  : followCategoryId == "4"
                      ? trainerName
                      : "",
      'description': followCategoryId == "1"
          ? ""
          : followCategoryId == "2"
              ? shopDescription
              : followCategoryId == "3"
                  ? ngoDescription
                  : followCategoryId == "4"
                      ? trainerDescription
                      : "",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': UserDetails.userName,
        'email': UserDetails.userEmail,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: ${response.orderId}');
    await petAddOrderFunction(
        orderId: response.orderId,
        paymentId: response.paymentId!,
        signature: response.signature);
    Fluttertoast.showToast(
        msg: "Payment Successful", toastLength: Toast.LENGTH_SHORT);
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(msg: 'Payment processing cancelled by user');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
    log(response.message.toString());
    log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}"
        ,fontSize: 12.sp,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  Future<void> petAddOrderFunction(
      {String? orderId, required String paymentId, String? signature}) async {
    isLoading(true);
    String url = ApiUrl.petAddOrderApi;

    Map<String, dynamic> data = {
      "userid": UserDetails.selfId.toString(),
      "categoryID": UserDetails.categoryId,
      "meettingpetuserid": followUserId,
      "meettingpetusercategory": followCategoryId,
      "userpetid": "1",
      "meettingpetid": "10",
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
      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: header);
      log("Vet Details Api Response : ${response.body}");
      PetAddOrderModel petAddOrderModel =
          PetAddOrderModel.fromJson(json.decode(response.body));
      isSuccessStatus = petAddOrderModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: petAddOrderModel.message,fontSize: 12.sp);
        meetingStatus.value = true;
      } else {
        log("Pet Add Order Api Else Else");
      }
    } catch (e) {
      log("Pet Add Order Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    //getAllRoleProfileFunction();
    if (followCategoryId == "1") {
      await getUserProfileFunction();
    } else if (followCategoryId == "2") {
      await getShopProfileFunction();
    } /*else if(followCategoryId == "3"){
      await getNgoProfileFunction();
    } else if(followCategoryId == "4"){
      await getTrainerProfileFunction();
    }*/
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
}
