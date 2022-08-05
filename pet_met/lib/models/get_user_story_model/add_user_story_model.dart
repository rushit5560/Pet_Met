// To parse this JSON data, do
//
//     final addUserStoryModel = addUserStoryModelFromJson(jsonString);

import 'dart:convert';

AddUserStoryModel addUserStoryModelFromJson(String str) => AddUserStoryModel.fromJson(json.decode(str));

String addUserStoryModelToJson(AddUserStoryModel data) => json.encode(data.toJson());

class AddUserStoryModel {
  AddUserStoryModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory AddUserStoryModel.fromJson(Map<String, dynamic> json) => AddUserStoryModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
