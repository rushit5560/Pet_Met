import 'dart:convert';

PetCareModel petCareModelFromJson(String str) =>
    PetCareModel.fromJson(json.decode(str));

String petCareModelToJson(PetCareModel data) => json.encode(data.toJson());

class PetCareModel {
  PetCareModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory PetCareModel.fromJson(Map<String, dynamic> json) => PetCareModel(
        success: json["success"] ?? false,
        data:
            List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {}))),
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
    required this.id,
    required this.title,
    required this.content,
    required this.isActive,
    required this.featuredimage,
    required this.featuredimageparth,
    // required this.metaTitle,
    // required this.metaDec,
    // required this.metaKey,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String title;
  String content;
  String isActive;
  String featuredimage;
  String featuredimageparth;
  // String metaTitle;
  // String metaDec;
  // String metaKey;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        isActive: json["is_active"] ?? "",
        featuredimage: json["featuredimage"] ?? "",
        featuredimageparth: json["featuredimageparth"] ?? "",
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
        "featuredimageparth": featuredimageparth,
        // "meta_title": metaTitle,
        // "meta_dec": metaDec,
        // "meta_key": metaKey,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
