import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_met/models/shop_and_grooming_screen_model/all_shop_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;

class ShopAndGroomingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  List<ShopData> shopsList = [];


  /// Get All Shop
  Future<void> getAllShopFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllShopApi;
    log("All Shop Api Url : $url");
    
    try {
      // Map<String, String> header = apiHeader.apiHeader();
      // log("Header : $header");

      http.Response response = await http.get(Uri.parse(url), /*headers: header*/);
      log('Get All Shop Response: ${response.body}');
      AllShopModel allShopModel = AllShopModel.fromJson(json.decode(response.body));

      isSuccessStatus = allShopModel.success.obs;

      if(isSuccessStatus.value) {
        shopsList.clear();
        shopsList.addAll(allShopModel.data);
        log("shopList Length : ${shopsList.length}");
      } else {
        log("Get All Shop Api Else");
      }

    } catch(e) {
      log("Get All Shop Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getAllShopFunction();
    super.onInit();
  }
}