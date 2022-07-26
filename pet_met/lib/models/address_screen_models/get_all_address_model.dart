// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) =>
    GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) =>
    json.encode(data.toJson());

class GetAllAddressModel {
  GetAllAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAllAddressModel(
        success: json["success"] ?? false,
        data:
            List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userid,
    required this.address,
    required this.isActive,
  });

  int id;
  int userid;
  String address;
  bool isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        userid: json["userid"] ?? 0,
        address: json["address"] ?? "",
        isActive: json["is_active"] == "1" ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "address": address,
        "is_active": isActive,
      };
}
