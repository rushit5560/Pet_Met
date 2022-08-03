// To parse this JSON data, do
//
//     final updateUserProfileModel = updateUserProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileModel updateUserProfileModelFromJson(String str) => UpdateUserProfileModel.fromJson(json.decode(str));

String updateUserProfileModelToJson(UpdateUserProfileModel data) => json.encode(data.toJson());

class UpdateUserProfileModel {
  UpdateUserProfileModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
