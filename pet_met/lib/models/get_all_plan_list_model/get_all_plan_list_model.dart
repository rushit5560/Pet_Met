/*
class AllPlanListModel {
  bool? success;
  List<PlanData>? data;
  String? message;

  AllPlanListModel({this.success, this.data, this.message});

  AllPlanListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PlanData>[];
      json['data'].forEach((v) {
        data!.add(PlanData.fromJson(v ?? {}));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class PlanData {
  String? id;
  String? rs;
  String? name;
  String? overview;
  String? isActive;
  String? days;

  PlanData(
      {this.id, this.rs, this.name, this.overview, this.isActive, this.days});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    rs = json['rs'] ?? "";
    name = json['name'] ?? "";
    overview = json['overview'] ?? "";
    isActive = json['is_active'] ?? "";
    days = json['days'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rs'] = this.rs;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['is_active'] = this.isActive;
    data['days'] = this.days;
    return data;
  }
}*/

// To parse this JSON data, do
//
//     final allPlanListModel = allPlanListModelFromJson(jsonString);

import 'dart:convert';

AllPlanListModel allPlanListModelFromJson(String str) => AllPlanListModel.fromJson(json.decode(str));

String allPlanListModelToJson(AllPlanListModel data) => json.encode(data.toJson());

class AllPlanListModel {
  AllPlanListModel({
    required this.success,
    required this.date,
    required this.status,
    required this.message,
  });

  bool success;
  List<PlanData> date;
  bool status;
  String message;

  factory AllPlanListModel.fromJson(Map<String, dynamic> json) => AllPlanListModel(
    success: json["success"] ?? false,
    date: List<PlanData>.from(json["date"].map((x) => PlanData.fromJson(x ?? {}))),
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

class PlanData {
  PlanData({
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

  factory PlanData.fromJson(Map<String, dynamic> json) => PlanData(
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
    "updated_date": updatedDate
  };
}

