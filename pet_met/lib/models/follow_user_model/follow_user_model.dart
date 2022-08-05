// To parse this JSON data, do
//
//     final followUserModel = followUserModelFromJson(jsonString);

import 'dart:convert';

FollowUserModel followUserModelFromJson(String str) => FollowUserModel.fromJson(json.decode(str));

String followUserModelToJson(FollowUserModel data) => json.encode(data.toJson());

class FollowUserModel {
  FollowUserModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory FollowUserModel.fromJson(Map<String, dynamic> json) => FollowUserModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
