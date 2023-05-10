import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/add_order_screen_model/pet_add_order_model.dart';
import 'package:pet_met/models/shop_details_screen_models/shop_details_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/razorpay_key.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ShopDetailsScreenController extends GetxController {
  String shopId = Get.arguments;

  String shopName = "";
  String shopEmail = "";
  String shopUpi = "";

  String shopCatId = "";
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();

  //ShopData shopData = ShopData();
  List<ShopData> shopData = [];
  List<String> petShopImageData = [];

  bool isVerified = false;
  RxBool showStatus = false.obs;

  List productList = [];

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
        petShopImageData = shopDetailsModel.petImage;
        showStatus = shopDetailsModel.showstatus.obs;
        log('showStatus: $showStatus');
        String isVerify = "${shopDetailsModel.data[0].isVerified}";
        shopName = "${shopDetailsModel.data[0].shopename}";
        shopEmail = "${shopDetailsModel.data[0].email}";
        shopUpi = shopDetailsModel.data[0].gpayupi ?? "";

        shopCatId = "${shopDetailsModel.data[0].categoryID}";

        productList.add(1);

        if (isVerify == "1") {
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

  void openCheckout({required int price}) async {
    var options = {
      'key': RazorpayKey.razorpayKey,
      'amount': price * 100,
      'name': shopData[0].shopename,
      'description': shopData[0].fullText,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': UserDetails.userName,
        'email': UserDetails.userEmail,
        'vpa': shopUpi,
      },
      /*'external': {
        'wallets': ['paytm']
      }*/
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: ${response.orderId}');
    // await addOrderFunction(
    //     orderId: response.orderId,
    //     paymentId: response.paymentId!,
    //     signature: response.signature
    // );

    // API calling
    await payOrDonateFunction(
      orderId: "${response.orderId}",
      paymentId: "${response.paymentId}",
      signature: "${response.signature}",
    );

    // Fluttertoast.showToast(
    //     msg: "Payment Successful.", toastLength: Toast.LENGTH_LONG);
    // Get.back();
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'Payment processing cancelled by user');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }

  Future<void> payOrDonateFunction(
      {String? orderId, required String paymentId, String? signature}) async {
    isLoading(true);
    String url = ApiUrl.donateAndPayApi;

    Map<String, dynamic> data = {
      "userid": UserDetails.userId.toString(),
      "categoryID": UserDetails.categoryId,
      "uid": UserDetails.selfId.toString(),
      "price": priceController.text,
      "transition_orderid": orderId ?? "123",
      "transition_paymentId": paymentId,
      "signature": signature ?? "123",
      "name": shopName
    };

    log("Add Order Api Url11111 : $url");
    //log("pet plan id : $petPlanId");
    log('Add Order body11111: $data');

    try {
      // Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(
        Uri.parse(url),
        body: data,
      );
      log("Vet Details Api Response11111 : ${response.body}");
      PetAddOrderModel petAddOrderModel =
          PetAddOrderModel.fromJson(json.decode(response.body));
      isSuccessStatus = petAddOrderModel.success.obs;

      if (isSuccessStatus.value) {
        priceController.clear();
        Fluttertoast.showToast(
            msg: "Payment Successful.", toastLength: Toast.LENGTH_LONG);
      } else {
        log("Pet Add Order Api Else Else");
      }
    } catch (e) {
      log("Pet Add Order Error ::: $e");
    } finally {
      isLoading(false);
    }
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
