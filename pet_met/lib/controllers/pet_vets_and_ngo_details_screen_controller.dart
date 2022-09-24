import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/models/add_order_screen_model/pet_add_order_model.dart';
import 'package:pet_met/models/vet_and_ngo_details_screen_model/vet_and_ngo_details_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/razorpay_key.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PetVetsAndNgoDetailsScreenController extends GetxController {
  String vetAndNgoId = Get.arguments;
  String vetAndNgoCatId = "";
  String vetAndNgoName = "";
  String vetAndNgoEmail = "";

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  TextEditingController priceController = TextEditingController();
  bool isVerified = false;

  // VetNgoData vetsNgoDetailsData = VetNgoData();
  List<VetNgoData> vetsNgoDetailsData = [];
  late Razorpay _razorpay;
  final formKey = GlobalKey<FormState>();

  Future<void> getVetAndNgoDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllVetAndNgoDetailsApi + "/$vetAndNgoId";

    log("Vet And Ngo Details Api Url : $url");
    log("Vet And Ngo id : $vetAndNgoId");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Vet Details Api Response : ${response.body}");
      VetsAndNgoDetailsModel vetsNgoDetailsModel =
          VetsAndNgoDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = vetsNgoDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        vetsNgoDetailsData = vetsNgoDetailsModel.data;

        String isVerify = "${vetsNgoDetailsModel.data[0].isVerified}";
        vetAndNgoName = "${vetsNgoDetailsModel.data[0].name}";
        vetAndNgoEmail = "${vetsNgoDetailsModel.data[0].email}";
        vetAndNgoCatId = "${vetsNgoDetailsModel.data[0].categoryId}";
        if (isVerify == "0") {
          isVerified = true;
        } else {
          isVerified = false;
        }

        // log("vets Details image list  : ${vetsNgoDetailsData.image}");
      } else {
        log("Vet Details Api Else Else");
      }
    } catch (e) {
      log("Vet And Ngo Details Error ::: $e");
    } finally {
      isLoading(false);
    }
  }



  void openCheckout({required int price}) async {
    var options = {
      'key': RazorpayKey.razorpayKey,
      'amount': price * 100,
      'name': vetsNgoDetailsData[0].name,
      'description': vetsNgoDetailsData[0].fullText,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      // 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }

    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void onInit() {
    getVetAndNgoDetailsFunction();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    log(" vets id is : $vetAndNgoId");
    super.onInit();
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
      "name": vetAndNgoName
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


}
