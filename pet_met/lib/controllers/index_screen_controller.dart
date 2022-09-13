import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/get_all_profile_model/get_shop_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/models/get_all_profile_model/get_vet_and_ngo_profile_model.dart';
import 'package:pet_met/models/trainers_update_profile_model/trainers_get_profile_model.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/locate_screen/locate_screen.dart';
import 'package:pet_met/screens/pet_meeting_and_breading_screen/pet_meeting_and_breading_screen.dart';
import 'package:pet_met/screens/pet_trainers_screen/pet_trainers_screen.dart';
import 'package:pet_met/screens/pet_vets_and_ngo_screen/pet_vets_and_ngo_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/screens/user_categories_screen/user_categories_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:pet_met/utils/user_preference.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/delete_account_screen_model/delete_account_screen_model.dart';

class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  RxBool isOpened = false.obs;
  UserPreference userPreference = UserPreference();

  RxInt selectedBottomIndex = 2.obs;
  final fb = FacebookLogin();

  var drawerController = ZoomDrawerController();

  final expandedSettingsController =
      ExpandableController(initialExpanded: false);

  ApiHeader apiHeader = ApiHeader();

  List<Petdatum> petList = [];
  List<ShopPet> shopPetList = [];
  List<NgoPet> ngoPetList = [];
  List<TrainerPet> trainerPetList = [];

  RxString userprofile= "".obs;
  String userName = "";

  RxString shopProfile= "".obs;
  String shopName = "";
  String shopDescription = "";

  RxString ngoProfile= "".obs;
  String ngoName = "";
  String ngoDescription = "";

  RxString trainerProfile= "".obs;
  String trainerName = "";
  String trainerDescription = "";

  List screenPages = [
    PetMeetingAndBreadingScreen(),
    PetTrainersScreen(),
    HomeScreen(),
    LocateScreen(),
    PetVetsAndNgoScreen(),
  ];

  Future<void> deleteAccountFunction() async {
    isLoading(true);
    String url = ApiUrl.deleteAccountApi + UserDetails.selfId;
    log('Delete Account Api Url : $url');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log('header: $header');
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Delete Account Api Response : ${response.body}");

      DeleteAccountModel deleteAccountModel =
          DeleteAccountModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteAccountModel.success.obs;

      if (isSuccessStatus.value) {
        //addressController.clear();
        Fluttertoast.showToast(msg: deleteAccountModel.message);
        Get.off(() => const UserCategoriesScreen());
      } else {
        Fluttertoast.showToast(msg: deleteAccountModel.message);
      }
    } catch (e) {
      log('Delete Account Api Error ::: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> userLogOutFunction() async {
    await userPreference.removeUserDetails();
    await fb.logOut();
    Get.offAll(() => const UserCategoriesScreen(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 500));
  }
  /// Get User Profile
  Future<void> getUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
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

        userprofile.value = ApiUrl.apiImagePath + "asset/uploads/product/" + getUserProfileModel.data.data[0].image;
        userName = getUserProfileModel.data.data[0].name;
        log('userName: $userName');
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
      isLoading(false);
    }
  }

  /// Get Shop Profile
  Future<void> getShopProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
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

        shopProfile.value = ApiUrl.apiImagePath + getShopProfileModel.data.data[0].showimg;
        shopName = getShopProfileModel.data.data[0].shopename;
        shopDescription = getShopProfileModel.data.data[0].fullText;
        log('shopName: $shopName');

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
      isLoading(false);
    }
  }

  /// Get NGO Profile
  Future<void> getNgoProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
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

        ngoProfile.value = ApiUrl.apiImagePath + allRoleProfileModel.data.data[0].image;
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


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      isLoading(false);

    }
  }

  /// Get Trainer Profile
  Future<void> getTrainerProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.allRoleGetProfileApi;
    log("All Role Profile Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id": UserDetails.selfId,
        // "uid": "${UserDetails.selfId}",
        "categoryID": UserDetails.categoryId,
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

        trainerProfile.value = ApiUrl.apiImagePath + getTrainersProfileModel.data.data[0].image;
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


    } catch(e) {
      log("All Role Profile Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    isLoading(true);
    isLoading(false);
    if(UserDetails.categoryId == "1"){
      getUserProfileFunction();
    } else if(UserDetails.categoryId == "2"){
      getShopProfileFunction();
    } else if(UserDetails.categoryId == "3"){
      getNgoProfileFunction();
    } else if(UserDetails.categoryId == "4"){
      getTrainerProfileFunction();
    }
    super.onInit();
  }
}
