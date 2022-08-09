// To parse this JSON data, do
//
//     final getShopProfileModel = getShopProfileModelFromJson(jsonString);

import 'dart:convert';

GetShopProfileModel getShopProfileModelFromJson(String str) => GetShopProfileModel.fromJson(json.decode(str));

String getShopProfileModelToJson(GetShopProfileModel data) => json.encode(data.toJson());

class GetShopProfileModel {
  GetShopProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  GetShopProfileModelData data;
  String message;

  factory GetShopProfileModel.fromJson(Map<String, dynamic> json) => GetShopProfileModel(
    success: json["success"] ?? false,
    data: GetShopProfileModelData.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

/*class GetShopProfileModelData {
  GetShopProfileModelData({
    required this.data,
    required this.profiledata,
    required this.petdata,
  });

  DataData data;
  List<Profiledatum> profiledata;
  List<dynamic> petdata;

  factory GetShopProfileModelData.fromJson(Map<String, dynamic> json) => GetShopProfileModelData(
    data: DataData.fromJson(json["data"] ?? {}),
    profiledata: List<Profiledatum>.from(json["profiledata"].map((x) => Profiledatum.fromJson(x)) ?? {}),
    petdata: List<dynamic>.from(json["petdata"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "profiledata": List<dynamic>.from(profiledata.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x)),
  };
}*/

class GetShopProfileModelData {
  GetShopProfileModelData({
    required this.data,
    required this.petdata,
  });

  List<DataData> data;
  List<ShopPet> petdata;

  factory GetShopProfileModelData.fromJson(Map<String, dynamic> json) => GetShopProfileModelData(
    data: List<DataData>.from(json["data"].map((x) => DataData.fromJson(x)) ?? {}),
    petdata: List<ShopPet>.from(json["petdata"].map((x) => ShopPet.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x.toJson())),
  };
}

class DataData {
  DataData({
    required this.id,
    required this.shopename,
    required this.email,
    required this.address,
    required this.phonenumber,
    required this.shopopen,
    required this.shopclose,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.showimg,
    required this.offersimages,
    required this.meetingimages,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.sortorder,
    required this.status,
    required this.userid,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  int id;
  String shopename;
  String email;
  String address;
  String phonenumber;
  String shopopen;
  String shopclose;
  String fullText;
  String instagram;
  String facebook;
  String showimg;
  List<String> offersimages;
  List<String> meetingimages;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String sortorder;
  String status;
  int userid;
  int createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    id: json["id"] ?? 0,
    shopename: json["shopename"] ?? "",
    email: json["email"] ?? "",
    address: json["address"] ?? "",
    phonenumber: json["phonenumber"] ?? "",
    shopopen: json["shopopen"] ?? "",
    shopclose: json["shopclose"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    showimg: json["showimg"] ?? "",
    offersimages: List<String>.from(json["offersimages"].map((x) => x) ?? {}),
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x) ?? {}),
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    image4: json["image4"],
    image5: json["image5"],
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    userid: json["userid"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
    createdDate:json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopename": shopename,
    "email": email,
    "address": address,
    "phonenumber": phonenumber,
    "shopopen": shopopen,
    "shopclose": shopclose,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "showimg": showimg,
    "offersimages": List<dynamic>.from(offersimages.map((x) => x)),
    "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "sortorder": sortorder,
    "status": status,
    "userid": userid,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}

class ShopPet {
  ShopPet({
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

  factory ShopPet.fromJson(Map<String, dynamic> json) => ShopPet(
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

/*class Profiledatum {
  Profiledatum({
    required this.id,
    required this.shopename,
    required this.address,
    required this.phonenumber,
    required this.shopopen,
    required this.shopclose,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.showimg,
    required this.offersimages,
    required this.meetingimages,
    required this.sortorder,
    required this.status,
    required this.userid,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  int id;
  String shopename;
  String address;
  String phonenumber;
  String shopopen;
  String shopclose;
  String fullText;
  String instagram;
  String facebook;
  String showimg;
  List<String> offersimages;
  List<String> meetingimages;
  String sortorder;
  String status;
  int userid;
  int createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;

  factory Profiledatum.fromJson(Map<String, dynamic> json) => Profiledatum(
    id: json["id"] ?? 0,
    shopename: json["shopename"] ?? "",
    address: json["address"] ?? "",
    phonenumber: json["phonenumber"] ?? "",
    shopopen: json["shopopen"] ?? "",
    shopclose: json["shopclose"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    showimg: json["showimg"] ?? "",
    offersimages: List<String>.from(json["offersimages"].map((x) => x) ?? {}),
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x) ?? {}),
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    userid: json["userid"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
    createdDate:json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopename": shopename,
    "address": address,
    "phonenumber": phonenumber,
    "shopopen": shopopen,
    "shopclose": shopclose,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "showimg": showimg,
    "offersimages": List<dynamic>.from(offersimages.map((x) => x)),
    "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
    "sortorder": sortorder,
    "status": status,
    "userid": userid,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}*/
