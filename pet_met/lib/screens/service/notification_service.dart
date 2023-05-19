import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initilize() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
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

  static void showNotificationOnForeground(RemoteMessage message) async {
    final notificationDetail = NotificationDetails(
      android: AndroidNotificationDetails(
          "com.example.firebase_push_notification", "com.petomate.community",
          importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
          threadIdentifier: "com.petomate.community"),
    );

    var android = AndroidInitializationSettings('logo_rs');
    // var initiallizationSettingsIOS = IOSInitializationSettings();
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    var initialSetting = InitializationSettings(
        android: android, iOS: initializationSettingsIOS);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initialSetting);

    _notificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetail,
        payload: message.data["message"]);

    // _notificationsPlugin.show(
    //         message.notification.hashCode,
    //         message.notification!.title,
    //         message.notification!.body,

    //         const NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             '1',
    //             'User Activity',
    //             channelDescription: "myjeweller",
    //             importance: Importance.max,
    //             priority: Priority.high,
    //             ticker: 'ticker',
    //             icon: 'ic_launcher',
    //           ),
    //         ),

    //         payload: message.notification!.android!.smallIcon,
    //       );
  }

  static void forgroundMessage(RemoteMessage message) async {
    final notificationDetail = NotificationDetails(
      android: AndroidNotificationDetails(
          "com.example.firebase_push_notification", "com.petomate.community",
          importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
          threadIdentifier: "com.petomate.community"),
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _notificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetail,
        payload: message.data["message"]);
  }
}
