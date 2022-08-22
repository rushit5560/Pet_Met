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
    required this.address,
    required this.phone,
    required this.open,
    required this.close,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.image,
    required this.vetNgoimages,
    required this.meetingimages,
    required this.isActive,
    required this.ifscCode,
    required this.accountCode,
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
  String vetNgoimages;
  String meetingimages;
  String isActive;
  String ifscCode;
  String accountCode;
  String userid;
  String createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String isVerified;

  factory VetAndNgoData.fromJson(Map<String, dynamic> json) => VetAndNgoData(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    phone: json["phone"] ?? "",
    open: json["open"] ?? "",
    close: json["close"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    image: json["image"] ?? "",
    vetNgoimages: json["vet_ngoimages"] ?? "",
    meetingimages: json["meetingimages"] ?? "",
    isActive: json["is_active"] ?? "",
    ifscCode: json["ifsc_code"] ?? "",
    accountCode: json["account_code"] ?? "",
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
    "address": address,
    "phone": phone,
    "open": open,
    "close": close,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "image": image,
    "vet_ngoimages": vetNgoimages,
    "meetingimages": meetingimages,
    "is_active": isActive,
    "ifsc_code": ifscCode,
    "account_code": accountCode,
    "userid": userid,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "is_verified": isVerified,
  };
}

