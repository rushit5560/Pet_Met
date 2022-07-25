import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.success,
    this.messege,
    // this.error,
  });

  bool? success;
  String? messege;
  // Error? error;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    // error: Error.fromJson(json["error"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    // "error": error!.toJson(),
  };
}

/*class Error {
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
}*/


RegisterErrorModel registerErrorModelFromJson(String str) => RegisterErrorModel.fromJson(json.decode(str));

String registerErrorModelToJson(RegisterErrorModel data) => json.encode(data.toJson());

class RegisterErrorModel {
  RegisterErrorModel({
    required this.success,
    required this.error,
  });

  bool success;
  Error error;

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) => RegisterErrorModel(
    success: json["success"] ?? false,
    error: Error.fromJson(json["error"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error.toJson(),
  };
}

class Error {
  Error({
    required this.email,
  });

  List<String> email;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    email: List<String>.from(json["email"].map((x) => x) ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
  };
}
