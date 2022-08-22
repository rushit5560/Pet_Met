import 'dart:convert';

GetPetDetailsModel getPetDetailsModelFromJson(String str) => GetPetDetailsModel.fromJson(json.decode(str));

String getPetDetailsModelToJson(GetPetDetailsModel data) => json.encode(data.toJson());

class GetPetDetailsModel {
  GetPetDetailsModel({
    required this.success,
    required this.date,
    required this.meettingstatus,
    required this.message,
  });

  bool success;
  List<PetData> date;
  bool meettingstatus;
  String message;

  factory GetPetDetailsModel.fromJson(Map<String, dynamic> json) => GetPetDetailsModel(
    success: json["success"] ?? false,
    date: List<PetData>.from(json["date"].map((x) => PetData.fromJson(x ?? {}))),
    meettingstatus: json["meettingstatus"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "meettingstatus": meettingstatus,
    "message": message,
  };
}

class PetData {
  PetData({
    this.id,
    this.image,
    this.petName,
    this.mainCategory,
    this.subCategory,
    this.dob,
    this.weight,
    this.details,
    // required this.imageList,
    this.meetingAvailability,
    this.gender,
    this.isActive,
    this.isVerified,
    this.categoryId,
    this.userid,
    this.createdBy,
    this.createdDate,
    this.updatedDate,
    this.modifiedBy,
  });

  String? id;
  String? image;
  String? petName;
  String? mainCategory;
  String? subCategory;
  String? dob;
  String? weight;
  String? details;
  // dynamic imageList;
  String? meetingAvailability;
  String? gender;
  String? isActive;
  String? isVerified;
  String? categoryId;
  String? userid;
  String? createdBy;
  String? createdDate;
  String? updatedDate;
  String? modifiedBy;

  factory PetData.fromJson(Map<String, dynamic> json) => PetData(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    petName: json["pet_name"] ?? "",
    mainCategory: json["main_category"] ?? "",
    subCategory: json["sub_category"] ?? "",
    dob: json["dob"] ?? "",
    weight: json["weight"] ?? "",
    details: json["details"] ?? "",
    // imageList: json["image_list"],
    meetingAvailability: json["meeting_availability"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    isVerified: json["is_verified"] ?? "",
    categoryId: json["categoryID"] ?? "",
    userid: json["userid"] ?? "",
    createdBy: json["created_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
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
    // "image_list": imageList,
    "meeting_availability": meetingAvailability,
    "gender": gender,
    "is_active": isActive,
    "is_verified": isVerified,
    "categoryID": categoryId,
    "userid": userid,
    "created_by": createdBy,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "modified_by": modifiedBy,
  };
}
