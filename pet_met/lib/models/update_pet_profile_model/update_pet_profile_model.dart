// To parse this JSON data, do
//
//     final updatePetProfileModel = updatePetProfileModelFromJson(jsonString);

import 'dart:convert';

UpdatePetProfileModel updatePetProfileModelFromJson(String str) => UpdatePetProfileModel.fromJson(json.decode(str));

String updatePetProfileModelToJson(UpdatePetProfileModel data) => json.encode(data.toJson());

class UpdatePetProfileModel {
  UpdatePetProfileModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UpdatePetProfileModel.fromJson(Map<String, dynamic> json) => UpdatePetProfileModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
