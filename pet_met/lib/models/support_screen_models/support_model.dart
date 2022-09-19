import 'dart:convert';

SupportModel supportModelFromJson(String str) =>
    SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel {
  SupportModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<SupportData> data;
  String message;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        success: json["success"] ?? false,
        data: List<SupportData>.from(
            json["data"].map((x) => SupportData.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class SupportData {
  SupportData({
    this.id,
    this.title,
    this.content,
    this.isActive,
    this.featuredimage,
    this.featuredimagepath,
    // required this.metaTitle,
    // required this.metaDec,
    // required this.metaKey,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String? id;
  String? title;
  String? content;
  String? isActive;
  String? featuredimage;
  String? featuredimagepath;
  // dynamic metaTitle;
  // dynamic metaDec;
  // dynamic metaKey;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory SupportData.fromJson(Map<String, dynamic> json) => SupportData(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        isActive: json["is_active"] ?? "",
        featuredimage: json["featuredimage"] ?? "",
        featuredimagepath: json["featuredimagepath"] ?? "",
        // metaTitle: json["meta_title"],
        // metaDec: json["meta_dec"],
        // metaKey: json["meta_key"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "is_active": isActive,
        "featuredimage": featuredimage,
        "featuredimagepath": featuredimagepath,
        // "meta_title": metaTitle,
        // "meta_dec": metaDec,
        // "meta_key": metaKey,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
