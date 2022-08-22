import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/shop_details_screen_models/shop_details_model.dart';
import 'package:pet_met/utils/api_url.dart';

class ShopDetailsScreenController extends GetxController {
  String shopId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  //ShopData shopData = ShopData();
  List<ShopData> shopData = [];
  bool isVerified = false;

  /// Get Shop Details
  Future<void> getShopDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.shopDetailsApi + "/$shopId";
    log("Shop Details Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Shop Details Api Response : ${response.body}");
      ShopDetailsModel shopDetailsModel =
          ShopDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = shopDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        shopData = shopDetailsModel.data;

        String isVerify = "${shopDetailsModel.data[0].isVerified}";
        if(isVerify == "0") {
          isVerified = true;
        } else {
          isVerified = false;
        }

      } else {
        log("Shop Details Api Else");
      }
    } catch (e) {
      log("Shop Details Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getShopDetailsFunction();
  }
}
