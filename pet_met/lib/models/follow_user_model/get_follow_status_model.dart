// To parse this JSON data, do
//
//     final getFollowStatusModel = getFollowStatusModelFromJson(jsonString);

import 'dart:convert';

GetFollowStatusModel getFollowStatusModelFromJson(String str) => GetFollowStatusModel.fromJson(json.decode(str));

String getFollowStatusModelToJson(GetFollowStatusModel data) => json.encode(data.toJson());

class GetFollowStatusModel {
  GetFollowStatusModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory GetFollowStatusModel.fromJson(Map<String, dynamic> json) => GetFollowStatusModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
