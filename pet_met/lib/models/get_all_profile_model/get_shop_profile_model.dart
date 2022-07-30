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

class GetShopProfileModelData {
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
}

class DataData {
  DataData({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.categoryId,
    required this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
    required this.bod,
    required this.phone,
    required this.gender,
    required this.isActive,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  int country;
  int state;
  int city;
  int categoryId;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;
  String bod;
  String phone;
  String gender;
  String isActive;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    password: json["password"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    image: json["image"] ?? "",
    country: json["country"] ?? 0,
    state: json["state"] ?? 0,
    city: json["city"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
    forgotpasswordToken: json["forgotpassword_token"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    bod: json["bod"] ?? "",
    phone: json["phone"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "remember_token": rememberToken,
    "image": image,
    "country": country,
    "state": state,
    "city": city,
    "categoryID": categoryId,
    "forgotpassword_token": forgotpasswordToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "bod": bod,
    "phone": phone,
    "gender": gender,
    "is_active": isActive,
  };
}

class Profiledatum {
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
  String offersimages;
  String meetingimages;
  String sortorder;
  String status;
  int userid;
  String createdBy;
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
    offersimages: json["offersimages"] ?? "",
    meetingimages: json["meetingimages"] ?? "",
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    userid: json["userid"] ?? 0,
    createdBy: json["created_by"] ?? "",
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
    "offersimages": offersimages,
    "meetingimages": meetingimages,
    "sortorder": sortorder,
    "status": status,
    "userid": userid,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}
