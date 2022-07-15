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

  List<ShopData> shopsList = [];


  /// Get All Shop
  Future<void> getAllShopFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllShopApi;
    log("All Shop Api Url : $url");
    
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('Get All Shop Response: ${response.body}');
      AllShopModel allShopModel = AllShopModel.fromJson(json.decode(response.body));

      isSuccessStatus = allShopModel.success.obs;

      if(isSuccessStatus.value) {
        shopsList.clear();
        shopsList.addAll(allShopModel.data);
        log("shopList Length : ${shopList.length}");
      } else {
        log("Get All Shop Api Else");
      }

    } catch(e) {
      log("Get All Shop Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  List<String> shopList = [
    "Skylos The Pet Shop",
    "The Muster Pet Zone",
    "One Stop Pet Shop",
    "Dog Club Pet",
    "Dogclub pet Shop",
    "Skylos The Pet Shop",
    "The Muster Pet Zone",
    "One Stop Pet Shop",
    "Dog Club Pet",
    "Dogclub pet Shop"
  ];


  @override
  void onInit() {
    getAllShopFunction();
    super.onInit();
  }
}