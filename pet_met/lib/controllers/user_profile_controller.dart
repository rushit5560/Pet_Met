import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/follow_user_model/follow_user_model.dart';
import 'package:pet_met/models/follow_user_model/get_follow_status_model.dart';
import 'package:pet_met/models/follow_user_model/unfollow_user_model.dart';
import 'package:pet_met/models/get_pet_list_model/get_pet_list_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;

class UserProfileController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int followUserId = Get.arguments;

  ApiHeader apiHeader = ApiHeader();

  List<Petdatum> petList = [];


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

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
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
        "categoryID": "${UserDetails.categoryId}",
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
      //await followStatus();
    }
  }

  followUserFunction()async{
    isLoading(true);
    String url = ApiUrl.followUserApi;
    log("Follow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "followuserid": "$followUserId",
        "categoryID": "${UserDetails.categoryId}",
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

  unfollowUserFunction()async{
    isLoading(true);
    String url = ApiUrl.unfollowUserApi;
    log("Unfollow User Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "followuserid": "$followUserId",
        "categoryID": "${UserDetails.categoryId}",
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

  @override
  void onInit() {
    super.onInit();
    getAllRoleProfileFunction();
  }
}
