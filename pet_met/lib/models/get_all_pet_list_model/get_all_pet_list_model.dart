// To parse this JSON data, do
//
//     final getPetTopListModel = getPetTopListModelFromJson(jsonString);

import 'dart:convert';

GetPetTopListModel getPetTopListModelFromJson(String str) => GetPetTopListModel.fromJson(json.decode(str));

String getPetTopListModelToJson(GetPetTopListModel data) => json.encode(data.toJson());

class GetPetTopListModel {
  GetPetTopListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<PetList> data;
  String message;

  factory GetPetTopListModel.fromJson(Map<String, dynamic> json) => GetPetTopListModel(
    success: json["success"] ?? false,
    data: List<PetList>.from(json["data"].map((x) => PetList.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PetList {
  PetList({
    required this.id,
    required this.image,
    required this.petName,
    required this.mainCategory,
    required this.subCategory,
    required this.dob,
    required this.weight,
    required this.details,
    required this.imageList,
    required this.meetingAvailability,
    required this.gender,
    required this.isActive,
    required this.userid,
    required this.categoryId,
  });

  int id;
  String image;
  String petName;
  int mainCategory;
  int subCategory;
  String dob;
  int weight;
  String details;
  String imageList;
  String meetingAvailability;
  String gender;
  String isActive;
  int userid;
  int categoryId;

  factory PetList.fromJson(Map<String, dynamic> json) => PetList(
    id: json["id"] ?? 0,
    image: json["image"] ?? "",
    petName: json["pet_name"] ?? "",
    mainCategory: json["main_category"] ?? 0,
    subCategory: json["sub_category"] ?? 0,
    dob: json["dob"] ?? "",
    weight: json["weight"] ?? 0,
    details: json["details"] ?? "",
    imageList: json["image_list"] ?? "",
    meetingAvailability: json["meeting_availability"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "pet_name": petName,
    "main_category": mainCategory,
    "sub_category": subCategory,
    "dob": dob,
    "weight": weight,
    "details": details,
    "image_list": imageList,
    "meeting_availability": meetingAvailability,
    "gender": gender,
    "is_active": isActive,
    "userid": userid,
    "categoryId": categoryId,
  };
}

