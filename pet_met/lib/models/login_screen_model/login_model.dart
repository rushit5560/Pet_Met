import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    required this.error,
    required this.messege,
    required this.data,
  });

  bool success;
  String error;
  String messege;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"] ?? false,
        error: json["error"] ?? "",
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
    required this.uid,
    required this.id,
    required this.name,
    required this.email,
    required this.shopName,
    required this.showimg,
    // required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.categoryId,
    // required this.forgotpasswordToken,
    // required this.createdAt,
    // required this.updatedAt,
    required this.bod,
    required this.phone,
    required this.gender,
  });

  String uid;
  String id;
  String name;
  String email;
  String shopName;
  String showimg;
  // dynamic emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  String country;
  String state;
  String city;
  String categoryId;
  // dynamic forgotpasswordToken;
  // DateTime createdAt;
  // DateTime updatedAt;
  String bod;
  String phone;
  String gender;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uid: json["uid"] ?? "",
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        shopName: json["shopName"] ?? "",
        showimg: json["showimg"] ?? "",
        // emailVerifiedAt: json["email_verified_at"],
        password: json["password"] ?? "",
        rememberToken: json["remember_token"] ?? "",
        image: json["image"] ?? "",
        country: json["country"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        categoryId: json["categoryID"] ?? "",
        // forgotpasswordToken: json["forgotpassword_token"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        bod: json["bod"] ?? "",
        phone: json["phone"] ?? "",
        gender: json["gender"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "uid": uid,
        "id": id,
        "name": name,
        "email": email,
        // "email_verified_at": emailVerifiedAt,
        "password": password,
        "remember_token": rememberToken,
        "image": image,
        "country": country,
        "state": state,
        "city": city,
        "categoryID": categoryId,
        // "forgotpassword_token": forgotpasswordToken,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "bod": bod,
        "phone": phone,
        "gender": gender,
      };
}
