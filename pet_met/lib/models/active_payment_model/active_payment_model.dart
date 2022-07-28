// To parse this JSON data, do
//
//     final activePaymentModel = activePaymentModelFromJson(jsonString);

import 'dart:convert';

ActivePaymentModel activePaymentModelFromJson(String str) => ActivePaymentModel.fromJson(json.decode(str));

String activePaymentModelToJson(ActivePaymentModel data) => json.encode(data.toJson());

class ActivePaymentModel {
  ActivePaymentModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ActivePaymentModel.fromJson(Map<String, dynamic> json) => ActivePaymentModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
