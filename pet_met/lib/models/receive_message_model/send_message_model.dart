import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
  SendMessageModel({
    required this.roomId,
    // required this.username1,
    // required this.username2,
    required this.message,
    required this.createdAt,
    required this.user1seen,
    required this.user2seen,
    required this.sender,
    required this.receiver,
  });

  String roomId;
  // String username1;
  // String username2;
  String sender;
  String receiver;
  String message;
  Timestamp createdAt;
  bool user1seen;
  bool user2seen;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
    roomId: json["roomId"] ?? "",
    // username1: json["username1"] ?? "",
    // username2: json["username2"] ?? "",
    sender: json["sender"] ?? "",
    receiver: json["receiver"] ?? "",
    message: json["message"] ?? "",
    createdAt: json["created_at"] ?? Timestamp.now(),
    user1seen: json["user1seen"] ?? false,
    user2seen: json["user2seen"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "room_id": roomId,
    // "username1": username1,
    // "username2": username2,
    "message": message,
    "created_at": createdAt,
    "user1seen": user1seen,
    "user2seen": user2seen,
    "sender": sender,
    "receiver": receiver,
  };
}