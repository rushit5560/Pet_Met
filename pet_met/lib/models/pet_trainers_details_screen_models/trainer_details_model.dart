import 'dart:convert';

TrainerDetailsModel trainerDetailsModelFromJson(String str) =>
    TrainerDetailsModel.fromJson(json.decode(str));

String trainerDetailsModelToJson(TrainerDetailsModel data) =>
    json.encode(data.toJson());

class TrainerDetailsModel {
  TrainerDetailsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<TrainerData> data;
  String message;

  factory TrainerDetailsModel.fromJson(Map<String, dynamic> json) =>
      TrainerDetailsModel(
        success: json["success"] ?? false,
        data: List<TrainerData>.from(
            json["data"].map((x) => TrainerData.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class TrainerData {
  TrainerData({
     this.id,
     this.name,
     this.address,
     this.phone,
     this.open,
     this.close,
     this.fullText,
     this.instagram,
     this.facebook,
     this.image,
     this.trainerimages,
     this.meetingimages,
     this.isActive,
     this.userid,
     this.createdBy,
     this.modifiedBy,
     this.createdDate,
     this.modifiedDate,
  });

  int ? id;
  String ? name;
  String ? address;
  String ? phone;
  String ? open;
  String ? close;
  String ? fullText;
  String ? instagram;
  String ? facebook;
  String ? image;
  List<String> ? trainerimages;
  List<String> ? meetingimages;
  String ? isActive;
  int ? userid;
  int ? createdBy;
  String ? modifiedBy;
  String ? createdDate;
  String ? modifiedDate;

  factory TrainerData.fromJson(Map<String, dynamic> json) => TrainerData(
    id: json["id"] ?? 0,
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
    userid: json["userid"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "open": open,
    "close": close,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "image": image,
    "trainerimages": List<dynamic>.from(trainerimages!.map((x) => x)),
    "meetingimages": List<dynamic>.from(meetingimages!.map((x) => x)),
    "is_active": isActive,
    "userid": userid,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}


/*class TrainerData {
  TrainerData({
    this.id,
    this.shopename,
    this.address,
    this.phonenumber,
    this.shopopen,
    this.shopclose,
    this.fullText,
    this.instagram,
    this.facebook,
    this.showimg,
    this.offersimages,
    this.meetingimages,
    this.sortorder,
    this.status,
    // required this.createdBy,
    // required this.modifiedBy,
    // required this.createdDate,
    // required this.modifiedDate,
  });

  int? id;
  String? shopename;
  String? address;
  String? phonenumber;
  String? shopopen;
  String? shopclose;
  String? fullText;
  String? instagram;
  String? facebook;
  String? showimg;
  List<String>? offersimages;
  List<String>? meetingimages;
  String? sortorder;
  String? status;
  // int createdBy;
  // dynamic modifiedBy;
  // DateTime createdDate;
  // dynamic modifiedDate;

  factory TrainerData.fromJson(Map<String, dynamic> json) => TrainerData(
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
        "offersimages": List<dynamic>.from(offersimages!.map((x) => x)),
        "meetingimages": List<dynamic>.from(meetingimages!.map((x) => x)),
        "sortorder": sortorder,
        "status": status,
        // "created_by": createdBy,
        // "modified_by": modifiedBy,
        // "created_date": createdDate.toIso8601String(),
        // "modified_date": modifiedDate,
      };
}*/
