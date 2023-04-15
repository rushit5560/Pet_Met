import 'dart:convert';

AllTrainerModel allTrainerModelFromJson(String str) =>
    AllTrainerModel.fromJson(json.decode(str));

String allTrainerModelToJson(AllTrainerModel data) =>
    json.encode(data.toJson());

class AllTrainerModel {
  AllTrainerModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Trainers> data;
  String message;

  factory AllTrainerModel.fromJson(Map<String, dynamic> json) =>
      AllTrainerModel(
        success: json["success"] ?? false,
        data: List<Trainers>.from(json["data"].map((x) => Trainers.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Trainers {
  Trainers({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.open,
    required this.close,
    required this.fullText,
    required this.instagram,
     required this.facebook,
    required this.image,
    required this.trainerimages,
    required this.meetingimages,
    required this.isActive,
    required this.userid,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.isVerified,
  });

  String id;
  String name;
  String address;
  String phone;
  String open;
  String close;
  String fullText;
   String instagram;
   String facebook;
  String image;
  List<String> trainerimages;
  List<String> meetingimages;
  String isActive;
  String userid;
  String createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String isVerified;

  factory Trainers.fromJson(Map<String, dynamic> json) => Trainers(
    id: (json["id"] ?? 0).toString(),
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    open: json["open"] ?? "",
    close: json["close"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
     facebook: json["facebook"] ?? "",
    image: json["image"] ?? "",
    trainerimages: List<String>.from(json["trainerimages"].map((x) => x) ?? {}),
    meetingimages: List<String>.from(json["meetingimages"].map((x) => x) ?? {}),
    isActive: json["is_active"] ?? "",
    userid: json["userid"] ?? "",
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    isVerified: json["is_verified"] ?? "1",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address == null ? null : address,
    "phone": phone == null ? null : phone,
    "open": open == null ? null : open,
    "close": close == null ? null : close,
    "full_text": fullText == null ? null : fullText,
    "instagram": instagram == null ? null : instagram,
     "facebook": facebook == null ? null : facebook,
    "image": image,
    "trainerimages": List<dynamic>.from(trainerimages.map((x) => x)),
    "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
    "is_active": isActive == null ? null : isActive,
    "userid": userid == null ? null : userid,
    "created_by": createdBy == null ? null : createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "is_verified": isVerified,
  };
}

/*
class Trainers {
  Trainers({
    required this.id,
    required this.shopename,
    required this.address,
    required this.phonenumber,
    required this.shopopen,
    required this.shopclose,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.showimg,
    required this.offersimages,
    required this.meetingimages,
    required this.sortorder,
    required this.status,
    // required this.createdBy,
    // required this.modifiedBy,
    // required this.createdDate,
    // required this.modifiedDate,
  });

  int id;
  String shopename;
  String address;
  String phonenumber;
  String shopopen;
  String shopclose;
  String fullText;
  String instagram;
  String facebook;
  String showimg;
  List<String> offersimages;
  List<String> meetingimages;
  String sortorder;
  String status;
  // int createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory Trainers.fromJson(Map<String, dynamic> json) => Trainers(
        id: json["id"] ?? 0,
        shopename: json["shopename"] ?? "",
        address: json["address"] ?? "",
        phonenumber: json["phonenumber"] ?? "",
        shopopen: json["shopopen"] ?? "",
        shopclose: json["shopclose"] ?? "",
        fullText: json["full_text"] ?? "",
        instagram: json["instagram"] ?? "",
        facebook: json["facebook"] ?? "",
        showimg: json["showimg"] ?? "",
        offersimages:
            List<String>.from(json["offersimages"].map((x) => x ?? "")),
        meetingimages:
            List<String>.from(json["meetingimages"].map((x) => x ?? "")),
        sortorder: json["sortorder"] ?? "",
        status: json["status"] ?? "",
        // createdBy: json["created_by"],
        // modifiedBy: json["modified_by"],
        // createdDate: DateTime.parse(json["created_date"]),
        // modifiedDate: json["modified_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopename": shopename,
        "address": address,
        "phonenumber": phonenumber,
        "shopopen": shopopen,
        "shopclose": shopclose,
        "full_text": fullText,
        "instagram": instagram,
        "facebook": facebook,
        "showimg": showimg,
        "offersimages": List<dynamic>.from(offersimages.map((x) => x)),
        "meetingimages": List<dynamic>.from(meetingimages.map((x) => x)),
        "sortorder": sortorder,
        "status": status,
        // "created_by": createdBy,
        // "modified_by": modifiedBy,
        // "created_date": createdDate.toIso8601String(),
        // "modified_date": modifiedDate,
      };
}*/
