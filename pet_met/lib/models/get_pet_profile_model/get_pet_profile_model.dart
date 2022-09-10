/*
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
  List<PetDatum> ? data;
  String ? message;

  factory GetPetProfileModel.fromJson(Map<String, dynamic> json) => GetPetProfileModel(
    success: json["success"] ?? false,
    data: List<PetDatum>.from(json["data"].map((x) => PetDatum.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class PetDatum {
  PetDatum({
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

  factory PetDatum.fromJson(Map<String, dynamic> json) => PetDatum(
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
*/


import 'dart:convert';

GetPetProfileModel getPetProfileModelFromJson(String str) => GetPetProfileModel.fromJson(json.decode(str));

String getPetProfileModelToJson(GetPetProfileModel data) => json.encode(data.toJson());

class GetPetProfileModel {
  GetPetProfileModel({
    required this.success,
    required this.date,
    required this.message,
  });

  bool success;
  List<PetDatum> date;
  String message;

  factory GetPetProfileModel.fromJson(Map<String, dynamic> json) => GetPetProfileModel(
    success: json["success"],
    date: List<PetDatum>.from(json["date"].map((x) => PetDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "message": message,
  };
}

class PetDatum {
  PetDatum({
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
    this.isVerified,
    this.categoryId,
    this.userid,
    // this.createdBy,
    // this.createdDate,
    // this.updatedDate,
    // this.modifiedBy,
  });

  String? id;
  String? image;
  String? petName;
  String? mainCategory;
  String? subCategory;
  String? dob;
  String? weight;
  String? details;
  String? imageList;
  String? meetingAvailability;
  String? gender;
  String? isActive;
  String? isVerified;
  String? categoryId;
  String? userid;
  // String createdBy;
  // DateTime createdDate;
  // dynamic updatedDate;
  // dynamic modifiedBy;

  factory PetDatum.fromJson(Map<String, dynamic> json) => PetDatum(
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
    isVerified: json["is_verified"] ?? "",
    categoryId: json["categoryID"] ?? "",
    userid: json["userid"] ?? "",
    // createdBy: json["created_by"],
    // createdDate: DateTime.parse(json["created_date"]),
    // updatedDate: json["updated_date"],
    // modifiedBy: json["modified_by"],
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
    "is_verified": isVerified,
    "categoryID": categoryId,
    "userid": userid,
    // "created_by": createdBy,
    // "created_date": createdDate.toIso8601String(),
    // "updated_date": updatedDate,
    // "modified_by": modifiedBy,
  };
}
