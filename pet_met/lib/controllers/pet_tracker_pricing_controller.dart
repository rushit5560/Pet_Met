import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pet_met/models/add_order_screen_model/add_order_screen_model.dart';
import 'package:pet_met/utils/app_route_names.dart';
import 'package:pet_met/utils/user_details.dart';

import '../utils/api_url.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PetTrackerPricingController extends GetxController {
  final size = Get.size;

  int petPlanId = Get.arguments;

  TextEditingController feedbackController = TextEditingController();

  RxBool selectedTerms = false.obs;
  int price = 0;
  String name= "";
  String overview = "";

  final formKey = GlobalKey<FormState>();
  late Razorpay _razorpay;

  List<PetTrackerModel> petTrackerList = [
    PetTrackerModel(
      price: 150,
      planType: "basic",
      planDetails: "With tens of thousands of satisfied clients",
    ),
    PetTrackerModel(
      price: 999,
      planType: "premium",
      planDetails: "With tens of thousands of satisfied clients",
    ),
  ];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  //SinglePlanDetails planDetailsData = SinglePlanDetails();
  List<SinglePlanDetails> planDetailsData = [];

  Future<void> getplanDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getPlanDetailsApi + "/$petPlanId";

    log("pet plan Details Api Url : $url");
    log("pet plan id : $petPlanId");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Vet Details Api Response : ${response.body}");
      SinglePlanDetailModel vetsNgoDetailsModel =
          SinglePlanDetailModel.fromJson(json.decode(response.body));
      isSuccessStatus = vetsNgoDetailsModel.success!.obs;

      if (isSuccessStatus.value) {
        planDetailsData = vetsNgoDetailsModel.data!.obs;
        for(int i=0; i < planDetailsData.length; i++){
          price= planDetailsData[i].rs!;
          name= planDetailsData[i].name!;
          overview= planDetailsData[i].overview!;
        }

        //log("plan Details overview  : ${planDetailsData}");
      } else {
        log("plan Details  Api Else Else");
      }
    } catch (e) {
      log("plan Details  Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addOrderFunction(
      {required String orderId,required String paymentId,required String signature}) async {
    isLoading(true);
    String url = ApiUrl.addOrderApi;

    Map<String, dynamic> data = {
      "userid": UserDetails.userId,
      "planid" : petPlanId,
      "price" : price,
      "transition_orderid": orderId,
      "transition_paymentId": paymentId,
      "signature": signature

    };

    log("Add Order Api Url : $url");
    log("pet plan id : $petPlanId");
    log('Add Order body: $data');

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Vet Details Api Response : ${response.body}");
      AddOrderModel addOrderModel =
      AddOrderModel.fromJson(json.decode(response.body));
      isSuccessStatus = addOrderModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addOrderModel.message);
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
    getplanDetailsFunction();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': price * 100,
      'name': name,
      'description': overview,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
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

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    log('Success Response: $response');
    await addOrderFunction(
        orderId: response.orderId.toString(),
        paymentId: response.paymentId.toString(),
        signature: response.signature.toString()
    );

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

  }



class PetTrackerModel {
  final int? price;
  final String? planType;
  final String? planDetails;

  PetTrackerModel({
    this.price,
    this.planType,
    this.planDetails,
  });
}

class SinglePlanDetailModel {
  bool? success;
  List<SinglePlanDetails>? data;
  String? message;

  SinglePlanDetailModel({this.success, this.data, this.message});

  SinglePlanDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SinglePlanDetails>[];
      json['data'].forEach((v) {
        data!.add(new SinglePlanDetails.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class SinglePlanDetails {
  int? id;
  int? rs;
  String? name;
  String? overview;
  String? isActive;
  int? days;

  SinglePlanDetails(
      {this.id, this.rs, this.name, this.overview, this.isActive, this.days});

  SinglePlanDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rs = json['rs'];
    name = json['name'];
    overview = json['overview'];
    isActive = json['is_active'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rs'] = this.rs;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['is_active'] = this.isActive;
    data['days'] = this.days;
    return data;
  }
}
