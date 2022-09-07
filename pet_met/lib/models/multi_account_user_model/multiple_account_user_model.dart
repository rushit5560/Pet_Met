// To parse this JSON data, do
//
//     final multiAccountUserModel = multiAccountUserModelFromJson(jsonString);

/*
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
}*/

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
    // required this.userdata,
    required this.user,
    required this.shop,
    required this.vetNgo,
    required this.trainer,
  });

  // UserData userdata;
  User user;
  Shop shop;
  VetNgo vetNgo;
  Trainer trainer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    // userdata: UserData.fromJson(json["userdata"] ?? {}),
    user: User.fromJson(json["user"] ?? {}),
    shop: Shop.fromJson(json["shop"] ?? {}),
    vetNgo: VetNgo.fromJson(json["vetNgo"] ?? {}),
    trainer: Trainer.fromJson(json["trainer"] ?? {}),
    //shop: Map.from(json["shop"]).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)),
    //vetNgo: Map.from(json["vet_ngo"]).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)),
    //trainer: Map.from(json["trainer"]).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)),
  );

  Map<String, dynamic> toJson() => {
    // "userdata": userdata.toJson(),
    "user": user.toJson(),
    "shop": shop.toJson(),
    "vet_ngo": vetNgo.toJson(),
    "trainer": trainer.toJson(),
    //"shop": Map.from(shop).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
    //"vet_ngo": Map.from(vetNgo).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
    //"trainer": Map.from(trainer).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
  };
}

class UserData {
  UserData({
    //this.uid,
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
    required this.startdate,
    required this.enddate,
  });

