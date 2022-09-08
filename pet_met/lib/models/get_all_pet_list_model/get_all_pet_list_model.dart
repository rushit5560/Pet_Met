/*
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

  String id;
  String image;
  String petName;
  String mainCategory;
  String subCategory;
  String dob;
  String weight;
  String details;
  String imageList;
  String meetingAvailability;
  String gender;
  String isActive;
  String userid;
  String categoryId;

  factory PetList.fromJson(Map<String, dynamic> json) => PetList(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    petName: json["pet_name"] ?? "",
    mainCategory: json["main_category"] ?? "",
    subCategory: json["sub_category"] ?? "",
    dob: json["dob"] ?? "",
    weight: json["weight"] ?? "",
    details: json["details"] ?? "",
    imageList: json["image_list"] ?? "",
    meetingAvailability: json["meeting_availability"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
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

*/


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
  List<PetDatum> data;
  String message;

  factory GetPetTopListModel.fromJson(Map<String, dynamic> json) => GetPetTopListModel(
    success: json["success"] ?? false,
    data: List<PetDatum>.from(json["data"].map((x) => PetDatum.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PetDatum {
  PetDatum({
    required this.data,
    required this.img,
  });

  PetList data;
  String img;

  factory PetDatum.fromJson(Map<String, dynamic> json) => PetDatum(
    data: PetList.fromJson(json["data"] ?? {}),
    img: json["img"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "img": img,
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

  String id;
  String image;
  String petName;
  String mainCategory;
  String subCategory;
  String dob;
  String weight;
  String details;
  String imageList;
  String meetingAvailability;
  String gender;
  String isActive;
  String userid;
  String categoryId;

  factory PetList.fromJson(Map<String, dynamic> json) => PetList(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    petName: json["pet_name"] ?? "",
    mainCategory: json["main_category"] ?? "",
    subCategory: json["sub_category"] ?? "",
    dob: json["dob"] ?? "",
    weight: json["weight"] ?? "",
    details: json["details"] ?? "",
    imageList: json["image_list"] ?? "",
    meetingAvailability: json["meeting_availability"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
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
