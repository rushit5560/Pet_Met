// To parse this JSON data, do
//
//     final getPetProfileModel = getPetProfileModelFromJson(jsonString);

import 'dart:convert';

GetPetProfileModel getPetProfileModelFromJson(String str) => GetPetProfileModel.fromJson(json.decode(str));

String getPetProfileModelToJson(GetPetProfileModel data) => json.encode(data.toJson());

class GetPetProfileModel {
  GetPetProfileModel({
     this.success,
     this.data,
     this.message,
  });

  bool ? success;
  List<Datum> ? data;
  String ? message;

  factory GetPetProfileModel.fromJson(Map<String, dynamic> json) => GetPetProfileModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.id,
    this.image,
    this.petName,
    this.mainCategory,
    this.subCategory,
    this.dob,
    this.weight,
    this.details,
    this.imageList,
    this.meetingAvailability,
    this.gender,
    this.isActive,
    this.userid,
  });

  String ? id;
  String ? image;
  String ? petName;
  String ? mainCategory;
  String ? subCategory;
  String ? dob;
  String ? weight;
  String ? details;
  String ? imageList;
  String ? meetingAvailability;
  String ? gender;
  String ? isActive;
  String ? userid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  };
}
