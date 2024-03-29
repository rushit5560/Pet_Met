// To parse this JSON data, do
//
//     final deleteAccountModel = deleteAccountModelFromJson(jsonString);

import 'dart:convert';

DeleteAccountModel deleteAccountModelFromJson(String str) => DeleteAccountModel.fromJson(json.decode(str));

String deleteAccountModelToJson(DeleteAccountModel data) => json.encode(data.toJson());

class DeleteAccountModel {
  DeleteAccountModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) => DeleteAccountModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
