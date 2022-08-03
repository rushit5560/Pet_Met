// To parse this JSON data, do
//
//     final vetAndNgoProfileModel = vetAndNgoProfileModelFromJson(jsonString);

import 'dart:convert';

VetAndNgoUpdateProfileModel vetAndNgoProfileModelFromJson(String str) => VetAndNgoUpdateProfileModel.fromJson(json.decode(str));

String vetAndNgoProfileModelToJson(VetAndNgoUpdateProfileModel data) => json.encode(data.toJson());

class VetAndNgoUpdateProfileModel {
  VetAndNgoUpdateProfileModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory VetAndNgoUpdateProfileModel.fromJson(Map<String, dynamic> json) => VetAndNgoUpdateProfileModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
