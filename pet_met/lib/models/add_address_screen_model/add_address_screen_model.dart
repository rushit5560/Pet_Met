// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  String data;
  String message;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    success: json["success"] ?? false,
    data: json["data"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
    "message": message,
  };
}
