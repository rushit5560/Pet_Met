import 'dart:convert';

ShopDetailsModel shopDetailsModelFromJson(String str) => ShopDetailsModel.fromJson(json.decode(str));

String shopDetailsModelToJson(ShopDetailsModel data) => json.encode(data.toJson());

class ShopDetailsModel {
  ShopDetailsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  ShopDetails data;
  String message;

  factory ShopDetailsModel.fromJson(Map<String, dynamic> json) => ShopDetailsModel(
    success: json["success"] ?? false,
    data: ShopDetails.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class ShopDetails {
  ShopDetails({
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
    this.createdBy,
    // required this.modifiedBy,
    // required this.createdDate,
    // required this.modifiedDate,
  });

  int? id;
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
  int? createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory ShopDetails.fromJson(Map<String, dynamic> json) => ShopDetails(
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
    "offersimages": List<dynamic>.from(offersimages!.map((x) => x)),
    "meetingimages": List<dynamic>.from(meetingimages!.map((x) => x)),
    "sortorder": sortorder,
    "status": status,
    "created_by": createdBy,
    // "modified_by": modifiedBy,
    // "created_date": createdDate.toIso8601String(),
    // "modified_date": modifiedDate,
  };
}
