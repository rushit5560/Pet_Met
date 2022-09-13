// To parse this JSON data, do
//
//     final petShopProfileModel = petShopProfileModelFromJson(jsonString);

import 'dart:convert';

PetShopProfileModel petShopProfileModelFromJson(String str) => PetShopProfileModel.fromJson(json.decode(str));

String petShopProfileModelToJson(PetShopProfileModel data) => json.encode(data.toJson());

class PetShopProfileModel {
  PetShopProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory PetShopProfileModel.fromJson(Map<String, dynamic> json) => PetShopProfileModel(
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
    required this.meettingstatus,
  });

  List<Datum> data;
  List<ShopPetdatum> petdata;
  bool meettingstatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    petdata: List<ShopPetdatum>.from(json["petdata"].map((x) => ShopPetdatum.fromJson(x ?? {}))),
    meettingstatus: json["meettingstatus"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x.toJson())),
    "meettingstatus": meettingstatus,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.shopename,
    required this.email,
    required this.password,
    required this.address,
    required this.phonenumber,
    required this.shopopen,
    required this.shopclose,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.showimg,
    required this.offersimages,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.meetingimages,
    required this.sortorder,
    required this.status,
    required this.userid,
    required this.isActive,
    required this.categoryId,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.rememberToken,
    required this.isVerified,
    required this.startdate,
    required this.enddate,
    required this.uid,
  });

  String id;
  String shopename;
  String email;
  String password;
  String address;
  String phonenumber;
  String shopopen;
  String shopclose;
  String fullText;
  String instagram;
  String facebook;
  String showimg;
  List<String> offersimages;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  List<String> meetingimages;
  String sortorder;
  String status;
  String userid;
  String isActive;
  String categoryId;
  String createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String rememberToken;
  String isVerified;
  String startdate;
  String enddate;
  String uid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? "",
    shopename: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    address: json["address"] ?? "",
    phonenumber: json["phonenumber"] ?? "",
    shopopen: json["shopopen"] ?? "",
    shopclose: json["shopclose"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    showimg: json["showimg"] ?? "",
    offersimages: List<String>.from(json["offersimages"].map((x) => x ?? {})),
    image1: json["image1"] ?? "",
    image2: json["image2"] ?? "",
    image3: json["image3"] ?? "",
    image4: json["image4"] ?? "",
    image5: json["image5"] ?? "",
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x ?? {})),
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    userid: json["userid"] ?? "",
    isActive: json["is_active"] ?? "",
    categoryId: json["categoryID"] ?? "",
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
    startdate: json["startdate"] ?? "",
    enddate: json["enddate"] ?? "",
    uid: json["uid"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": shopename,
    "email": email,
    "password": password,
    "address": address,
    "phonenumber": phonenumber,
    "shopopen": shopopen,
    "shopclose": shopclose,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "showimg": showimg,
    "offersimages": List<dynamic>.from(offersimages.map((x) => x)),
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
    "sortorder": sortorder,
    "status": status,
    "userid": userid,
    "is_active": isActive,
    "categoryID": categoryId,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "remember_token": rememberToken,
    "is_verified": isVerified,
    "startdate": startdate,
    "enddate": enddate,
  };
}

class ShopPetdatum {
  ShopPetdatum({
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

  factory ShopPetdatum.fromJson(Map<String, dynamic> json) => ShopPetdatum(
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
