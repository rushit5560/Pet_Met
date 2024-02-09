/*
import 'dart:convert';

GetUserStoryModel getUserStoryModelFromJson(String str) => GetUserStoryModel.fromJson(json.decode(str));

String getUserStoryModelToJson(GetUserStoryModel data) => json.encode(data.toJson());

class GetUserStoryModel {
  GetUserStoryModel({
    required this.success,
    required this.date,
    required this.userstory,
    required this.message,
  });

  bool success;
  List<GetUserStoryModelDatum> date;
  List<Userstory> userstory;
  String message;

  factory GetUserStoryModel.fromJson(Map<String, dynamic> json) => GetUserStoryModel(
    success: json["success"] ?? false,
    date: List<GetUserStoryModelDatum>.from(json["date"].map((x) => GetUserStoryModelDatum.fromJson(x ?? {}))),
    userstory: List<Userstory>.from(json["userstory"].map((x) => Userstory.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "userstory": List<dynamic>.from(userstory.map((x) => x.toJson())),
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

  String id;
  String userid;
  String image;
  String starttime;
  String endtime;
  String categoryId;
  String uid;

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

class Userstory {
  Userstory({
    required this.id,
    required this.userid,
    required this.image,
    required this.starttime,
    required this.endtime,
    required this.categoryId,
  });

  String id;
  String userid;
  String image;
  String starttime;
  String endtime;
  String categoryId;

  factory Userstory.fromJson(Map<String, dynamic> json) => Userstory(
    id: json["id"] ?? "",
    userid: json["userid"] ?? "",
    image: json["image"] ?? "",
    starttime: json["starttime"] ?? "",
    endtime: json["endtime"] ?? "",
    categoryId: json["categoryID"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "image": image,
    "starttime": starttime,
    "endtime": endtime,
    "categoryID": categoryId,
  };
}

*/


import 'dart:convert';

GetUserStoryModel subscriptionOrdersModelFromJson(String str) => GetUserStoryModel.fromJson(json.decode(str));

String subscriptionOrdersModelToJson(GetUserStoryModel data) => json.encode(data.toJson());

class GetUserStoryModel {
  GetUserStoryModel({
    required this.success,
    required this.date,
    required this.userstory,
    required this.message,
  });

  bool success;
  List<GetUserStoryModelDatum> date;
  List<Userstory> userstory;
  String message;

  factory GetUserStoryModel.fromJson(Map<String, dynamic> json) => GetUserStoryModel(
    success: json["success"] ?? false,
    date: List<GetUserStoryModelDatum>.from(json["date"].map((x) => GetUserStoryModelDatum.fromJson(x ?? {}))),
    userstory: List<Userstory>.from(json["userstory"].map((x) => Userstory.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": List<dynamic>.from(date.map((x) => x.toJson())),
    "userstory": List<dynamic>.from(userstory.map((x) => x.toJson())),
    "message": message,
  };
}

class GetUserStoryModelDatum {
  GetUserStoryModelDatum({
    required this.username,
    required this.userimg,
    required this.data,
  });

  String username;
  String userimg;
  List<Userstory> data;

  factory GetUserStoryModelDatum.fromJson(Map<String, dynamic> json) => GetUserStoryModelDatum(
    username: json["username"] ?? "",
    userimg: json["userimg"] ?? "",
    data: List<Userstory>.from(json["data"].map((x) => Userstory.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "userimg": userimg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Userstory {
  Userstory({
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

  factory Userstory.fromJson(Map<String, dynamic> json) => Userstory(
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
