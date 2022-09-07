import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/pet_trainers_details_screen_models/trainer_details_model.dart';
import 'package:pet_met/models/pet_trainers_screen_models/all_trainer_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PetTrainersDetailsScreenController extends GetxController {
  // Get Trainer Id From Trainer List Screen
  String trainerId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;

  late Razorpay _razorpay;
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();
  //TrainerData trainerDetails = TrainerData();
  List<TrainerData> trainerDetails = [];
  bool isVerified = false;
  RxBool isShowStatus = false.obs;

  Future<void> getTrainerDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getTrainerDetailsApi + "/$trainerId";
    log("Trainer Details Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);

      TrainerDetailsModel trainerDetailsModel =
          TrainerDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = trainerDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        trainerDetails = trainerDetailsModel.data;

        isShowStatus = trainerDetailsModel.showstatus.obs;

        String isVerify = "${trainerDetailsModel.data[0].isVerified}";
        if (isVerify == "0") {
          isVerified = true;
        } else {
          isVerified = false;
        }
      } else {
        log("Trainer Details Api Else");
      }
    } catch (e) {
      log("Trainer Details Api Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  void openCheckout({required int price}) async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': price * 100,
      'name': trainerDetails[0].name,
      'description': "",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': trainerDetails[0].phone, 'email': 'test@razorpay.com'},
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

  // Future<void> petAddOrderFunction(
  //     {String? orderId, required String paymentId, String? signature}) async {
  //   isLoading(true);
  //   String url = ApiUrl.petAddOrderApi;

  //   Map<String, dynamic> data = {
  //     "userid": UserDetails.userId.toString(),
  //     "categoryID": UserDetails.categoryId,
  //     "meettingpetuserid": ,
  //     "meettingpetusercategory": followCategoryId,
  //     "userpetid": "1",
  //     "meettingpetid": "10",
  //     "price": "200",
  //     "transition_orderid": orderId ?? "123",
  //     "transition_paymentId": paymentId,
  //     "signature": signature ?? "123"
  //   };

  //   log("Add Order Api Url : $url");
  //   //log("pet plan id : $petPlanId");
  //   log('Add Order body: $data');

  //   try {
  //     Map<String, String> header = apiHeader.apiHeader();
  //     http.Response response =
  //         await http.post(Uri.parse(url), body: data, headers: header);
  //     log("Vet Details Api Response : ${response.body}");
  //     PetAddOrderModel petAddOrderModel =
  //         PetAddOrderModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = petAddOrderModel.success.obs;

  //     if (isSuccessStatus.value) {
  //       Fluttertoast.showToast(msg: petAddOrderModel.message);
  //       meetingStatus.value = true;
  //     } else {
  //       log("Pet Add Order Api Else Else");
  //     }
  //   } catch (e) {
  //     log("Pet Add Order Error ::: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    getTrainerDetailsFunction();
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
}
