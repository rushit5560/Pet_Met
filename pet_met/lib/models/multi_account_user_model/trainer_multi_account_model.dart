// To parse this JSON data, do
//
//     final trainerMultiAccountModel = trainerMultiAccountModelFromJson(jsonString);

import 'dart:convert';

TrainerMultiAccountModel trainerMultiAccountModelFromJson(String str) => TrainerMultiAccountModel.fromJson(json.decode(str));

String trainerMultiAccountModelToJson(TrainerMultiAccountModel data) => json.encode(data.toJson());

class TrainerMultiAccountModel {
  TrainerMultiAccountModel({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  Data data;

  factory TrainerMultiAccountModel.fromJson(Map<String, dynamic> json) => TrainerMultiAccountModel(
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

  List<dynamic> user;
  List<Trainer> trainer;
  List<dynamic> shope;
  List<dynamic> vetNgo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: List<dynamic>.from(json["user"].map((x) => x) ?? {}),
    trainer: List<Trainer>.from(json["trainer"].map((x) => Trainer.fromJson(x)) ?? {}),
    shope: List<dynamic>.from(json["shope"].map((x) => x) ?? {}),
    vetNgo: List<dynamic>.from(json["vet_ngo"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x)),
    "trainer": List<dynamic>.from(trainer.map((x) => x.toJson())),
    "shope": List<dynamic>.from(shope.map((x) => x)),
    "vet_ngo": List<dynamic>.from(vetNgo.map((x) => x)),
  };
}

class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phone,
    required this.open,
    required this.close,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.image,
    required this.trainerimages,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.meetingimages,
    required this.isActive,
    required this.userid,
    required this.categoryId,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.rememberToken,
    required this.isVerified,
  });

  int id;
  String name;
  String email;
  String password;
  String address;
  String phone;
  String open;
  String close;
  String fullText;
  String instagram;
  String facebook;
  String image;
  String trainerimages;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String meetingimages;
  String isActive;
  int userid;
  int categoryId;
  int createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String rememberToken;
  String isVerified;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    open: json["open"] ?? "",
    close: json["close"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    image: json["image"] ?? "",
    trainerimages: json["trainerimages"] ?? "",
    image1: json["image1"] ?? "",
    image2: json["image2"] ?? "",
    image3: json["image3"] ?? "",
    image4: json["image4"] ?? "",
    image5: json["image5"] ?? "",
    meetingimages: json["meetingimages"] ?? "",
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "address": address,
    "phone": phone,
    "open": open,
    "close": close,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "image": image,
    "trainerimages": trainerimages,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "meetingimages": meetingimages,
    "is_active": isActive,
    "userid": userid,
    "categoryID": categoryId,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "remember_token": rememberToken,
    "is_verified": isVerified,
  };
}
