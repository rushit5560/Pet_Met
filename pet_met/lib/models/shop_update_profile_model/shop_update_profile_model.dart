// To parse this JSON data, do
//
//     final shopProfileModel = shopProfileModelFromJson(jsonString);

import 'dart:convert';

ShopUpdateProfileModel shopProfileModelFromJson(String str) => ShopUpdateProfileModel.fromJson(json.decode(str));

String ShopUpdateProfileModelToJson(ShopUpdateProfileModel data) => json.encode(data.toJson());

class ShopUpdateProfileModel {
  ShopUpdateProfileModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ShopUpdateProfileModel.fromJson(Map<String, dynamic> json) => ShopUpdateProfileModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
