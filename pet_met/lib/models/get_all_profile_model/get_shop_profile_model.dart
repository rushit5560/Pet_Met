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
  List<dynamic> petdata;

  factory GetShopProfileModelData.fromJson(Map<String, dynamic> json) => GetShopProfileModelData(
    data: List<DataData>.from(json["data"].map((x) => DataData.fromJson(x))),
    petdata: List<dynamic>.from(json["petdata"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "petdata": List<dynamic>.from(petdata.map((x) => x)),
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
