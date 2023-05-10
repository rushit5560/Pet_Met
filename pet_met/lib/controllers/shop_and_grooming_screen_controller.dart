import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/shop_and_grooming_screen_model/all_shop_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';



class ShopAndGroomingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  final formKey = GlobalKey<FormState>();
  TextEditingController searchFieldController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();

  List<ShopData> shopsList = [];
  List<ShopData> searchShopsList = [];

  /// Get All Shop
  Future<void> getAllShopFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllShopApi;
    log("All Shop Api Url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "latitude": UserDetails.liveLatitude,
        "longitude": UserDetails.liveLongitude
      };


      Map<String, String> header = apiHeader.apiHeader();
      log("Header : $header");

      http.Response response = await http.post(
          Uri.parse(url),
          headers: header,
        body: bodyData,
      );
      log('Get All Shop Response: ${response.body}');
      AllShopModel allShopModel =
          AllShopModel.fromJson(json.decode(response.body));

      isSuccessStatus = allShopModel.success.obs;

      if (isSuccessStatus.value) {
        shopsList.clear();
        shopsList.addAll(allShopModel.data);
        searchShopsList.clear();
        searchShopsList.addAll(allShopModel.data);
        log("shopList Length : ${shopsList.length}");
        log('searchShopsList length: ${searchShopsList.length}');
        for(var element in searchShopsList) {
          log('isVerified : ${element.isVerified}');
        }
      } else {
        log("Get All Shop Api Else");
      }
    } catch (e) {
      log("Get All Shop Api Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/

    isLoading(false);
  }

  @override
  void onInit() {
    getAllShopFunction();
    super.onInit();
  }
}
