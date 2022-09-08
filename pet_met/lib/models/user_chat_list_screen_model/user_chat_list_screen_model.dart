import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String sendMessageModelToJson(UserChatRoomListModel data) =>
    json.encode(data.toJson());

class UserChatRoomListModel {
  UserChatRoomListModel({
    required this.chatRoomId,
    required this.createdAt,
    required this.creator,
    required this.useremail1,
    required this.useremail2,
    required this.username1,
    required this.username2,
    required this.users,
  });

  String chatRoomId;
  Timestamp createdAt;
  String creator;
  String useremail1;
  String useremail2;
  String username1;
  String username2;
  List<String> users;

  factory UserChatRoomListModel.fromJson(
    Map<String, dynamic> json,
    /*String img*/
  ) =>
      UserChatRoomListModel(
        chatRoomId: json['chatRoomId'] ?? "",
        createdAt: json['createdAt'] ?? Timestamp.now(),
        creator: json['creator'] ?? "",
        useremail1: json['useremail1'] ?? "",
        useremail2: json['useremail2'] ?? "",
        username1: json['username1'] ?? "",
        username2: json['username2'] ?? "",
        users: List<String>.from(json["users"].map((x) => x) ?? []),
        //img: img
      );

  Map<String, dynamic> toJson() => {
        "chatRoomId": chatRoomId,
        "createdAt": createdAt,
        "creator": creator,
        "useremail1": useremail1,
        "useremail2": useremail2,
        "username1": username1,
        "username2": username2,
        "users": List<dynamic>.from(users.map((x) => x)),
      };
}
