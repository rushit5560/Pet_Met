import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/add_new_payment_screen_model/add_new_payment_screen_model.dart';
import 'package:pet_met/models/get_payment_list_screen_model/get_payment_list_screen_model.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:pet_met/utils/user_details.dart';



class AddNewPaymentScreenController extends GetxController{
  final size = Get.size;

  final formKey = GlobalKey<FormState>();

  var cardNumberController = TextEditingController();
  var nameOnCardController = TextEditingController();
  var expiryDateController = TextEditingController();
  var cvvTextFieldController = TextEditingController();


  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<Datum> paymentList = [];

  ApiHeader apiHeader = ApiHeader();


  /// Add New Payment
  Future<void> addNewPaymentFunction() async {
    isLoading(true);
    String url = ApiUrl.addNewPaymentApi;
    log("Add New Payment List Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "userid": "${UserDetails.userId}",
        "card_number": cardNumberController.text.trim(),
        "card_name": nameOnCardController.text.trim(),
        "expiry_date": expiryDateController.text.trim(),
        "cvv": cvvTextFieldController.text.trim()
      };

      log("data : $data");
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.post(Uri.parse(url),body: data, headers: header);
      log("Add New Payment Api Response : ${response.body}");

      AddNewPaymentModel addNewPaymentModel =
      AddNewPaymentModel.fromJson(json.decode(response.body));
      isSuccessStatus = addNewPaymentModel.success.obs;

      if (isSuccessStatus.value) {
        //await getPaymentListFunction();
        Fluttertoast.showToast(msg: addNewPaymentModel.message);
        cardNumberController.clear();
        nameOnCardController.clear();
        expiryDateController.clear();
        cvvTextFieldController.clear();
      } else {
        log("Add New payment List Api Else");
      }
    } catch (e) {
      log("Add new Payment Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getAllPetFunction();
    }
  }

  /// Get Payment List
  /*Future<void> getPaymentListFunction() async {
    isLoading(true);
    String url = ApiUrl.getPaymentListApi + "${UserDetails.userId}";
    log("Get Payment List Api Url : $url");

    try {
      Map<String, String> header = apiHeader.apiHeader();
      log("header : $header");

      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("Payment List Api Response : ${response.body}");

      GetPaymentListModel getPaymentListModel =
      GetPaymentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getPaymentListModel.success.obs;

      if (isSuccessStatus.value) {
        paymentList.clear();
        paymentList.addAll(getPaymentListModel.data);
        log("paymentList Length : ${paymentList.length}");
      } else {
        log("Get payment List Api Else");
      }
    } catch (e) {
      log("Payment Api Error ::: $e");
    } finally {
      isLoading(false);
      //await getAllPetFunction();
    }
  }*/


}