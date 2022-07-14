import 'dart:convert';

AllShopModel allShopModelFromJson(String str) => AllShopModel.fromJson(json.decode(str));

String allShopModelToJson(AllShopModel data) => json.encode(data.toJson());

class AllShopModel {
  AllShopModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<ShopData> data;
  String message;

  factory AllShopModel.fromJson(Map<String, dynamic> json) => AllShopModel(
    success: json["success"] ?? false,
    data: List<ShopData>.from(json["data"].map((x) => ShopData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ShopData {
  ShopData({
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
    required this.createdBy,
    // required this.modifiedBy,
    // required this.createdDate,
    // required this.modifiedDate,
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
  int createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
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
    offersimages: List<String>.from(json["offersimages"].map((x) => x ?? "")),
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x ?? "")),
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    createdBy: json["created_by"] ?? 0,
    // modifiedBy: json["modified_by"],
    // createdDate: DateTime.parse(json["created_date"]),
    // modifiedDate: json["modified_date"],
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
    "created_by": createdBy,
    // "modified_by": modifiedBy,
    // "created_date": createdDate.toIso8601String(),
    // "modified_date": modifiedDate,
  };
}
