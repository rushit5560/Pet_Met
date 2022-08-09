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
  List<Shope> shope;
  List<Trainer> vetNgo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x)) ?? {}),
    trainer: List<Trainer>.from(json["trainer"].map((x) => Trainer.fromJson(x)) ?? {}),
    shope: List<Shope>.from(json["shope"].map((x) => Shope.fromJson(x)) ?? {}),
    vetNgo: List<Trainer>.from(json["vet_ngo"].map((x) => Trainer.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
    "trainer": List<dynamic>.from(trainer.map((x) => x.toJson())),
    "shope": List<dynamic>.from(shope.map((x) => x.toJson())),
    "vet_ngo": List<dynamic>.from(vetNgo.map((x) => x.toJson())),
  };
}

class Shope {
  Shope({
    required this.id,
    required this.shopename,
    required this.email,
    required this.password,
    required this.address,
    required this.phonenumber,
    required this.shopopen,
    required this.shopclose,
    required this.fullText,
    required this.instagram,
    required this.facebook,
    required this.showimg,
    required this.offersimages,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.meetingimages,
    required this.sortorder,
    required this.status,
    required this.userid,
    required this.isActive,
    required this.categoryId,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
    required this.rememberToken,
    required this.isVerified,
  });

  int id;
  String shopename;
  String email;
  String password;
  String address;
  String phonenumber;
  String shopopen;
  String shopclose;
  String fullText;
  String instagram;
  String facebook;
  String showimg;
  String offersimages;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String meetingimages;
  String sortorder;
  String status;
  int userid;
  String isActive;
  int categoryId;
  int createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;
  String rememberToken;
  String isVerified;

  factory Shope.fromJson(Map<String, dynamic> json) => Shope(
    id: json["id"] ?? 0,
    shopename: json["shopename"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    address: json["address"] ?? "",
    phonenumber: json["phonenumber"] ?? "",
    shopopen: json["shopopen"] ?? "",
    shopclose: json["shopclose"] ?? "",
    fullText: json["full_text"] ?? "",
    instagram: json["instagram"] ?? "",
    facebook: json["facebook"] ?? "",
    showimg: json["showimg"] ?? "",
    offersimages: json["offersimages"] ?? "",
    image1: json["image1"] ?? "",
    image2: json["image2"] ?? "",
    image3: json["image3"] ?? "",
    image4: json["image4"] ?? "",
    image5: json["image5"] ?? "",
    meetingimages: json["meetingimages"] ?? "",
    sortorder: json["sortorder"] ?? "",
    status: json["status"] ?? "",
    userid: json["userid"] ?? "",
    isActive: json["is_active"] ?? "",
    categoryId: json["categoryID"] ?? 0,
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopename": shopename,
    "email": email,
    "password": password,
    "address": address,
    "phonenumber": phonenumber,
    "shopopen": shopopen,
    "shopclose": shopclose,
    "full_text": fullText,
    "instagram": instagram,
    "facebook": facebook,
    "showimg": showimg,
    "offersimages": offersimages,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "meetingimages": meetingimages,
    "sortorder": sortorder,
    "status": status,
    "userid": userid,
    "is_active": isActive,
    "categoryID": categoryId,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
    "remember_token": rememberToken,
    "is_verified": isVerified,
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
    required this.vetNgoimages,
    required this.ifscCode,
    required this.accountCode,
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
  String vetNgoimages;
  String ifscCode;
  String accountCode;

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
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    isVerified: json["is_verified"] ?? "",
    vetNgoimages: json["vet_ngoimages"] ?? "",
    ifscCode: json["ifsc_code"] ?? "",
    accountCode: json["account_code"] ?? "",
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
    "remember_token": rememberToken == null ? null : rememberToken,
    "is_verified": isVerified,
    "vet_ngoimages": vetNgoimages,
    "ifsc_code": ifscCode,
    "account_code": accountCode,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.categoryId,
    required this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
    required this.bod,
    required this.phone,
    required this.gender,
    required this.isActive,
    required this.isVerified,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  int country;
  int state;
  int city;
  int categoryId;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;
  String bod;
  String phone;
  String gender;
  String isActive;
  String isVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    password: json["password"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    image: json["image"] ?? "",
    country: json["country"] ?? 0,
    state: json["state"] ?? 0,
    city: json["city"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
    forgotpasswordToken: json["forgotpassword_token"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    bod: json["bod"] ?? "",
    phone: json["phone"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    isVerified: json["is_verified"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "remember_token": rememberToken,
    "image": image,
    "country": country,
    "state": state,
    "city": city,
    "categoryID": categoryId,
    "forgotpassword_token": forgotpasswordToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "bod": bod,
    "phone": phone,
    "gender": gender,
    "is_active": isActive,
    "is_verified": isVerified,
  };
}
