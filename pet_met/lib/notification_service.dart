// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart';
// import 'package:pet_met/models/receive_message_model/send_message_model.dart';
// import 'package:pet_met/utils/user_details.dart';
// import 'package:pet_met/utils/user_preference.dart';
//
// class LocalNotificationService {
//   static String serverKey =
//       "AAAA8bBUIwY:APA91bG12B9sECzxamPgdtkucbTWTAaRbxbOhCwwvdJwMQNDUeR0iiQi1YUGrf4FO1gruIcaoE3kxTvSEtMrhz_Py5Uo-t1lNzd1g1HGTjmAbOtcZeeyz7xDHEaTzrQHZId9NL1cV_Ey";
//
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   static void initialize() {
//     // initializationSettings  for Android
//     InitializationSettings initializationSettings =
//     const InitializationSettings(
//       android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//     );
//
//     _notificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }
//
//   static void disPlay(RemoteMessage message) async {
//     try {
//       log("In notification methode");
//
//       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//       NotificationDetails notificationDetails = const NotificationDetails(
//         android: AndroidNotificationDetails(
//           "pushnotificationapp",
//           "pushnotificationappchannel",
//           "",
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       );
//
//       await _notificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
//
// // static Future<void> sendPushNotification(
// //     SendMessageModel sendMessageModel) async {
// //   UserPreference userPreference = UserPreference();
//
// //   log("sendPushNotification 111");
// //   String userFcmToken = await userPreference.getFcmFromPrefs();
// //   try {
// //     final body = {
// //       "to": userFcmToken,
// //       "notification": {
// //         "title": UserDetails.userName, //our name should be send
// //         "body": sendMessageModel.message,
// //         "android_channel_id": "chats"
// //       },
// //       // "data": {
// //       //   "some_data": "User ID: ${me.id}",
// //       // },
// //     };
// //     log("sendPushNotification userFcmToken: $userFcmToken");
// //     log("sendPushNotification sendMessageModel.message: ${sendMessageModel.message}");
//
// //     var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
// //         headers: {
// //           HttpHeaders.contentTypeHeader: 'application/json',
// //           HttpHeaders.authorizationHeader:
// //               'key=AAAAY6R0JdY:APA91bHQiDuMrX5oPEYx93FZqQSQuw_ynS0XsBYHLmVtwLIRe0gLg3fyerKx4Xg6Q-jr847SywQgqEV0nvIcxw7dto70YaMFdHQ18_wFJFXuNJtAAg9g5jqeEXgAJrGReQH1uDb72hAS	'
// //         },
// //         body: jsonEncode(body));
// //     log('sendPushNotification Response status: ${res.statusCode}');
// //     log('sendPushNotification Response body: ${res.body}');
// //   } catch (e) {
// //     log('sendPushNotification sendPushNotificationE: $e');
// //   }
// // }
// }
