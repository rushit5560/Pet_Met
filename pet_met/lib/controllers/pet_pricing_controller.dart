import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_order_screen_model/add_order_screen_model.dart';
import 'package:pet_met/models/get_all_plan_list_model/get_all_plan_list_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/razorpay_key.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class PetPricingController extends GetxController {
  final size = Get.size;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;

  late Razorpay _razorpay;

  // List<PetTrackerModel> petTrackerList = [
  //   PetTrackerModel(
  //     price: 150,
  //     planType: "basic",
  //     planDetails: "With tens of thousands of satisfied clients",
  //   ),
  //   PetTrackerModel(
  //     price: 999,
  //     planType: "premium",
  //     planDetails: "With tens of thousands of satisfied clients",
  //   ),
  // ];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();


  String selectedPlanId = "";
  String selectedPlanPrice = "";
  String selectedPlanOverview = "";
  String selectedPlanName = "";

  List<PlanData> planData = [];
  RxBool status = false.obs;
 // AllPlanListModel plansList = AllPlanListModel();

  Future<void> getAllPlansListFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPlanApi;

    log("get all plan Api Url : $url");

    try {
      Map<String, dynamic> bodyData = {
        "id": UserDetails.selfId,
        "categoryID" : UserDetails.categoryId,
      };
      log("bodyData : $bodyData");

      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(
          Uri.parse(url),
          headers: header,
          body: bodyData,
      );
      log("get all plan Api Response : ${response.body}");
      AllPlanListModel planListModel =
          AllPlanListModel.fromJson(json.decode(response.body));
      isSuccessStatus = planListModel.success.obs;

      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        planData.clear();

        for (var element in planListModel.date) {
          if(element.isActive == "0") {
            planData.add(element);
          }

        }
        // planData = planListModel.date;
        status = planListModel.status.obs;
        log('status: $status');
        log("get all plan name  : ${planData.first.name}");
        log("get all plan overview  : ${planData.first.overview}");
      } else {
        log("get all plan Api Else Else");
      }
    } catch (e) {
      log("get all plan Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addOrderFunction(
      {String? orderId, required String paymentId, String? signature}) async {
    isLoading(true);
    String url = ApiUrl.addOrderApi;

    Map<String, dynamic> data = {
      "uid": UserDetails.selfId.toString(),
      "userid": UserDetails.userId.toString(),
      "planid": selectedPlanId,
      "price": selectedPlanPrice.toString(),
      "transition_orderid": orderId ?? "123",
      "transition_paymentId": paymentId,
      "signature": signature ?? "123",
      "categoryID": UserDetails.categoryId
    };


    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response =
      await http.post(Uri.parse(url), body: data, headers: header);
      log("Add Order Api Response : ${response.body}");
      AddOrderModel addOrderModel =
      AddOrderModel.fromJson(json.decode(response.body));
      isSuccessStatus = addOrderModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addOrderModel.message);
        Get.back();
        // Get.back();
      } else {
        log("Add Order Api Else Else");
      }
    } catch (e) {
      log("Add Order Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllPlansListFunction();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': RazorpayKey.razorpayKey,
      'amount': int.parse(selectedPlanPrice) * 100,
      'name': selectedPlanName,
      'description': selectedPlanOverview,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    log('options: $options');

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log('Success Response: ${response.orderId}');
    await addOrderFunction(
        orderId: response.orderId,
        paymentId: response.paymentId!,
        signature: response.signature,
    );

    Fluttertoast.showToast(
        msg: "Payment Successful", toastLength: Toast.LENGTH_SHORT);
    log(response.paymentId.toString());
    log(response.orderId.toString());
    log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Fluttertoast.showToast(msg: 'Payment processing cancelled by user');

    log(response.message.toString());
    log(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
    log("response Wallet : ${response.walletName}");
  }
}




