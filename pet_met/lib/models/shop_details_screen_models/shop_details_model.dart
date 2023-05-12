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
    required this.showstatus,
    required this.petImage,
    this.error,
  });

  bool success;
  List<ShopData> data;
  String message;
  bool showstatus;
  List<String> petImage;
  String? error;

  factory ShopDetailsModel.fromJson(Map<String, dynamic> json) =>
      ShopDetailsModel(
        success: json["success"] ?? false,
        data: List<ShopData>.from(
            json["data"].map((x) => ShopData.fromJson(x ?? {}))),
            petImage: List<String>.from(json["pet_image"].map((x) => x)),
        message: json["message"] ?? "",
        showstatus: json["showstatus"],
        error: json["error"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pet_image": List<dynamic>.from(petImage.map((x) => x)),
        "message": message,
        "showstatus": showstatus,
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
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.meetingimages,
    this.sortorder,
    this.categoryID,
    this.status,
    this.isVerified,
    this.gpayupi,
    this.email,
    this.displayName,
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
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  List<String>? meetingimages;
  String? sortorder;
  String? categoryID;
  String? status;
  String? isVerified;

  String? gpayupi;
  String? email;
  String? displayName;

  // int createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        id: json["id"] ?? "",
        shopename: json["name"] ?? "",
        address: json["address"] ?? "",
        phonenumber: json["phonenumber"] ?? "",
        shopopen: json["shopopen"] ?? "",
        shopclose: json["shopclose"] ?? "",
        fullText: json["full_text"] ?? "",
        instagram: json["instagram"] ?? "",
        facebook: json["facebook"] ?? "",
        showimg: json["showimg"] ?? "",
        offersimages:
            List<String>.from(json["offersimages"].map((x) => x ?? {})),
        image1: json["image1"] ?? "",
        image2: json["image2"] ?? "",
        image3: json["image3"] ?? "",
        image4: json["image4"] ?? "",
        image5: json["image5"] ?? "",
        meetingimages:
            List<String>.from(json["meetingimages"].map((x) => x ?? {})),
        sortorder: json["sortorder"] ?? "",
        categoryID: json["categoryID"] ?? "",
        status: json["status"] ?? "",
        isVerified: json["is_verified"] ?? "1",
        gpayupi: json["gpayupi"] ?? "",
        email: json["email"] ?? "",
        displayName: json["display_name"] ?? "",
        // createdBy: json["created_by"],
        // modifiedBy: json["modified_by"],
        // createdDate: DateTime.parse(json["created_date"]),
        // modifiedDate: json["modified_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": shopename,
        "address": address,
        "phonenumber": phonenumber,
        "shopopen": shopopen,
        "shopclose": shopclose,
        "full_text": fullText,
        "instagram": instagram,
        "facebook": facebook,
        "showimg": showimg,
        "offersimages": List<dynamic>.from(offersimages!.map((x) => x)),
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "meetingimages": List<dynamic>.from(meetingimages!.map((x) => x)),
        "sortorder": sortorder,
        "categoryID": categoryID,
        "status": status,
        "is_verified": isVerified,
        "gpayupi": gpayupi,
        "email": email,
        // "created_by": createdBy,
        // "modified_by": modifiedBy,
        // "created_date": createdDate.toIso8601String(),
        // "modified_date": modifiedDate,
      };
}
