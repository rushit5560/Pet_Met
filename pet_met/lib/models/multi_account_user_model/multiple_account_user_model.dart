// To parse this JSON data, do
//
//     final multiAccountUserModel = multiAccountUserModelFromJson(jsonString);

import 'dart:convert';

MultiAccountUserModel multiAccountUserModelFromJson(String str) => MultiAccountUserModel.fromJson(json.decode(str));

String multiAccountUserModelToJson(MultiAccountUserModel data) => json.encode(data.toJson());

class MultiAccountUserModel {
  MultiAccountUserModel({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  Data data;

  factory MultiAccountUserModel.fromJson(Map<String, dynamic> json) => MultiAccountUserModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.trainer,
    required this.shope,
    required this.vetNgo,
  });

  List<User> user;
  List<Trainer> trainer;
  List<Shop> shope;
  List<VetNgo> vetNgo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x ?? {}))),
    trainer: List<Trainer>.from(json["trainer"].map((x) => Trainer.fromJson(x ?? {}))),
    shope: List<Shop>.from(json["shope"].map((x) => Shop.fromJson(x ?? {}))),
    vetNgo: List<VetNgo>.from(json["vet_ngo"].map((x) => VetNgo.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
    "trainer": List<dynamic>.from(trainer.map((x) => x.toJson())),
    "shope": List<dynamic>.from(shope.map((x) => x.toJson())),
    "vet_ngo": List<dynamic>.from(vetNgo.map((x) => x.toJson())),
  };
}

class Shop {
  Shop({
    required this.id,
    required this.shopename,
    required this.email,
    required this.userid,
    required this.isActive,
  });

  String id;
  String shopename;
  String email;
  String userid;
  String isActive;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"] ?? "",
    shopename: json["shopename"] ?? "",
    email: json["email"] ?? "",
    userid: json["userid"] ?? "",
    isActive: json["is_active"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopename": shopename,
    "email": email,
    "userid": userid,
    "is_active": isActive,
  };
}

class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.categoryId,
  });

  String id;
  String name;
  String email;
  String isActive;
  String categoryId;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    isActive: json["is_active"] ?? "",
    categoryId: json["categoryID"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "is_active": isActive,
    "categoryID": categoryId,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.categoryId,
    required this.isActive,
  });

  String id;
  String name;
  String email;
  String categoryId;
  String isActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    categoryId: json["categoryID"] ?? "",
    isActive: json["is_active"] ?? "1",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "categoryID": categoryId,
    "is_active": isActive,
  };
}

class VetNgo {
  VetNgo({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.userid,
  });

  String id;
  String name;
  String email;
  String isActive;
  String userid;

  factory VetNgo.fromJson(Map<String, dynamic> json) => VetNgo(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "is_active": isActive,
    "userid": userid,
  };
}