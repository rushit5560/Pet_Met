// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

/*import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    //required this.bannerId,
    required this.title,
    required this.sortOrder,
    required this.url,
    required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    //required this.createdBy,
    required this.modifiedBy,
  });

  //String bannerId;
  String title;
  String sortOrder;
  String url;
  String link;
  String image;
  String imagePath;
  String content;
  int position;
  String isActive;
  String createdDate;
  String modifiedDate;
  //String createdBy;
  String modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    //bannerId: json["banner_id"] ?? "",
    title: json["title"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    url: json["url"] ?? "",
    link: json["link"] ?? "",
    image: json["image"] ?? "",
    imagePath: json["image_path"] ?? "",
    content: json["content"] ?? "",
    position: json["position"] ?? 0,
    isActive: json["is_active"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    //createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    //"banner_id": bannerId,
    "title": title,
    "sort_order": sortOrder,
    "url": url,
    "link": link,
    "image": image,
    "image_path": imagePath,
    "content": content,
    "position": position,
    "is_active": isActive,
    "created_date": createdDate,
    "modified_date": modifiedDate,
   // "created_by": createdBy,
    "modified_by": modifiedBy,
  };
}*/


// Shop Banner Model
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
  List<Datum> data;
  String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required  this.id,
  });

  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(
        image1: json["image1"] ?? "",
        image2: json["image2"] ?? "",
        image3: json["image3"] ?? "",
        image4: json["image4"] ?? "",
        image5: json["image5"] ?? "",
        id: json["id"] ?? "",
      );

  Map<String, dynamic> toJson() =>
      {
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "id": id,
      };
}