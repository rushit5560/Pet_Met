
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;


  void firebaseNotificationGetInActiveState() async {
    FirebaseMessaging.onMessage.listen((message) {
      log('Noti Title : ${message.notification!.title}');
      log('Noti Body : ${message.notification!.body }');

      Get.snackbar(
          "${message.notification!.title}",
          "${message.notification!.body}",
      );
    });
  }
}