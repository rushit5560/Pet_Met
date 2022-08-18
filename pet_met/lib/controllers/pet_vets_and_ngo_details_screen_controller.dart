import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pet_met/utils/api_url.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PetVetsAndNgoDetailsScreenController extends GetxController {
  String vetAndNgoId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;


  ApiHeader apiHeader = ApiHeader();
  TextEditingController priceController = TextEditingController();

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

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dxCkKqtRKnvZdA',
      'amount': priceController.text.trim(),
      'name': vetsNgoDetailsData[0].name,
      'description': vetsNgoDetailsData[0].fullText,
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

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    log('Success Response: ${response.orderId}');
    // await addOrderFunction(
    //     orderId: response.orderId,
    //     paymentId: response.paymentId!,
    //     signature: response.signature
    // );

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    Get.back();
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

  /*Future<void> addOrderFunction(
      { String ? orderId,required String paymentId, String ? signature}) async {
    isLoading(true);
    String url = ApiUrl.addOrderApi;

    Map<String, dynamic> data = {
      "userid": UserDetails.userId.toString(),
      "planid" : petPlanId,
      "price" : price,
      "transition_orderid": orderId ?? "123",
      "transition_paymentId": paymentId,
      "signature": signature ?? "123"
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
  }*/
}

class VetsAndNgoDetailsModel {
  bool success;
  List<VetNgoData> data;
  String message;

  VetsAndNgoDetailsModel({
    required this.success,
    required this.data,
    required this.message});

  factory VetsAndNgoDetailsModel.fromJson(Map<String, dynamic> json) => VetsAndNgoDetailsModel(
    success: json["success"] ?? false,
    data: List<VetNgoData>.from(json["data"].map((x) => VetNgoData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class VetNgoData {
  String ? id;
  String ? name;
  String ? email;
  String ? password;
  String ? address;
  String ? phone;
  String ? open;
  String ? close;
  String ? fullText;
  String ? instagram;
  String ? facebook;
  String ? image;
  List<String> ? vetNgoimages;
  String ? image1;
  String ? image2;
  String ? image3;
  String ? image4;
  String ? image5;
  String ? meetingimages;
  String ? isActive;
  String ? ifscCode;
  String ? accountCode;
  String ? userid;
  String ? categoryId;
  String ? createdBy;
  String ? modifiedBy;
  String ? createdDate;
  String ? modifiedDate;
  String ? rememberToken;
  String ? isVerified;

  VetNgoData(
      { this.id,
         this.name,
         this.email,
         this.password,
         this.address,
         this.phone,
         this.open,
         this.close,
         this.fullText,
         this.instagram,
         this.facebook,
         this.image,
         //this.vetNgoimages,
         this.image1,
         this.image2,
         this.image3,
         this.image4,
         this.image5,
         this.meetingimages,
         this.isActive,
         this.ifscCode,
         this.accountCode,
         this.userid,
         this.categoryId,
         this.createdBy,
         this.modifiedBy,
         this.createdDate,
         this.modifiedDate,
         this.rememberToken,
         this.isVerified,
      });

  factory VetNgoData.fromJson(Map<String, dynamic> json) => VetNgoData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    open: json["open"] ?? "",
    close: json["close"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    image: json["image"] ?? "",
    //vetNgoimages: List<String>.from(json["vet_ngoimages"].map((x) => x) ?? {}),
    image1: json["image1"] ?? "",
    image2: json["image2"] ?? "",
    image3: json["image3"] ?? "",
    image4: json["image4"] ?? "",
    image5: json["image5"] ?? "",
    meetingimages: json["meetingimages"] ?? "",
    isActive: json["is_active"] ?? "",
    ifscCode: json["ifsc_code"] ?? "",
    accountCode: json["account_code"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "address": address,
    "phone": phone,
    "open": open,
    "close": close,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "image": image,
    //"vet_ngoimages": List<dynamic>.from(vetNgoimages!.map((x) => x)),
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "meetingimages": meetingimages,
    "is_active": isActive,
    "ifsc_code": ifscCode,
    "account_code": accountCode,
    "userid": userid,
    "categoryID": categoryId,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "remember_token": rememberToken,
    "is_verified": isVerified,
  };
}
