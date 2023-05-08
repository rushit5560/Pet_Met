// To parse this JSON data, do
//
//     final getUserProfileModel = getUserProfileModelFromJson(jsonString);

import 'dart:convert';

GetUserProfileModel getUserProfileModelFromJson(String str) =>
    GetUserProfileModel.fromJson(json.decode(str));

String getUserProfileModelToJson(GetUserProfileModel data) =>
    json.encode(data.toJson());

class GetUserProfileModel {
  GetUserProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) =>
      GetUserProfileModel(
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

  List<UserData> data;
  List<Petdatum> petdata;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<UserData>.from(
            json["data"].map((x) => UserData.fromJson(x)) ?? {}),
        petdata: List<Petdatum>.from(
            json["petdata"].map((x) => Petdatum.fromJson(x)) ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "petdata": List<dynamic>.from(petdata.map((x) => x.toJson())),
      };
}

class UserData {
  UserData({
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
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.isActive,
    required this.isVerified,
    required this.displayName,
  });

  String id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  String country;
  String state;
  String city;
  String categoryId;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;
  String bod;
  String phone;
  String gender;
  String fullText;
  String instagram;
  String facebook;
  String isActive;
  String isVerified;
  String displayName;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: (json["id"] ?? 0).toString(),
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        password: json["password"] ?? "",
        rememberToken: json["remember_token"] ?? "",
        image: json["image"] ?? "",
        country: (json["country"] ?? 0).toString(),
        state: (json["state"] ?? 0).toString(),
        city: (json["city"] ?? 0).toString(),
        categoryId: (json["categoryID"] ?? 0).toString(),
        forgotpasswordToken: json["forgotpassword_token"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        bod: json["bod"] ?? "",
        phone: json["phone"] ?? "",
        gender: json["gender"] ?? "",
        fullText: json["full_text"] ?? "",
        instagram: json["instagram"] ?? "",
        facebook: json["facebook"] ?? "",
        isActive: json["is_active"] ?? "",
        isVerified: json["is_verified"] ?? "",
        displayName: json["display_name"] ?? "",
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
        "full_text": fullText,
        "instagram": instagram,
        "facebook": facebook,
        "is_active": isActive,
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
  String createdBy;
  String createdDate;
  String updatedDate;
  String modifiedBy;

  factory Petdatum.fromJson(Map<String, dynamic> json) => Petdatum(
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
