// To parse this JSON data, do
//
//     final getUserStoryModel = getUserStoryModelFromJson(jsonString);

import 'dart:convert';

GetUserStoryModel getUserStoryModelFromJson(String str) => GetUserStoryModel.fromJson(json.decode(str));

String getUserStoryModelToJson(GetUserStoryModel data) => json.encode(data.toJson());

class GetUserStoryModel {
  GetUserStoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<GetUserStoryModelDatum> data;
  String message;

  factory GetUserStoryModel.fromJson(Map<String, dynamic> json) => GetUserStoryModel(
    success: json["success"] ?? false,
    data: List<GetUserStoryModelDatum>.from(json["data"].map((x) => GetUserStoryModelDatum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class GetUserStoryModelDatum {
  GetUserStoryModelDatum({
    required this.username,
    required this.data,
  });

  String username;
  List<DatumDatum> data;

  factory GetUserStoryModelDatum.fromJson(Map<String, dynamic> json) => GetUserStoryModelDatum(
    username: json["username"] ?? "",
    data: List<DatumDatum>.from(json["data"].map((x) => DatumDatum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumDatum {
  DatumDatum({
    required this.id,
    required this.userid,
    required this.image,
    required this.starttime,
    required this.endtime,
    required this.categoryId,
    required this.uid,
  });

  int id;
  int userid;
  String image;
  String starttime;
  String endtime;
  int categoryId;
  int uid;

  factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
    id: json["id"] ?? 0,
    userid: json["userid"] ?? 0,
    image: json["image"] ?? "",
    starttime: json["starttime"] ?? "",
    endtime: json["endtime"] ?? "",
    categoryId: json["categoryID"] ?? 0,
    uid: json["uid"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "image": image,
    "starttime": starttime,
    "endtime": endtime,
    "categoryID": categoryId,
    "uid": uid,
  };
}
