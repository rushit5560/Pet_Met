import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/models/receive_message_model/send_message_model.dart';

class UserConversationScreenController extends GetxController {
  String roomId = Get.arguments[0];
  String headerName = Get.arguments[1];
  String receiverName = Get.arguments[2];
  String userEmail = Get.arguments[3];
  String shopEmail = Get.arguments[4];

  RxBool isLoading = false.obs;

  final TextEditingController messageFieldController = TextEditingController();
  final FocusNode msgFocusField = FocusNode();

  /// Send Message on Send Button Click
  Future<void> sendMessageFunction(SendMessageModel sendMsg) async {
    var documentReference = FirebaseFirestore.instance
        .collection("Chats")
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    /// Set Data in Firebase
    documentReference.set(sendMsg.toJson());

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
