// To parse this JSON data, do
//
//     final petAddOrderModel = petAddOrderModelFromJson(jsonString);

import 'dart:convert';

PetAddOrderModel petAddOrderModelFromJson(String str) => PetAddOrderModel.fromJson(json.decode(str));

String petAddOrderModelToJson(PetAddOrderModel data) => json.encode(data.toJson());

class PetAddOrderModel {
  PetAddOrderModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory PetAddOrderModel.fromJson(Map<String, dynamic> json) => PetAddOrderModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
