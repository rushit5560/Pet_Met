import 'dart:convert';

String PrefesUsersToJson(PrefesUsersModel data) => json.encode(data.toJson());

class PrefesUsersModel {
  PrefesUsersModel(
      {required this.email,
      required this.fcmToken,
      required this.id,
      required this.username});
  String username;
  String id;
  String email;
  String fcmToken;
  factory PrefesUsersModel.fromJson(Map<String, dynamic> json) =>
      PrefesUsersModel(
        email: json["email"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
        id: json["id"] ?? "",
        username: json["username"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "email": email,
        "fcmToken": fcmToken,
        "id": id,
        "username": username,
      };
}
