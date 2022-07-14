import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.success,
    required this.messege,
    required this.error,
    required this.data,
  });

  bool success;
  String messege;
  Error error;
  List<RegisterData> data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    error: Error.fromJson(json["error"] ?? {}),
    data: List<RegisterData>.from(json["data"].map((x) => RegisterData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "error": error.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RegisterData {
  RegisterData({
    required this.id,
    required this.name,
    required this.email,
    // required this.emailVerifiedAt,
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

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    // emailVerifiedAt: json["email_verified_at"],
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

class Error {
  Error({
    required this.email,
  });

  List<String> email;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    email: List<String>.from(json["email"].map((x) => x ?? "")),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
  };
}
