// To parse this JSON data, do
//
//     final getPaymentListModel = getPaymentListModelFromJson(jsonString);

import 'dart:convert';

GetPaymentListModel getPaymentListModelFromJson(String str) => GetPaymentListModel.fromJson(json.decode(str));

String getPaymentListModelToJson(GetPaymentListModel data) => json.encode(data.toJson());

class GetPaymentListModel {
  GetPaymentListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory GetPaymentListModel.fromJson(Map<String, dynamic> json) => GetPaymentListModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userid,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvv,
    required this.isActive,
  });

  int id;
  int userid;
  String cardNumber;
  String cardName;
  String expiryDate;
  String cvv;
  bool isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    userid: json["userid"] ?? 0,
    cardNumber: json["card_number"] ?? "",
    cardName: json["card_name"] ?? "",
    expiryDate: json["expiry_date"] ?? "",
    cvv: json["cvv"] ?? "",
    isActive: json["is_active"] == "1" ? true : false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "card_number": cardNumber,
    "card_name": cardName,
    "expiry_date": expiryDate,
    "cvv": cvv,
    "is_active": isActive,
  };
}
