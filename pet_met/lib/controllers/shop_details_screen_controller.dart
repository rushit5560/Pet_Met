import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/shop_details_screen_models/shop_details_model.dart';
import 'package:pet_met/utils/api_url.dart';

class ShopDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ShopDetails shopDetails = ShopDetails();


  /// Get Shop Details
  Future<void> getShopDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.shopDetailsApi;
    log("Shop Details Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id" : "1"
      };
      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Shop Details Api Response : ${response.body}");
      ShopDetailsModel shopDetailsModel = ShopDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = shopDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        shopDetails = shopDetailsModel.data;
        log("shopDetails : $shopDetails");
      } else {
        log("Shop Details Api Else");
      }
    } catch(e) {
      log("Shop Details Api Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

}