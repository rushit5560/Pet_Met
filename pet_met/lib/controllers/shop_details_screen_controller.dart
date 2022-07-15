import 'package:get/get.dart';
import 'package:pet_met/models/shop_and_grooming_screen_model/all_shop_model.dart';

class ShopDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ShopData shopDetails = Get.arguments;


  /// Get Shop Details
  /*Future<void> getShopDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.shopDetailsApi;
    log("Shop Details Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "id" : "$shopId"
      };
      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Shop Details Api Response : ${response.body}");
      ShopDetailsModel shopDetailsModel = ShopDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = shopDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        shopDetails = shopDetailsModel.data;
        log("shopDetails : ${shopDetails.showimg}");
      } else {
        log("Shop Details Api Else");
      }
    } catch(e) {
      log("Shop Details Api Error ::: $e");
    } finally {
      isLoading(false);
    }

  }*/

  /*@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getShopDetailsFunction();
  }*/

}