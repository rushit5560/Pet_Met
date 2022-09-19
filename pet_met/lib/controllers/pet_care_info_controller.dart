import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:pet_met/screens/home_screen/home_screen.dart';
import 'package:pet_met/screens/shop_and_grooming_screen/shop_and_grooming_screen.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:http/http.dart' as http;

import '../models/pet_care_info_screen_models/pet_care_model.dart';

class PetCareInfoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  RxBool isOpened = false.obs;

  RxInt selectedbottomIndex = 2.obs;
  RxBool slectedAddress = true.obs;

  String title = "";
  String description = "";

  var petCareList = "";

  var drawerController = ZoomDrawerController();

  Future<void> getPetCareFunction() async {
    isLoading(true);
    String url = ApiUrl.petCareApi;
    log("Api Url Pet Care Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Pet Care api Response : ${response.body}");

      var resBody = json.decode(response.body);

      PetCareInfoModel petCareInfoModel = PetCareInfoModel.fromJson(resBody);
      isSuccessStatus.value = petCareInfoModel.success;

      if (isSuccessStatus.value) {
        title = petCareInfoModel.data[0].title;
        description = petCareInfoModel.data[0].content;
      } else {
        log("Pet Care Function Else");
      }
    } catch (e) {
      log("Pet Care api error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPetCareFunction();
  }
}
