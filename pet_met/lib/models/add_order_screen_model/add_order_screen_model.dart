// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

import 'dart:convert';

AddOrderModel addOrderModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));

String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
  AddOrderModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
