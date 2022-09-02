// To parse this JSON data, do
//
//     final singlePlanDetailModel = singlePlanDetailModelFromJson(jsonString);

import 'dart:convert';

SinglePlanDetailModel singlePlanDetailModelFromJson(String str) => SinglePlanDetailModel.fromJson(json.decode(str));

String singlePlanDetailModelToJson(SinglePlanDetailModel data) => json.encode(data.toJson());

class SinglePlanDetailModel {
  SinglePlanDetailModel({
    required this.success,
    required this.date,
    required this.status,
    required this.message,
  });

  bool success;
  List<Date> date;
  bool status;
  String message;

  factory SinglePlanDetailModel.fromJson(Map<String, dynamic> json) => SinglePlanDetailModel(
    success: json["success"] ?? false,
    date: List<Date>.from(json["date"].map((x) => Date.fromJson(x ?? {}))),
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Date {
  Date({
    required this.id,
    required this.rs,
    required this.name,
    required this.overview,
    required this.isActive,
    required this.days,
    required this.userid,
    required this.categoryId,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.updatedDate,
  });

  String id;
  String rs;
  String name;
  String overview;
  String isActive;
  String days;
  String userid;
  String categoryId;
  String createdBy;
  String createdDate;
  String modifiedBy;
  String updatedDate;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"] ?? "",
    rs: json["rs"] ?? "",
    name: json["name"] ?? "",
    overview: json["overview"] ?? "",
    isActive: json["is_active"] ?? "",
    days: json["days"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
    createdBy: json["created_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    updatedDate: json["updated_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rs": rs,
    "name": name,
    "overview": overview,
    "is_active": isActive,
    "days": days,
    "userid": userid,
    "categoryID": categoryId,
    "created_by": createdBy,
    "created_date": createdDate,
    "modified_by": modifiedBy,
    "updated_date": updatedDate,
  };
}
