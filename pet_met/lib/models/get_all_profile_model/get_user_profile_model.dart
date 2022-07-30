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
  AllRoleProfileModelData data;
  String message;

  factory AllRoleProfileModel.fromJson(Map<String, dynamic> json) => AllRoleProfileModel(
    success: json["success"] ?? false,
    data: AllRoleProfileModelData.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class AllRoleProfileModelData {
  AllRoleProfileModelData({
    required this.data,
    required this.profiledata,
    //required this.shopprofiledata,
    required this.petdata,
  });

  DataData data;
  List<Profiledatum> profiledata;
  //List<ShopProfiledatum> shopprofiledata;
  List<Petdatum> petdata;

  factory AllRoleProfileModelData.fromJson(Map<String, dynamic> json) => AllRoleProfileModelData(
    data: DataData.fromJson(json["data"] ?? {}),
    profiledata: List<Profiledatum>.from(json["profiledata"].map((x) => Profiledatum.fromJson(x)) ?? {}),
    //shopprofiledata: List<ShopProfiledatum>.from(json["shopprofiledata"].map((x) => ShopProfiledatum.fromJson(x)) ?? {}),
    petdata: List<Petdatum>.from(json["petdata"].map((x) => Petdatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "profiledata": List<dynamic>.from(profiledata.map((x) => x.toJson())),
   // "shopprofiledata": List<dynamic>.from(shopprofiledata.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x.toJson())),
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
    isActive: json["is_active"],
    userid: json["userid"],
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

class Profiledatum {
  Profiledatum({
    required this.id,
    required this.name,
    required this.imageList,
    required this.showimg,
    required this.contact,
    required this.address,
    required this.isActive,
    required this.socialMedias,
    required this.openTime,
    required this.closeTime,
    required this.overview,
    required this.roleId,
    required this.userId,
  });

  int id;
  String name;
  String imageList;
  String showimg;
  String contact;
  String address;
  String isActive;
  String socialMedias;
  String openTime;
  String closeTime;
  String overview;
  String roleId;
  int userId;

  factory Profiledatum.fromJson(Map<String, dynamic> json) => Profiledatum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    imageList: json["image_list"] ?? "",
    showimg: json["showimg"] ?? "",
    contact: json["contact"] ?? "",
    address: json["address"] ?? "",
    isActive: json["is_active"] ?? "",
    socialMedias: json["social_medias"] ?? "",
    openTime: json["open_time"] ?? "",
    closeTime: json["close_time"] ?? "",
    overview: json["overview"] ?? "",
    roleId: json["role_id"] ?? "",
    userId: json["user_id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_list": imageList,
    "showimg": showimg,
    "contact": contact,
    "address": address,
    "is_active": isActive,
    "social_medias": socialMedias,
    "open_time": openTime,
    "close_time": closeTime,
    "overview": overview,
    "role_id": roleId,
    "user_id": userId,
  };
}

class ShopProfiledatum {
  ShopProfiledatum({
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

  factory ShopProfiledatum.fromJson(Map<String, dynamic> json) => ShopProfiledatum(
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
    createdDate: json["created_date"] ?? "",
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


