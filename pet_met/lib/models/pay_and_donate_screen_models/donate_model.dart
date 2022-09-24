// To parse this JSON data, do
//
//     final donateModel = donateModelFromJson(jsonString);

import 'dart:convert';

DonateModel donateModelFromJson(String str) => DonateModel.fromJson(json.decode(str));

String donateModelToJson(DonateModel data) => json.encode(data.toJson());

class DonateModel {
  DonateModel({
    required this.success,
    required this.date,
    required this.message,
  });

  bool success;
  List<PayAndDonateData> date;
  String message;

  factory DonateModel.fromJson(Map<String, dynamic> json) => DonateModel(
    success: json["success"] ?? false,
    date: List<PayAndDonateData>.from(json["date"].map((x) => PayAndDonateData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "message": message,
  };
}

class PayAndDonateData {
  PayAndDonateData({
   required this.id,
   required this.userid,
   required this.uid,
   required this.categoryId,
   required this.price,
   required this.transitionOrderid,
   required this.transitionPaymentId,
   required this.signature,
   required this.name,
  });

  String id;
  String userid;
  String uid;
  String categoryId;
  String price;
  String transitionOrderid;
  String transitionPaymentId;
  String signature;
  String name;

  factory PayAndDonateData.fromJson(Map<String, dynamic> json) => PayAndDonateData(
    id: json["id"] ?? "",
    userid: json["userid"] ?? "",
    uid: json["uid"] ?? "",
    categoryId: json["categoryID"] ?? "",
    price: json["price"] ?? "",
    transitionOrderid: json["transition_orderid"] ?? "",
    transitionPaymentId: json["transition_paymentId"] ?? "",
    signature: json["signature"] ?? "",
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "uid": uid,
    "categoryID": categoryId,
    "price": price,
    "transition_orderid": transitionOrderid,
    "transition_paymentId": transitionPaymentId,
    "signature": signature,
    "name": name,
  };
}
