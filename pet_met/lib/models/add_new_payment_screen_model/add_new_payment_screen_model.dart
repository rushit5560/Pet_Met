// To parse this JSON data, do
//
//     final addNewPaymentModel = addNewPaymentModelFromJson(jsonString);

import 'dart:convert';

AddNewPaymentModel addNewPaymentModelFromJson(String str) => AddNewPaymentModel.fromJson(json.decode(str));

String addNewPaymentModelToJson(AddNewPaymentModel data) => json.encode(data.toJson());

class AddNewPaymentModel {
  AddNewPaymentModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory AddNewPaymentModel.fromJson(Map<String, dynamic> json) => AddNewPaymentModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
