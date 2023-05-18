import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_met/models/receive_message_model/receive_message_mdel.dart';
import 'package:pet_met/models/receive_message_model/send_message_model.dart';
import 'package:pet_met/utils/user_details.dart';
import 'package:http/http.dart' as http;

import '../models/notification_models/notification_send_model.dart';

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

    documentReference
        .set(sendMsg.toJson())
        .then((value) async => await chatListPositionupdate(sendMsg.roomId));
    log("receiverName $receiverName");

    // Get Opponent user fcm token for send notification
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverName)
        .get();

    String opponentToken = snap["fcmToken"];

    // String opponentToken = snap["fcmToken"];
    log("sendMessageFunction snap : $snap");
    log('opponentToken : $opponentToken');
// await chatListPositionupdate()
    /// Send Chat Notification
    ///

    // Platform.isAndroid
    //     ?

    await sendGeneralNotification(
      opponentToken: opponentToken,
      title: UserDetails.userName,
      body: messageFieldController.text.trim(),
      // type: 0,
    );

    //       : const FirebaseOptions(
    //   apiKey:
    //       'key=AAAA8bBUIwY:APA91bG12B9sECzxamPgdtkucbTWTAaRbxbOhCwwvdJwMQNDUeR0iiQi1YUGrf4FO1gruIcaoE3kxTvSEtMrhz_Py5Uo-t1lNzd1g1HGTjmAbOtcZeeyz7xDHEaTzrQHZId9NL1cV_Ey',
    //   appId: '1:1038045422342:ios:02579013f7bc208583f487',
    //   messagingSenderId: '1038045422342',
    //   projectId: 'petomate-c3a84',
    //   iosBundleId: 'com.petomate.community',
    //   iosClientId:
    //       '1038045422342-2veomn1s7o1av3mshvidp1iodjdtltld.apps.googleusercontent.com',
    // );

    /// Hide Keyboard
    // hideKeyboard();
    messageFieldController.clear();
    loadUI();
  }

  Future<void> chatListPositionupdate(String chatRoomId) async {
    log("chatListPositionupdate 111");
    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .update({"createdAt": Timestamp.now()});
    log("chatListPositionupdate 222");
  }

  FirebaseOptions ios = const FirebaseOptions(
    apiKey:
        'key=AAAA8bBUIwY:APA91bG12B9sECzxamPgdtkucbTWTAaRbxbOhCwwvdJwMQNDUeR0iiQi1YUGrf4FO1gruIcaoE3kxTvSEtMrhz_Py5Uo-t1lNzd1g1HGTjmAbOtcZeeyz7xDHEaTzrQHZId9NL1cV_Ey',
    appId: '1:1038045422342:ios:02579013f7bc208583f487',
    messagingSenderId: '1038045422342',
    projectId: 'petomate-c3a84',
    iosBundleId: 'com.petomate.community',
    iosClientId:
        '1038045422342-2veomn1s7o1av3mshvidp1iodjdtltld.apps.googleusercontent.com',
  );

  Future<void> sendGeneralNotification({
    required String opponentToken,
    required String title,
    required String body,
  }) async {
    try {
      http.Response response =
          await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAA8bBUIwY:APA91bG12B9sECzxamPgdtkucbTWTAaRbxbOhCwwvdJwMQNDUeR0iiQi1YUGrf4FO1gruIcaoE3kxTvSEtMrhz_Py5Uo-t1lNzd1g1HGTjmAbOtcZeeyz7xDHEaTzrQHZId9NL1cV_Ey'
              },
              body: jsonEncode({
                'priority': 'high',
                'data': {
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                  'status': 'done',
                  'body': body,
                  'title': title
                },
                'notification': {
                  'title': title,
                  'body': body,
                  'android_channel_id': 'petomate'
                },
                "to": opponentToken,
              }));

      log('PushNotification Response : $response');
      // NotificationModel notificationModel = NotificationModel.fromJson(json.decode(response.body));
      // Fluttertoast.showToast(
      //   msg: "Notification : ${messageFieldController.text.trim()}",

      // );
    } catch (e) {
      log('sendGeneralNotification Error :$e');
      rethrow;
    }

    
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

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initilize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(
      initializationSettings,
      //     onSelectNotification: (String? payload) {
      //   print(payload);
      // }
    );
  }

  static void showNotificationOnForeground(RemoteMessage message) {
    final notificationDetail = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.petomate.community", "com.petomate.community",
            importance: Importance.max, priority: Priority.high));

    _notificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetail,
        payload: message.data["message"]);
  }
}
