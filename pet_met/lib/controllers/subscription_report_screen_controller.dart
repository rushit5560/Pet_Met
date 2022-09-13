import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/subscription_report_screen_model/subscription_orders_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';

class SubscriptionReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  List<SubscriptionOrders> subscriptionOrderList = [];

  Future<void> getUserSubscriptionReportFunction() async {
    isLoading(true);
    String url = ApiUrl.subscriptionOrderApi;
    log("getUserSubscriptionReport Api Url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "userid": UserDetails.userId,
        "categoryID": UserDetails.categoryId
      };

      log("body data passing : $bodyData");

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log("getUserSubscriptionReport response : ${response.body}");

      SubscriptionOrdersModel subscriptionOrdersModel =
          SubscriptionOrdersModel.fromJson(json.decode(response.body));
      isSuccessStatus = subscriptionOrdersModel.success.obs;

      if (isSuccessStatus.value) {
        subscriptionOrderList.clear();
        subscriptionOrderList.addAll(subscriptionOrdersModel.date.orderdetails);
        log("getUserSubscriptionReport  : ${subscriptionOrderList.length}");
      } else {
        log("getUserSubscriptionReport  Else");
      }
    } catch (e) {
      log("getUserSubscriptionReport  Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserSubscriptionReportFunction();
  }
}
