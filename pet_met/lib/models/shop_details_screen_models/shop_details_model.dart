import 'dart:convert';

ShopDetailsModel shopDetailsModelFromJson(String str) =>
    ShopDetailsModel.fromJson(json.decode(str));

String shopDetailsModelToJson(ShopDetailsModel data) =>
    json.encode(data.toJson());

class ShopDetailsModel {
  ShopDetailsModel({
    required this.success,
    required this.data,
    required this.message,
    this.error,
  });

  bool success;
  ShopData data;
  String message;
  String? error;

  factory ShopDetailsModel.fromJson(Map<String, dynamic> json) =>
      ShopDetailsModel(
        success: json["success"] ?? false,
        data: ShopData.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
        error: json["error"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "error": error,
      };
}

class ShopData {
  ShopData({
    this.id,
    this.shopename,
    this.address,
    this.phonenumber,
    this.shopopen,
    this.shopclose,
    this.fullText,
    this.instagram,
    this.facebook,
    this.showimg,
    this.offersimages,
    this.meetingimages,
    this.sortorder,
    this.status,
    // this.createdBy,
    // this.modifiedBy,
    // this.createdDate,
    // this.modifiedDate,
  });

  String? id;
  String? shopename;
  String? address;
  String? phonenumber;
  String? shopopen;
  String? shopclose;
  String? fullText;
  String? instagram;
  String? facebook;
  String? showimg;
  List<String>? offersimages;
  List<String>? meetingimages;
  String? sortorder;
  String? status;
  // int createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        id: json["id"] ?? "",
        shopename: json["shopename"] ?? "",
        address: json["address"] ?? "",
        phonenumber: json["phonenumber"] ?? "",
        shopopen: json["shopopen"] ?? "",
        shopclose: json["shopclose"] ?? "",
        fullText: json["full_text"] ?? "",
        instagram: json["instagram"] ?? "",
        facebook: json["facebook"] ?? "",
        showimg: json["showimg"] ?? "",
        offersimages:
            List<String>.from(json["offersimages"].map((x) => x ?? "")),
        meetingimages:
            List<String>.from(json["meetingimages"].map((x) => x ?? "")),
        sortorder: json["sortorder"] ?? "",
        status: json["status"] ?? "",
        // createdBy: json["created_by"],
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
        "offersimages": List<dynamic>.from(offersimages!.map((x) => x)),
        "meetingimages": List<dynamic>.from(meetingimages!.map((x) => x)),
        "sortorder": sortorder,
        "status": status,
        // "created_by": createdBy,
        // "modified_by": modifiedBy,
        // "created_date": createdDate.toIso8601String(),
        // "modified_date": modifiedDate,
      };
}
