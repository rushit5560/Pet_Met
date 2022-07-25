import 'package:cc_avenue/cc_avenue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/utils/app_route_names.dart';

class OrderDetailsController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  // Razorpay? _razorpay;

  RxBool selectedTerms = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    // _razorpay = Razorpay();
    // _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _razorpay!.clear();
  }

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '10',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp');
    } on PlatformException {
      print('PlatformException');
    }
  }

  // void openCheckout() async {
  //   var options = {
  //     'key': 'rzp_test_qIK5czKH62xDkI',
  //     'amount': 28200,
  //     'name': 'Shaiq',
  //     'description': 'Payment',
  //     'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };

  //   try {
  //     _razorpay!.open(options);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "SUCCESS: " + response.paymentId!,
  //   );
  //   Get.toNamed(AppRouteNames.orderPlacedRoute);
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
  //     timeInSecForIosWeb: 4,
  //   );
  //   Get.toNamed(AppRouteNames.paymentFailedRoute);
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "EXTERNAL_WALLET: " + response.walletName!,
  //     timeInSecForIosWeb: 4,
  //   );
  // }
}
