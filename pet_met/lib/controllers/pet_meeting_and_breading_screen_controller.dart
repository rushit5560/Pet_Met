import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/models/pet_meeting_and_breading_screen_models/category_and_sub_category_model.dart';
import 'package:pet_met/models/search_sub_category_model/search_sub_category_model.dart';
import '../utils/api_url.dart';

class PetMeetingAndBreadingScreenController extends GetxController {
  final size = Get.size;

  TextEditingController searchFieldController = TextEditingController();

  RxBool checkBoxValue = false.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<CatAndSubCatData> catAndSubCatList = [];
  // RxList<SubCategoryId> searchSubCatList = <SubCategoryId>[].obs;
  List<SearchDatum> searchList = [];
  String selectedSubCatId = "";

  RxBool isSearch = false.obs;

  Future<void> getAllCategoryAndSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryAndSubCategoryApi;

    log("get all pet category Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(Uri.parse(url), headers: header);
      log("get all pet category Api Response : ${response.body}");

      CategoryAndSubCategoryModel categoryAndSubCategoryModel =
          CategoryAndSubCategoryModel.fromJson(json.decode(response.body));
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

  Future<void> getSearchCategoryAndSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryAndSubCategoryApi;

    log("get all search pet category Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "search": searchFieldController.text.trim().toLowerCase(),
      };
      log("data : $data");

      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(Uri.parse(url), body: data, headers: header);
      log("get all search pet category Api Response : ${response.body}");

      SearchCategoryAndSubCategoryModel searchCategoryAndSubCategoryModel =
      SearchCategoryAndSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchCategoryAndSubCategoryModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        isSearch = true.obs;
        searchList.clear();
        searchList = searchCategoryAndSubCategoryModel.data;
        log('searchList: $searchList');
        //searchList.clear();
        // for(int i =0; i < searchCategoryAndSubCategoryModel.data.length; i++){
        //   for(int j=0; j < categoryAndSubCategoryModel.data[i].subCategory.length ; i++){
        //     searchSubCatList = categoryAndSubCategoryModel.data[j].subCategory;
        //     log('searchSubCatList: ${searchSubCatList.length}');
        //   }
        // }

      } else {
        log("get all search pet category  Api Else Else");
      }
    } catch (e) {
      log("get all search pet category  Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/

    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    getAllCategoryAndSubCategoryFunction();
    super.onInit();
  }
}
