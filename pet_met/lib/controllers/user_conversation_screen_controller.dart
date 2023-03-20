import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/models/receive_message_model/send_message_model.dart';
import 'package:pet_met/utils/user_preference.dart';
import '../utils/user_details.dart';

class UserConversationScreenController extends GetxController {
  String roomId = Get.arguments[0];
  String headerName = Get.arguments[1];
  String receiverName = Get.arguments[2];
  String userEmail = Get.arguments[3];
  String shopEmail = Get.arguments[4];
  // static late SendMessageModel me;

  RxBool isLoading = false.obs;
  UserPreference userPreference = UserPreference();

  final TextEditingController messageFieldController = TextEditingController();
  final FocusNode msgFocusField = FocusNode();

  /// Send Message on Send Button Click
  Future<void> sendMessageFunction(SendMessageModel sendMsg) async {
    var documentReference = FirebaseFirestore.instance
        .collection("Chats")
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    /// Set Data in Firebase
    documentReference.set(sendMsg.toJson());
    await sendPushNotification(sendMsg);

    // sendPushNotification(sendMsg, sendMsg.message);

    /// Send Chat Notification
    // sendGeneralNotification(
    //   fcmToken: oppositeUserFcmToken, // Getting From API
    //   title: UserDetails.userName,
    //   body: messageFieldController.text.trim(),
    //   type: 0,
    // );

    /// Hide Keyboard
    // hideKeyboard();
    messageFieldController.clear();
    loadUI();
  }
// sendPushNotification

  Future<void> sendPushNotification(SendMessageModel sendMessageModel) async {
    log("sendPushNotification 111");
    String userFcmToken = await userPreference.getFcmFromPrefs();
    try {
      final body = {
        "to": userFcmToken,
        "notification": {
          "title": UserDetails.userName, //our name should be send
          "body": sendMessageModel.message,
          "android_channel_id": "chats"
        },
        // "data": {
        //   "some_data": "User ID: ${me.id}",
        // },
      };
      log("sendPushNotification Body: $body");
      log("sendPushNotification userFcmToken: $userFcmToken");
      log("sendPushNotification sendMessageModel.message: ${sendMessageModel.message}");

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                'key=AAAAY6R0JdY:APA91bHQiDuMrX5oPEYx93FZqQSQuw_ynS0XsBYHLmVtwLIRe0gLg3fyerKx4Xg6Q-jr847SywQgqEV0nvIcxw7dto70YaMFdHQ18_wFJFXuNJtAAg9g5jqeEXgAJrGReQH1uDb72hAS'
          },
          body: jsonEncode(body));
      log('sendPushNotification Response status: ${res.statusCode}');
      log('sendPushNotification Response body: ${res.body}');
    } catch (e) {
      log('sendPushNotification sendPushNotificationE: $e');
    }
  }

  // static Future<void> sendPushNotification(
  //     SendMessageModel sendMessageModel, String msg) async {
  //   log("sendPushNotification 1");
  //   // String titleName = UserDetails.userName == sendMessageModel.username1
  //   //     ? sendMessageModel.username1!
  //   //     : sendMessageModel.username2!;
  //   log("sendPushNotification sendMsg ${sendMessageModel.message}");

  //   log("sendMessageModel.sender ${sendMessageModel.sender}");
  //   // log("sendMessageModel.username2 ${sendMessageModel.username2}");

  //   try {
  //     final body = {
  //       "to":
  //           'f0p4hQfpRF2oPIVSQ8lgI3:APA91bHiCSFCdyMNgp666Msj0jN0Hwoy2CVOzYWIFFKi-ogeMEL2XKDPacxALH_H-mdH1-I7sckHyTAXXZcYH186Uu0zbCpjqK1taqOVepj07oGDhR8U5yCQspHFrEPycRVsoai_VP54',
  //       "notification": {
  //         "title": UserDetails.userName, //our name should be send
  //         "body": msg,
  //         "android_channel_id": "Chats"
  //       },
  //       "data": {
  //         "some_data": "User ID: ${sendMessageModel.roomId}",
  //       },
  //     };
  //     // log("sendMessageModel.pushToken : ${sendMessageModel.pushToken}");

  //     log("sendMessageModel.userName : ${UserDetails.userName}");
  //     log("sendMessageModel.msg : $msg");

  //     var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //         headers: {
  //           HttpHeaders.contentTypeHeader: 'application/json',
  //           HttpHeaders.authorizationHeader:
  //               'key=AAAAY6R0JdY:APA91bHQiDuMrX5oPEYx93FZqQSQuw_ynS0XsBYHLmVtwLIRe0gLg3fyerKx4Xg6Q-jr847SywQgqEV0nvIcxw7dto70YaMFdHQ18_wFJFXuNJtAAg9g5jqeEXgAJrGReQH1uDb72hAS'
  //         },
  //         body: jsonEncode(body));
  //     log("sendPushNotification 3");
  //     log('Response status: ${res.statusCode}');
  //     log('Response body: ${res.body}');
  //   } catch (e) {
  //     log('\nsendPushNotificationE: $e');
  //   }
  // }

  /// Get All Messages From Firebase -> Return Chat List
  Stream<List<ReceiveMessageModel>> fetchChatFromFirebase() {
    return FirebaseFirestore.instance
        .collection("Chats")
        .where("room_id", isEqualTo: roomId)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              log("doc : ${doc.id}");
              log("Room Id: $roomId");
              return ReceiveMessageModel.fromJson(doc.data(), doc.id);
            }).toList());
  }

  /// Load UI
  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
