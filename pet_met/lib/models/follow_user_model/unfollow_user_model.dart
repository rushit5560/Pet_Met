// To parse this JSON data, do
//
//     final unFollowUserModel = unFollowUserModelFromJson(jsonString);

import 'dart:convert';

UnFollowUserModel unFollowUserModelFromJson(String str) => UnFollowUserModel.fromJson(json.decode(str));

String unFollowUserModelToJson(UnFollowUserModel data) => json.encode(data.toJson());

class UnFollowUserModel {
  UnFollowUserModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UnFollowUserModel.fromJson(Map<String, dynamic> json) => UnFollowUserModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
