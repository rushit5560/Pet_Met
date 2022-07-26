import 'dart:convert';

AllVetAndNgoModel allVetAndNgoModelFromJson(String str) =>
    AllVetAndNgoModel.fromJson(json.decode(str));

String allVetAndNgoModelToJson(AllVetAndNgoModel data) =>
    json.encode(data.toJson());

class AllVetAndNgoModel {
  AllVetAndNgoModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<VetAndNgoData> data;
  String message;

  factory AllVetAndNgoModel.fromJson(Map<String, dynamic> json) =>
      AllVetAndNgoModel(
        success: json["success"] ?? false,
        data: List<VetAndNgoData>.from(
            json["data"].map((x) => VetAndNgoData.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class VetAndNgoData {
  VetAndNgoData({
    required this.id,
    required this.name,
    required this.imageList,
    required this.showimg,
    required this.contact,
    required this.address,
    required this.isActive,
    required this.socialMedias,
    required this.openTime,
    required this.closeTime,
    required this.overview,
    required this.roleId,
    required this.userId,
  });

  int id;
  String name;
  String imageList;
  String showimg;
  int contact;
  String address;
  String isActive;
  String socialMedias;
  String openTime;
  String closeTime;
  String overview;
  int roleId;
  int userId;

  factory VetAndNgoData.fromJson(Map<String, dynamic> json) => VetAndNgoData(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        imageList: json["image_list"] ?? "",
        showimg: json["showimg"] ?? "",
        contact: json["contact"] ?? "",
        address: json["address"] ?? "",
        isActive: json["is_active"] ?? "",
        socialMedias: json["social_medias"] ?? "",
        openTime: json["open_time"] ?? "",
        closeTime: json["close_time"] ?? "",
        overview: json["overview"] ?? "",
        roleId: json["role_id"] ?? 0,
        userId: json["user_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_list": imageList,
        "showimg": showimg,
        "contact": contact,
        "address": address,
        "is_active": isActive,
        "social_medias": socialMedias,
        "open_time": openTime,
        "close_time": closeTime,
        "overview": overview,
        "role_id": roleId,
        "user_id": userId,
      };
}
