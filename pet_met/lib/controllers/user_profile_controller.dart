import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/get_all_profile_model/get_user_profile_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_images.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;

class UserProfileController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

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

  /// Get All Role Profile
  Future<void> getAllRoleProfileFunction() async {
    isLoading(true);
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

      AllRoleProfileModel allRoleProfileModel =
      AllRoleProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRoleProfileModel.success.obs;

      if (isSuccessStatus.value) {
        petList.clear();
        petList.addAll(allRoleProfileModel.data.petdata);
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
    super.onInit();
    getAllRoleProfileFunction();
  }
}