  //String uid;
  String id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  String country;
  String state;
  String city;
  String categoryId;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;
  String bod;
  String phone;
  String gender;
  String isActive;
  String isVerified;
  String startdate;
  String enddate;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    //uid: json["uid"] == null ? null : json["uid"],
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    password: json["password"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    image: json["image"] ?? "",
    country: json["country"] ?? "",
    state: json["state"] ?? "",
    city: json["city"] ?? "",
    categoryId: json["categoryID"] ?? "",
    forgotpasswordToken: json["forgotpassword_token"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    bod: json["bod"] ?? "",
    phone: json["phone"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    isVerified: json["is_verified"] ?? "",
    startdate: json["startdate"] ?? "",
    enddate: json["enddate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    //"uid": uid == null ? null : uid,
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
    "startdate": startdate,
    "enddate": enddate,
  };
}

class User {
  User({
    required this.uid,
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
    required this.startdate,
    required this.enddate,
  });

  String uid;
  String id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  String country;
  String state;
  String city;
  String categoryId;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;
  String bod;
  String phone;
  String gender;
  String isActive;
  String isVerified;
  String startdate;
  String enddate;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json["uid"] ?? "",
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    password: json["password"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    image: json["image"] ?? "",
    country: json["country"] ?? "",
    state: json["state"] ?? "",
    city: json["city"] ?? "",
    categoryId: json["categoryID"] ?? "",
    forgotpasswordToken: json["forgotpassword_token"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    bod: json["bod"] ?? "",
    phone: json["phone"] ?? "",
    gender: json["gender"] ?? "",
    isActive: json["is_active"] ?? "",
    isVerified: json["is_verified"] ?? "",
    startdate: json["startdate"] ?? "",
    enddate: json["enddate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
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
    "startdate": startdate,
    "enddate": enddate,
  };
}

class Shop {
  String ? uid;
  String ? id;
  String ? name;
  String ? address;
  String ? phonenumber;
  String ? shopopen;
  String ? shopclose;
  String ? fullText;
  String ? instagram;
  String ? facebook;
  String ? showimg;
  String ? offersimages;
  String ? image1;
  String ? image2;
  String ? image3;
  String ? image4;
  String ? image5;
  String ? meetingimages;
  String ? sortorder;
  String ? status;
  String ? userid;
  String ? isActive;
  String ? categoryID;
  String ? createdBy;
  String ? modifiedBy;
  String ? createdDate;
  String ? modifiedDate;
  String ? rememberToken;
  String ? isVerified;
  String ? startdate;
  String ? enddate;
  String ? email;
  String ? emailVerifiedAt;
  String ? password;
  String ? image;
  String ? country;
  String ? state;
  String ? city;
  String ? forgotpasswordToken;
  String ? createdAt;
  String ? updatedAt;
  String ? bod;
  String ? phone;
  String ? gender;

  Shop(
      {
        this.uid,
        this.id,
        this.name,
        this.address,
        this.phonenumber,
        this.shopopen,
        this.shopclose,
        this.fullText,
        this.instagram,
        this.facebook,
        this.showimg,
        this.offersimages,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.meetingimages,
        this.sortorder,
        this.status,
        this.userid,
        this.isActive,
        this.categoryID,
        this.createdBy,
        this.modifiedBy,
        this.createdDate,
        this.modifiedDate,
        this.rememberToken,
        this.isVerified,
        this.startdate,
        this.enddate,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.image,
        this.country,
        this.state,
        this.city,
        this.forgotpasswordToken,
        this.createdAt,
        this.updatedAt,
        this.bod,
        this.phone,
        this.gender});

  Shop.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phonenumber = json['phonenumber'];
    shopopen = json['shopopen'];
    shopclose = json['shopclose'];
    fullText = json['full_text'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    showimg = json['showimg'];
    offersimages = json['offersimages'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    meetingimages = json['meetingimages'];
    sortorder = json['sortorder'];
    status = json['status'];
    userid = json['userid'];
    isActive = json['is_active'];
    categoryID = json['categoryID'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    image = json['image'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    forgotpasswordToken = json['forgotpassword_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bod = json['bod'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phonenumber'] = this.phonenumber;
    data['shopopen'] = this.shopopen;
    data['shopclose'] = this.shopclose;
    data['full_text'] = this.fullText;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['showimg'] = this.showimg;
    data['offersimages'] = this.offersimages;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['meetingimages'] = this.meetingimages;
    data['sortorder'] = this.sortorder;
    data['status'] = this.status;
    data['userid'] = this.userid;
    data['is_active'] = this.isActive;
    data['categoryID'] = this.categoryID;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['image'] = this.image;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['forgotpassword_token'] = this.forgotpasswordToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bod'] = this.bod;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    return data;
  }
}

class VetNgo {
  String ? uid;
  String ? id;
  String ? name;
  String ? address;
  String ? phone;
  String ? open;
  String ? close;
  String ? fullText;
  String ? instagram;
  String ? facebook;
  String ? image;
  String ? vetNgoimages;
  String ? image1;
  String ? image2;
  String ? image3;
  String ? image4;
  String ? image5;
  String ? meetingimages;
  String ? isActive;
  String ? ifscCode;
  String ? accountCode;
  String ? userid;
  String ? categoryID;
  String ? createdBy;
  String ? modifiedBy;
  String ? createdDate;
  String ? modifiedDate;
  String ? rememberToken;
  String ? isVerified;
  String ? startdate;
  String ? enddate;
  String ? email;
  String ? emailVerifiedAt;
  String ? password;
  String ? country;
  String ? state;
  String ? city;
  String ? forgotpasswordToken;
  String ? createdAt;
  String ? updatedAt;
  String ? bod;
  String ? gender;

  VetNgo(
      {
        this.uid,
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
        this.vetNgoimages,
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
        this.categoryID,
        this.createdBy,
        this.modifiedBy,
        this.createdDate,
        this.modifiedDate,
        this.rememberToken,
        this.isVerified,
        this.startdate,
        this.enddate,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.country,
        this.state,
        this.city,
        this.forgotpasswordToken,
        this.createdAt,
        this.updatedAt,
        this.bod,
        this.gender});

  VetNgo.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? "";
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    address = json['address'] ?? "";
    phone = json['phone'] ?? "";
    open = json['open'] ?? "";
    close = json['close'] ?? "";
    fullText = json['full_text'] ?? "";
    instagram = json['instagram'] ?? "";
    facebook = json['facebook'] ?? "";
    image = json['image'] ?? "";
    vetNgoimages = json['vet_ngoimages'] ?? "";
    image1 = json['image1'] ?? "";
    image2 = json['image2'] ?? "";
    image3 = json['image3'] ?? "";
    image4 = json['image4'] ?? "";
    image5 = json['image5'] ?? "";
    meetingimages = json['meetingimages'] ?? "";
    isActive = json['is_active'] ?? "";
    ifscCode = json['ifsc_code'] ?? "";
    accountCode = json['account_code'] ?? "";
    userid = json['userid'] ?? "";
    categoryID = json['categoryID'] ?? "";
    createdBy = json['created_by'] ?? "";
    modifiedBy = json['modified_by'] ?? "";
    createdDate = json['created_date'] ?? "";
    modifiedDate = json['modified_date'] ?? "";
    rememberToken = json['remember_token'] ?? "";
    isVerified = json['is_verified'] ?? "";
    startdate = json['startdate'] ?? "";
    enddate = json['enddate'] ?? "";
    email = json['email'] ?? "";
    emailVerifiedAt = json['email_verified_at'] ?? "";
    password = json['password'] ?? "";
    country = json['country'] ?? "";
    state = json['state'] ?? "";
    city = json['city'] ?? "";
    forgotpasswordToken = json['forgotpassword_token'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    bod = json['bod'] ?? "";
    gender = json['gender'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['open'] = this.open;
    data['close'] = this.close;
    data['full_text'] = this.fullText;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['image'] = this.image;
    data['vet_ngoimages'] = this.vetNgoimages;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['meetingimages'] = this.meetingimages;
    data['is_active'] = this.isActive;
    data['ifsc_code'] = this.ifscCode;
    data['account_code'] = this.accountCode;
    data['userid'] = this.userid;
    data['categoryID'] = this.categoryID;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['forgotpassword_token'] = this.forgotpasswordToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bod'] = this.bod;
    data['gender'] = this.gender;
    return data;
  }
}

class Trainer {
  String ? uid;
  String ? id;
  String ? name;
  String ? address;
  String ? phone;
  String ? open;
  String ? close;
  String ? fullText;
  String ? instagram;
  String ? facebook;
  String ? image;
  String ? trainerimages;
  String ? image1;
  String ? image2;
  String ? image3;
  String ? image4;
  String ? image5;
  String ? meetingimages;
  String ? isActive;
  String ? userid;
  String ? categoryID;
  String ? createdBy;
  String ? modifiedBy;
  String ? createdDate;
  String ? modifiedDate;
  String ? rememberToken;
  String ? isVerified;
  String ? startdate;
  String ? enddate;
  String ? email;
  String ? emailVerifiedAt;
  String ? password;
  String ? country;
  String ? state;
  String ? city;
  String ? forgotpasswordToken;
  String ? createdAt;
  String ? updatedAt;
  String ? bod;
  String ? gender;

  Trainer(
      {
        this.uid,
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
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.meetingimages,
        this.isActive,
        this.userid,
        this.categoryID,
        this.createdBy,
        this.modifiedBy,
        this.createdDate,
        this.modifiedDate,
        this.rememberToken,
        this.isVerified,
        this.startdate,
        this.enddate,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.country,
        this.state,
        this.city,
        this.forgotpasswordToken,
        this.createdAt,
        this.updatedAt,
        this.bod,
        this.gender});

  Trainer.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? "";
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    address = json['address'] ?? "";
    phone = json['phone'] ?? "";
    open = json['open'] ?? "";
    close = json['close'] ?? "";
    fullText = json['full_text'] ?? "";
    instagram = json['instagram'] ?? "";
    facebook = json['facebook'] ?? "";
    image = json['image'] ?? "";
    trainerimages = json['trainerimages'] ?? "";
    image1 = json['image1'] ?? "";
    image2 = json['image2'] ?? "";
    image3 = json['image3'] ?? "";
    image4 = json['image4'] ?? "";
    image5 = json['image5'] ?? "";
    meetingimages = json['meetingimages'] ?? "";
    isActive = json['is_active'] ?? "";
    userid = json['userid'] ?? "";
    categoryID = json['categoryID'] ?? "";
    createdBy = json['created_by'] ?? "";
    modifiedBy = json['modified_by'] ?? "";
    createdDate = json['created_date'] ?? "";
    modifiedDate = json['modified_date'] ?? "";
    rememberToken = json['remember_token'] ?? "";
    isVerified = json['is_verified'] ?? "";
    startdate = json['startdate'] ?? "";
    enddate = json['enddate'] ?? "";
    email = json['email'] ?? "";
    emailVerifiedAt = json['email_verified_at'] ?? "";
    password = json['password'] ?? "";
    country = json['country'] ?? "";
    state = json['state'] ?? "";
    city = json['city'] ?? "";
    forgotpasswordToken = json['forgotpassword_token'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    bod = json['bod'] ?? "";
    gender = json['gender'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['open'] = this.open;
    data['close'] = this.close;
    data['full_text'] = this.fullText;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['image'] = this.image;
    data['trainerimages'] = this.trainerimages;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['meetingimages'] = this.meetingimages;
    data['is_active'] = this.isActive;
    data['userid'] = this.userid;
    data['categoryID'] = this.categoryID;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['forgotpassword_token'] = this.forgotpasswordToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bod'] = this.bod;
    data['gender'] = this.gender;
    return data;
  }
}
