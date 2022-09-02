import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/shop_details_screen_models/shop_details_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ShopDetailsScreenController extends GetxController {
  String shopId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  //ShopData shopData = ShopData();
  List<ShopData> shopData = [];
  bool isVerified = false;
  RxBool showStatus = false.obs;

  late Razorpay _razorpay;

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
        showStatus = shopDetailsModel.showstatus.obs;
        log('showStatus: $showStatus');
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

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': 200 * 100,
      'name': shopData[0].shopename,
      'description': "",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': shopData[0].phonenumber, 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: ${response.orderId}');

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
    log(response.message.toString());
    log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  @override
  void onInit() async {
    super.onInit();
    await getShopDetailsFunction();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
}
