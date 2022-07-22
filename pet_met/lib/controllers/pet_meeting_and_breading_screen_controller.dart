import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/models/pet_meeting_and_breading_screen_models/category_and_sub_category_model.dart';
import '../utils/api_url.dart';

class PetMeetingAndBreadingScreenController extends GetxController {
  final size = Get.size;

  TextEditingController searchFieldController = TextEditingController();

  RxBool checkBoxValue = false.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<CatAndSubCatData> catAndSubCatList = [];
  String selectedSubCatId = "";


  Future<void> getAllCategoryAndSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryAndSubCategoryApi;

    log("get all pet category Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("get all pet category Api Response : ${response.body}");

      CategoryAndSubCategoryModel categoryAndSubCategoryModel = CategoryAndSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = categoryAndSubCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        catAndSubCatList.clear();
        catAndSubCatList = categoryAndSubCategoryModel.data;
       log("");
      } else {
        log("get all pet category  Api Else Else");
      }
    } catch (e) {
      log("get all pet category  Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllCategoryAndSubCategoryFunction();
    super.onInit();
  }
}

