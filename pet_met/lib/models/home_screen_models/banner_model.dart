import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<BannerData> data;
  String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"] ?? false,
    data: List<BannerData>.from(json["data"].map((x) => BannerData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class BannerData {
  BannerData({
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.sortOrder,
    required this.isActive,
    // required this.createdDate,
    // required this.updatedDate,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  int brandId;
  String brandName;
  String brandImage;
  String sortOrder;
  int isActive;
  // DateTime createdDate;
  // DateTime updatedDate;
  // int createdBy;
  // int modifiedBy;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    brandId: json["brandID"] ?? 0,
    brandName: json["brandName"] ?? "",
    brandImage: json["brandImage"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    isActive: json["is_active"] ?? 0,
    // createdDate: DateTime.parse(json["created_date"]),
    // updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"] == null ? null : json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "brandID": brandId,
    "brandName": brandName,
    "brandImage": brandImage,
    "sort_order": sortOrder,
    "is_active": isActive,
    // "created_date": createdDate.toIso8601String(),
    // "updated_date": updatedDate == null ? null : updatedDate.toIso8601String(),
    // "created_by": createdBy,
    // "modified_by": modifiedBy == null ? null : modifiedBy,
  };
}
