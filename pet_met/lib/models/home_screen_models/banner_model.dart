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
    required this.bannerId,
    required this.title,
    // required this.sortOrder,
    // required this.url,
    // required this.bannerGroupId,
    // required this.containerName,
    required this.viewPageCount,
    // required this.bannerGroupBannerGroupId,
    // required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    // required this.createdDate,
    // required this.modifiedDate,
    // required this.createdBy,
    // required this.modifiedBy,
  });

  int bannerId;
  String title;
  // dynamic sortOrder;
  // dynamic url;
  // dynamic bannerGroupId;
  // dynamic containerName;
  int viewPageCount;
  // dynamic bannerGroupBannerGroupId;
  // dynamic link;
  String image;
  String imagePath;
  String content;
  int position;
  int isActive;
  // DateTime createdDate;
  // dynamic modifiedDate;
  // int createdBy;
  // dynamic modifiedBy;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    bannerId: json["banner_id"] ?? 0,
    title: json["title"] ?? "",
    // sortOrder: json["sort_order"],
    // url: json["url"],
    // bannerGroupId: json["banner_group_id"],
    // containerName: json["container_name"],
    viewPageCount: json["view_page_count"] ?? 0,
    // bannerGroupBannerGroupId: json["banner_group_banner_group_id"],
    // link: json["link"],
    image: json["image"] ?? "",
    imagePath: json["image_path"] ?? "",
    content: json["content"] ?? "",
    position: json["position"] ?? 0,
    isActive: json["is_active"] ?? 0,
    // createdDate: DateTime.parse(json["created_date"]),
    // modifiedDate: json["modified_date"],
    // createdBy: json["created_by"],
    // modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "title": title,
    // "sort_order": sortOrder,
    // "url": url,
    // "banner_group_id": bannerGroupId,
    // "container_name": containerName,
    "view_page_count": viewPageCount,
    // "banner_group_banner_group_id": bannerGroupBannerGroupId,
    // "link": link,
    "image": image,
    "image_path": imagePath,
    "content": content,
    "position": position,
    "is_active": isActive,
    // "created_date": createdDate.toIso8601String(),
    // "modified_date": modifiedDate,
    // "created_by": createdBy,
    // "modified_by": modifiedBy,
  };
}
