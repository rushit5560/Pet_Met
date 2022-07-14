import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

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
    required this.id,
    required this.name,
    required this.email,
    // required this.emailVerifiedAt,
    required this.password,
    // required this.rememberToken,
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

  int id;
  String name;
  String email;
  // dynamic emailVerifiedAt;
  String password;
  // String rememberToken;
  String image;
  int country;
  int state;
  int city;
  int categoryId;
  // dynamic forgotpasswordToken;
  // DateTime createdAt;
  // DateTime updatedAt;
  String bod;
  String phone;
  String gender;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    // emailVerifiedAt: json["email_verified_at"],
    password: json["password"] ?? "",
    // rememberToken: json["remember_token"],
    image: json["image"] ?? "",
    country: json["country"] ?? 0,
    state: json["state"] ?? 0,
    city: json["city"] ?? 0,
    categoryId: json["categoryID"] ?? 0,
    // forgotpasswordToken: json["forgotpassword_token"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    bod: json["bod"] ?? "",
    phone: json["phone"] ?? "",
    gender: json["gender"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    // "email_verified_at": emailVerifiedAt,
    "password": password,
    // "remember_token": rememberToken,
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
