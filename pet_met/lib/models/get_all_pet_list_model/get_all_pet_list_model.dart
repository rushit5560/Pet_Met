import 'dart:convert';

GetPetTopListModel getPetTopListModelFromJson(String str) =>
    GetPetTopListModel.fromJson(json.decode(str));

String getPetTopListModelToJson(GetPetTopListModel data) =>
    json.encode(data.toJson());

class GetPetTopListModel {
  GetPetTopListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<PetDatum> data;
  String message;

  factory GetPetTopListModel.fromJson(Map<String, dynamic> json) =>
      GetPetTopListModel(
        success: json["success"] ?? false,
        data: List<PetDatum>.from(
            (json["data"] ?? []).map((x) => PetDatum.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class PetDatum {
  PetDatum({
    required this.data,
    required this.img,
    required this.name,
  });

  PetList data;
  Img img;
  Name name;

  factory PetDatum.fromJson(Map<String, dynamic> json) => PetDatum(
        data: PetList.fromJson(json["data"] ?? {}),
        img: Img.fromJson(json["img"] ?? {}),
        name: Name.fromJson(json["name"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "img": img.toJson(),
        "name": name.toJson(),
      };
}

class PetList {
  PetList({
    required this.id,
    required this.image,
    required this.petName,
    required this.mainCategory,
    required this.subCategory,
    required this.dob,
    required this.weight,
    required this.details,
    required this.imageList,
    required this.meetingAvailability,
    required this.gender,
    required this.isActive,
    required this.userid,
    required this.categoryId,
  });

  String id;
  String image;
  String petName;
  String mainCategory;
  String subCategory;
  String dob;
  String weight;
  String details;
  String imageList;
  String meetingAvailability;
  String gender;
  String isActive;
  String userid;
  String categoryId;

  factory PetList.fromJson(Map<String, dynamic> json) => PetList(
        id: (json["id"] ?? 0).toString(),
        image: json["image"] ?? "",
        petName: json["pet_name"] ?? "",
        mainCategory: (json["main_category"] ?? 0).toString(),
        subCategory: (json["sub_category"] ?? 0).toString(),
        dob: json["dob"] ?? "",
        weight: (json["weight"] ?? 0).toString(),
        details: json["details"] ?? "",
        imageList: json["image_list"] ?? "",
        meetingAvailability: json["meeting_availability"] ?? "",
        gender: json["gender"] ?? "",
        isActive: json["is_active"] ?? "",
        userid: json["userid"] ?? "",
        categoryId: (json["categoryID"] ?? 0).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "pet_name": petName,
        "main_category": mainCategory,
        "sub_category": subCategory,
        "dob": dob,
        "weight": weight,
        "details": details,
        "image_list": imageList,
        "meeting_availability": meetingAvailability,
        "gender": gender,
        "is_active": isActive,
        "userid": userid,
        "categoryId": categoryId,
      };
}

class Img {
  Img({
    required this.image,
  });

  String image;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Name {
  Name({
    required this.name,
  });

  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

/// -------------------------------------------------------------------

/*GetPetListModel getPetListModelFromJson(String str) =>
    GetPetListModel.fromJson(json.decode(str));

String getPetListModelToJson(GetPetListModel data) =>
    json.encode(data.toJson());

class GetPetListModel {
  GetPetListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<PetDatum> data;
  String message;

  factory GetPetListModel.fromJson(Map<String, dynamic> json) =>
      GetPetListModel(
        success: json["success"] ?? false,
        data: List<PetDatum>.from(
            (json["data"] ?? []).map((x) => PetDatum.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class PetDatum {
  PetDatum({
    required this.data,
    required this.img,
    required this.name,
  });

  PetList data;
  Img1 img;
  Name1 name;

  factory PetDatum.fromJson(Map<String, dynamic> json) => PetDatum(
        data: PetList.fromJson(json["data"] ?? {}),
        img: Img1.fromJson(json["img"] ?? {}),
        name: Name1.fromJson(json["name"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "img": img.toJson(),
        "name": name.toJson(),
      };
}

class PetList {
  PetList({
    required this.id,
    required this.image,
    required this.petName,
    required this.mainCategory,
    required this.subCategory,
    required this.dob,
    required this.weight,
    required this.details,
    required this.imageList,
    required this.meetingAvailability,
    required this.gender,
    required this.isActive,
    required this.isVerified,
    required this.categoryId,
    required this.userid,
    required this.createdBy,
    required this.createdDate,
    // required this.updatedDate,
    // required this.modifiedBy,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String image;
  String petName;
  int mainCategory;
  int subCategory;
  String dob;
  int weight;
  String details;
  dynamic imageList;
  String meetingAvailability;
  String gender;
  String isActive;
  String isVerified;
  int categoryId;
  int userid;
  int createdBy;
  DateTime createdDate;
  // dynamic updatedDate;
  // dynamic modifiedBy;
  String latitude;
  String longitude;

  factory PetList.fromJson(Map<String, dynamic> json) => PetList(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        petName: json["pet_name"] ?? "",
        mainCategory: json["main_category"] ?? 0,
        subCategory: json["sub_category"] ?? 0,
        dob: json["dob"] ?? "",
        weight: json["weight"] ?? 0,
        details: json["details"] ?? "",
        imageList: json["image_list"],
        meetingAvailability: json["meeting_availability"] ?? "",
        gender: json["gender"] ?? "",
        isActive: json["is_active"] ?? "",
        isVerified: json["is_verified"] ?? "",
        categoryId: json["categoryID"] ?? 0,
        userid: json["userid"] ?? 0,
        createdBy: json["created_by"] ?? 0,
        createdDate: DateTime.parse(json["created_date"] ?? DateTime.now()),
        // updatedDate: json["updated_date"],
        // modifiedBy: json["modified_by"],
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "pet_name": petName,
        "main_category": mainCategory,
        "sub_category": subCategory,
        "dob": dob,
        "weight": weight,
        "details": details,
        "image_list": imageList,
        "meeting_availability": meetingAvailability,
        "gender": gender,
        "is_active": isActive,
        "is_verified": isVerified,
        "categoryID": categoryId,
        "userid": userid,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        // "updated_date": updatedDate,
        // "modified_by": modifiedBy,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Img1 {
  Img1({
    required this.image,
  });

  String image;

  factory Img1.fromJson(Map<String, dynamic> json) => Img1(
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Name1 {
  Name1({
    required this.name,
  });

  String name;

  factory Name1.fromJson(Map<String, dynamic> json) => Name1(
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}*/
