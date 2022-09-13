import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String sendMessageModelToJson(UserChatRoomListModel data) =>
    json.encode(data.toJson());

class UserChatRoomListModel {
  UserChatRoomListModel({
    required this.chatRoomId,
    required this.createdAt,
    required this.creator,
    required this.creatorEmail,
    required this.creatorName,
    required this.pearer,
    required this.peerEmail,
    required this.peerName,
    required this.userEmails,
  });

  String chatRoomId;
  Timestamp createdAt;
  String creator;
  String creatorEmail;
  String creatorName;
  String pearer;
  String peerEmail;
  String peerName;
  List<String> userEmails;

  factory UserChatRoomListModel.fromJson(
    Map<String, dynamic> json,
    /*String img*/
  ) =>
      UserChatRoomListModel(
        chatRoomId: json['chatRoomId'] ?? "",
        createdAt: json['createdAt'] ?? Timestamp.now(),
        creator: json['creator'] ?? "",
        creatorEmail: json['creatorEmail'] ?? "",
        creatorName: json['creatorName'] ?? "",
        pearer: json['pearer'] ?? "",
        peerEmail: json['peerEmail'] ?? "",
        peerName: json['peerName'] ?? "",
        userEmails: List<String>.from(json["userEmails"].map((x) => x) ?? []),
        //img: img
      );

  Map<String, dynamic> toJson() => {
        "chatRoomId": chatRoomId,
        "createdAt": createdAt,
        "creator": creator,
        "creatorEmail": creatorEmail,
        "creatorName": creatorName,
        "pearer": pearer,
        "peerEmail": peerEmail,
        "peerName": peerName,
        "userEmails": List<dynamic>.from(userEmails.map((x) => x)),
      };
}
