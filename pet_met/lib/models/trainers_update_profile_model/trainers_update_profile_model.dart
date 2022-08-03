// To parse this JSON data, do
//
//     final updateTrainersProfileModel = updateTrainersProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateTrainersProfileModel updateTrainersProfileModelFromJson(String str) => UpdateTrainersProfileModel.fromJson(json.decode(str));

String updateTrainersProfileModelToJson(UpdateTrainersProfileModel data) => json.encode(data.toJson());

class UpdateTrainersProfileModel {
  UpdateTrainersProfileModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UpdateTrainersProfileModel.fromJson(Map<String, dynamic> json) => UpdateTrainersProfileModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
