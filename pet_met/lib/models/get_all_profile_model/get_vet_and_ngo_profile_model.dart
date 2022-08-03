// To parse this JSON data, do
//
//     final allRoleProfileModel = allRoleProfileModelFromJson(jsonString);

import 'dart:convert';

AllRoleProfileModel allRoleProfileModelFromJson(String str) => AllRoleProfileModel.fromJson(json.decode(str));

String allRoleProfileModelToJson(AllRoleProfileModel data) => json.encode(data.toJson());

class AllRoleProfileModel {
  AllRoleProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory AllRoleProfileModel.fromJson(Map<String, dynamic> json) => AllRoleProfileModel(
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.data,
    required this.petdata,
  });

  List<Datum> data;
  List<Petdatum> petdata;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    petdata: List<Petdatum>.from(json["petdata"].map((x) => Petdatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phone,
    required this.open,
    required this.close,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.image,
    required this.vetNgoimages,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.meetingimages,
    required this.isActive,
    required this.ifscCode,
    required this.accountCode,
    required this.userid,
    required this.categoryId,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.rememberToken,
    required this.isVerified,
  });

  int id;
  String name;
  String email;
  String password;
  String address;
  String phone;
  String open;
  String close;
  String fullText;
  String instagram;
  String facebook;
  String image;
  List<String> vetNgoimages;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  List<String> meetingimages;
  String isActive;
  String ifscCode;
  String accountCode;
  int userid;
  int categoryId;
  int createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String rememberToken;
  String isVerified;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    open: json["open"] ?? "",
    close: json["close"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    image: json["image"] ?? "",
    vetNgoimages: List<String>.from(json["vet_ngoimages"].map((x) => x) ?? {}),
    image1: json["image1"] ?? "",
    image2: json["image2"] ?? "",
    image3: json["image3"] ?? "",
    image4: json["image4"] ?? "",
    image5: json["image5"] ?? "",
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x) ?? {}),
    isActive: json["is_active"] ?? "",
    ifscCode: json["ifsc_code"] ?? "",
    accountCode: json["account_code"] ?? "",
    userid: json["userid"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "address": address,
    "phone": phone,
    "open": open,
    "close": close,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "image": image,
    "vet_ngoimages": List<dynamic>.from(vetNgoimages.map((x) => x)),
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
    "is_active": isActive,
    "ifsc_code": ifscCode,
    "account_code": accountCode,
    "userid": userid,
    "categoryID": categoryId,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "remember_token": rememberToken,
    "is_verified": isVerified,
  };
}

class Petdatum {
  Petdatum({
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
    required this.createdBy,
    required this.createdDate,
    required this.updatedDate,
    required this.modifiedBy,
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
  int createdBy;
  String createdDate;
  String updatedDate;
  String modifiedBy;

  factory Petdatum.fromJson(Map<String, dynamic> json) => Petdatum(
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
    createdBy: json["created_by"] ?? 0,
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
    "image_list": imageList,
    "meeting_availability": meetingAvailability,
    "gender": gender,
    "is_active": isActive,
    "userid": userid,
    "created_by": createdBy,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "modified_by": modifiedBy,
  };
}

