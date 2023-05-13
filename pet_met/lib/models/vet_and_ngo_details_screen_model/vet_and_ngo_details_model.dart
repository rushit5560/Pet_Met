class VetsAndNgoDetailsModel {
  bool success;
  List<VetNgoData> data;
  String message;

  VetsAndNgoDetailsModel(
      {required this.success, required this.data, required this.message});

  factory VetsAndNgoDetailsModel.fromJson(Map<String, dynamic> json) =>
      VetsAndNgoDetailsModel(
        success: json["success"] ?? false,
        data: List<VetNgoData>.from(
            json["data"].map((x) => VetNgoData.fromJson(x ?? {}))),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class VetNgoData {
  String? id;
  String? name;
  String? displayName;
  String? password;
  String? address;
  String? phone;
  String? open;
  String? close;
  String? fullText;
  String? instagram;
  String? facebook;
  String? image;
  List<String>? vetNgoimages;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? meetingimages;
  String? isActive;
  String? ifscCode;
  String? accountCode;
  String? userid;
  String? categoryId;
  String? createdBy;
  String? modifiedBy;
  String? createdDate;
  String? modifiedDate;
  String? rememberToken;
  String? isVerified;
  String? gpayupi;
  String? email;

  VetNgoData({
    this.id,
    this.name,
    this.displayName,
    this.email,
    this.password,
    this.address,
    this.phone,
    this.open,
    this.close,
    this.fullText,
    this.instagram,
    this.facebook,
    this.image,
    //this.vetNgoimages,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.meetingimages,
    this.isActive,
    this.ifscCode,
    this.accountCode,
    this.userid,
    this.categoryId,
    this.createdBy,
    this.modifiedBy,
    this.createdDate,
    this.modifiedDate,
    this.rememberToken,
    this.isVerified,
  });

  factory VetNgoData.fromJson(Map<String, dynamic> json) => VetNgoData(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        displayName: json["display_name"] ?? "",
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
        //vetNgoimages: List<String>.from(json["vet_ngoimages"].map((x) => x) ?? {}),
        image1: json["image1"] ?? "",
        image2: json["image2"] ?? "",
        image3: json["image3"] ?? "",
        image4: json["image4"] ?? "",
        image5: json["image5"] ?? "",
        meetingimages: json["meetingimages"] ?? "",
        isActive: json["is_active"] ?? "",
        ifscCode: json["ifsc_code"] ?? "",
        accountCode: json["account_code"] ?? "",
        userid: json["userid"] ?? "",
        categoryId: json["categoryID"] ?? "",
        createdBy: json["created_by"] ?? "",
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
        //"vet_ngoimages": List<dynamic>.from(vetNgoimages!.map((x) => x)),
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "meetingimages": meetingimages,
        "is_active": isActive,
        "ifsc_code": ifscCode,
        "account_code": accountCode,
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
